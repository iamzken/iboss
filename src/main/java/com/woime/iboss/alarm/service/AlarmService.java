package com.woime.iboss.alarm.service;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.sql.DataSource;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.quartz.CronExpression;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.woime.iboss.alarm.persistence.domain.AlarmConfig;
import com.woime.iboss.alarm.persistence.domain.AlarmInfo;
import com.woime.iboss.alarm.persistence.domain.AlarmNoticeReciver;
import com.woime.iboss.alarm.persistence.domain.AlarmParameter;
import com.woime.iboss.alarm.persistence.domain.AlarmTarget;
import com.woime.iboss.alarm.persistence.domain.AutoConfirm;
import com.woime.iboss.alarm.persistence.manager.AlarmConfigManager;
import com.woime.iboss.alarm.persistence.manager.AlarmInfoManager;
import com.woime.iboss.alarm.persistence.manager.AlarmNoticeReciverManager;
import com.woime.iboss.alarm.persistence.manager.AlarmParameterManager;
import com.woime.iboss.alarm.persistence.manager.AlarmTargetManager;
import com.woime.iboss.alarm.persistence.manager.AutoConfirmManager;
import com.woime.iboss.alarm.utils.AlarmUpGradeUtils;
import com.woime.iboss.core.hibernate.HibernateUtils;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.gather.support.DBTableSchema;
import com.woime.iboss.quartz.ScheduleJobService;
import com.woime.iboss.quartz.module.ScheduleJob;
import com.woime.iboss.quartz.vo.ScheduleJobVo;
import com.woime.iboss.user.persistence.manager.UserBaseManager;

/**
 * Created by raozhikun on 2017/2/13.
 */
@Service
public class AlarmService {

    private static Logger logger = LoggerFactory.getLogger(AlarmService.class);

    @Resource
    AlarmTargetManager alarmTargetManager;

    @Resource
    AlarmInfoManager alarmInfoManager;

    @Resource
    AlarmConfigManager alarmConfigManager;

    @Resource
    UserBaseManager userBaseManager;

    @Resource
    AlarmNoticeReciverManager alarmNoticeReciverManager;
    
	
	@Value("${alarm_interval:120000}")
    long alarm_interval;
	
	
    @Resource
    AutoConfirmManager autoConfirmManager;
    
    @Resource
    AlarmParameterManager alarmParameterManager;

    @Resource
    DataSource dataSource;


    public Map<Long, Long> alarmCount(){
        String hql = "select a.neId, count(1) as num from AlarmInfo a where a.status in (1, 2, 3) GROUP BY a.neId";
        List<Object[]> list = alarmInfoManager.createQuery(hql).list();
        Map<Long, Long> count = new HashMap<>();
        for(Object[] objects : list){
            count.put((Long)objects[0], (Long)objects[1]);
        }
        return count;
    }

    @Transactional(readOnly = false)
    public void saveAlarmConfig(AlarmConfig alarmConfig) {
        alarmConfigManager.save(alarmConfig);
        if (alarmConfig.getEmailRecevierIds() != null && alarmConfig.getEmailRecevierIds().length != 0) {
            for (long userid : alarmConfig.getEmailRecevierIds()) {
                alarmNoticeReciverManager.save(new AlarmNoticeReciver("email", userid, alarmConfig.getId()));
            }
        }
        if (alarmConfig.getSmsRecevierIds() != null && alarmConfig.getSmsRecevierIds().length != 0) {
            for (long userid : alarmConfig.getSmsRecevierIds()) {
                alarmNoticeReciverManager.save(new AlarmNoticeReciver("sms", userid, alarmConfig.getId()));
            }
        }
        logger.info("save alarm config,id={}", alarmConfig.getId());

    }

    @Transactional(readOnly = false)
    public void updateAlarmConfig(AlarmConfig alarmConfig) {
        alarmConfigManager.update(alarmConfig);
        alarmNoticeReciverManager.deleteAlarmNoticeReciverByConfig(alarmConfig.getId());
        if (alarmConfig.getEmailRecevierIds() != null && alarmConfig.getEmailRecevierIds().length != 0) {
            for (long userid : alarmConfig.getEmailRecevierIds()) {
                alarmNoticeReciverManager.save(new AlarmNoticeReciver("email", userid, alarmConfig.getId()));
            }
        }
        if (alarmConfig.getSmsRecevierIds() != null && alarmConfig.getSmsRecevierIds().length != 0) {
            for (long userid : alarmConfig.getSmsRecevierIds()) {
                alarmNoticeReciverManager.save(new AlarmNoticeReciver("sms", userid, alarmConfig.getId()));
            }
        }
    }

    @Transactional(readOnly = false)
    public void removeAlarmConfig(long alarmConfigId) {
        alarmNoticeReciverManager.deleteAlarmNoticeReciverByConfig(alarmConfigId);
        alarmConfigManager.removeById(alarmConfigId);
    }

