package com.woime.iboss.alarm.persistence.manager;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.woime.iboss.alarm.persistence.domain.AlarmInfo;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class AlarmInfoManager extends HibernateEntityDao<AlarmInfo> {

    public AlarmInfo getUncheckedAlarmInfoByAlarmConfig(long alarmConfigId) {
        Criteria criteria = this.createCriteria(AlarmInfo.class, "lastTime", false, Restrictions.eq("config.id", alarmConfigId), Restrictions.in("status", new Integer[]{1, 2, 3}));
        List<AlarmInfo> infos = criteria.list();
        return infos == null || infos.size() == 0 ? null : infos.get(0);
    }

}