    public AlarmConfig getAlarmConfig(long alarmConfigId) {
        AlarmConfig alarmConfig = alarmConfigManager.get(alarmConfigId);
        if (alarmConfig == null) return alarmConfig;
        /*alarmConfig.setSmsReceviers(alarmNoticeReciverManager.findByConfigIdAndType(alarmConfigId, "sms"));
        alarmConfig.setEmailReceviers(alarmNoticeReciverManager.findByConfigIdAndType(alarmConfigId, "email"));*/
        return alarmConfig;
    }

    @Transactional(readOnly = false)
    public void confirmAlarmInfo(long id) {
        AlarmInfo alarmInfo = alarmInfoManager.get(id);
        alarmInfo.setStatus(3);
        alarmInfo.setConfirmTime(new Date());
        alarmInfoManager.update(alarmInfo);
    }


    public void cleanAlarmInfo(AlarmInfo alarmInfo) {
        AlarmInfo _alarmInfo = alarmInfoManager.get(alarmInfo.getId());
        _alarmInfo.setStatus(4);
        _alarmInfo.setReasonType(alarmInfo.getReasonType());
        _alarmInfo.setCauses(alarmInfo.getCauses());
        _alarmInfo.setCheckSql(alarmInfo.getCheckSql());
        _alarmInfo.setSummary(alarmInfo.getSummary());
        _alarmInfo.setCleanTime(new Date());
        alarmInfoManager.update(_alarmInfo);
    }

    public boolean testAlarmTarget(AlarmTarget alarmTarget) {
        try {
            Object ret = alarmTargetManager.getSession().createSQLQuery(alarmTarget.getSql()).uniqueResult();
            logger.info("test sql={}, ret={}", alarmTarget.getSql(), ret);
            return true;
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
            return false;
        }
    }

    public void alarm(AlarmConfig alarmConfig) {
        try {
            String sql = "select count(1) as num from (" + alarmConfig.getAlarmTarget().getSql() + ") a where a.target"  + (alarmConfig.getThreshold().indexOf(",") > 0 ? (" BETWEEN " + alarmConfig.getThreshold().replace(",", " AND ")) : alarmConfig.getThreshold() );
            AlarmInfo alarmInfo = alarmInfoManager.getUncheckedAlarmInfoByAlarmConfig(alarmConfig.getId());
            Object ret = query(alarmConfig.getAlarmTarget().getSql());
            logger.info("exe alarm, id={}, name={}, ret={}", alarmConfig.getId(), alarmConfig.getName(), ret);
            if (query(sql).toString().equals("1")) {
                if (alarmInfo == null) {
                    alarmInfo = new AlarmInfo();
                    alarmInfo.setConfig(alarmConfig);
                    alarmInfo.setNeId(alarmConfig.getNeId());
                    alarmInfo.setStatus(1);
                    alarmInfo.setFrequency(1);
                    alarmInfo.setFirstTime(new Date());
                    alarmInfo.setLastTime(new Date());
                    alarmInfo.setResult(ret == null ? "" : ret.toString());
                    alarmInfo.setLevels(alarmConfig.getLevels());
                    alarmInfoManager.save(alarmInfo);
                } else {  //已经在告警
                    alarmInfo.setFrequency(alarmInfo.getFrequency() + 1);
                    alarmInfo.setLastTime(new Date());
                    alarmInfo.setResult(ret == null ? "" : ret.toString());
                    //升级
                    AlarmUpGradeUtils.upGradeAlarm(alarmInfo);
                    alarmInfoManager.update(alarmInfo);
                }

                //todo  发送告警通知
            } else if (alarmInfo != null) {
                alarmInfo.setStatus(3);
                alarmInfoManager.update(alarmInfo);
            }
        } catch (Exception e) {
            logger.error("{}", e.getMessage(), e);
        } finally {

            //alarmTargetManager.getSession().close();
        }
    }



    public Object query(String sql) throws SQLException {
        Connection conn = null;
        ResultSet rs = null;
        try {
            conn = dataSource.getConnection();
            Statement st = conn.createStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                return rs.getObject(1);
            }
            return null;
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }


    @Resource
    ScheduleJobService jobService;

    @PostConstruct
    public void schedule() {
        new Thread(new Runnable() {
            @Override
            public void run() {
                while (true) {
                    try {
                        Thread.sleep(alarm_interval);
                        logger.info("alarm task update");
                        List<AlarmConfig> alarmConfigList = alarmConfigManager.getAll();
                        for (AlarmConfig alarmConfig : alarmConfigList) {
                            if(StringUtils.isEmpty(alarmConfig.getFrequency()) || !CronExpression.isValidExpression(alarmConfig.getFrequency())){
                                continue;
                            }
                            if(alarmConfig.getEndTime().getTime() < new Date().getTime()){
                                jobService.delete(alarmConfig.getId().toString(), "alarm");
                            }else if(alarmConfig.getStartTime().getTime() < new Date().getTime()){
                                ScheduleJobVo scheduleJobVo = jobService.get(alarmConfig.getId());
                                ScheduleJob sj = new ScheduleJob();
                                sj.setAliasName(alarmConfig.getName());
                                sj.setCronExpression(alarmConfig.getFrequency());
                                sj.setDescription(alarmConfig.getComments());
                                sj.setGmtCreate(new Date());
                                sj.setGmtModify(new Date());
                                sj.setIsSync(true);
                                sj.setJobGroup("alarm");
                                sj.setJobName(alarmConfig.getId().toString());
                                sj.setScheduleJobId(alarmConfig.getId());
                                sj.setStatus("1");
                                if(scheduleJobVo == null){
                                    jobService.insert(sj);
                                }else{
                                    jobService.delUpdate(sj);
                                }
                                logger.info("alarm task id={}, name={} updated", alarmConfig.getId(), alarmConfig.getName());
                            }
                        }
                    } catch (Exception e) {
                        logger.error("{}", e.getMessage(), e);
                    }
                }
            }
        }, "alarm-manage-schedule").start();
    }

    public List<DBTableSchema> queryColumnNamesFromTable(String tableName) throws Exception {
        Connection conn = null;
        ResultSet rs = null;
        List<DBTableSchema> result = new ArrayList<>();
        try {
            conn = dataSource.getConnection();
            DatabaseMetaData dmd = conn.getMetaData();
            rs = dmd.getColumns(conn.getCatalog(), null, tableName, null);
            DBTableSchema schema;
            while (rs.next()) {
                schema = new DBTableSchema();
                schema.setColName(rs.getString("COLUMN_NAME"));
                schema.setType(rs.getString("TYPE_NAME"));
                result.add(schema);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public Page pagedQuery(Page page, List<PropertyFilter> propertyFilters) {
        List<PropertyFilter> configPropertyFilters = new ArrayList<>();
        List<PropertyFilter> infoPropertyFilters = new ArrayList<>();
        for(PropertyFilter propertyFilter : propertyFilters){
            if(propertyFilter.getPropertyName().equals("alarmTarget.id") || propertyFilter.getPropertyName().equals("name") || propertyFilter.getPropertyName().equals("neId")){
                configPropertyFilters.add(propertyFilter);
            }else{
                infoPropertyFilters.add(propertyFilter);
            }
        }

        List<Criterion> criterions = new ArrayList<>(Arrays.asList(HibernateUtils.buildCriterion(infoPropertyFilters)));

        if(configPropertyFilters.size() != 0){
            List<AlarmConfig> alarmConfigs = alarmConfigManager.find(configPropertyFilters);
            criterions.add(Restrictions.in("config", alarmConfigs));
        }
        return alarmInfoManager.pagedQuery(page.getPageNo(), page.getPageSize(), "lastTime", false, criterions.toArray(new Criterion[criterions.size()]));
    }



    public Object queryAlarmInfo(Long neId, Integer alarmLevel, Integer alarmStatus, Long alarmTargetId, String alarmName, int pageSize) {
        List<AlarmConfig> alarmConfigs = alarmConfigManager.getAll();
        List<AlarmConfig> _alarmConfigs = new ArrayList<>();
        if(neId != null){
            for(AlarmConfig alarmConfig : alarmConfigs){
                if(alarmConfig.getNeId() == neId){
                    _alarmConfigs.add(alarmConfig);
                }
            }

            alarmConfigs = _alarmConfigs;
        }

        if(alarmTargetId != null){
            for(AlarmConfig alarmConfig : alarmConfigs){
                if(alarmConfig.getAlarmTarget().getId() == alarmTargetId){
                    _alarmConfigs.add(alarmConfig);
                }
            }

            alarmConfigs = _alarmConfigs;
        }

        if(StringUtils.hasText(alarmName)){
            for(AlarmConfig alarmConfig : alarmConfigs){
                if(alarmConfig.getName().contains(alarmName)){
                    _alarmConfigs.add(alarmConfig);
                }
            }

            alarmConfigs = _alarmConfigs;
        }


        return null;
    }
    
    @Transactional(readOnly = false)
    public void updateAutoConfirm(AutoConfirm autoConfirm) {
    	autoConfirmManager.update(autoConfirm);
    }
    
    public List<AutoConfirm> getAllAutoConfirm() {
    	return autoConfirmManager.getAll();
    }
    
    public List<AlarmParameter> getAlarmParameter() {
    	return alarmParameterManager.getAll();
    }
}
