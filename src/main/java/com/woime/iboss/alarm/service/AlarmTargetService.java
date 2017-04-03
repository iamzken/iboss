package com.woime.iboss.alarm.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woime.iboss.alarm.persistence.domain.AlarmCondition;
import com.woime.iboss.alarm.persistence.domain.AlarmTableRelation;
import com.woime.iboss.alarm.persistence.domain.AlarmTarget;
import com.woime.iboss.alarm.persistence.manager.AlarmConditionManager;
import com.woime.iboss.alarm.persistence.manager.AlarmRelationManager;
import com.woime.iboss.alarm.persistence.manager.AlarmTargetManager;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;

@Service
public class AlarmTargetService {

    @Resource
    AlarmTargetManager alarmTargetManager;
	@Autowired
	private AlarmConditionManager alarmConditionManager;
	@Autowired
	private AlarmRelationManager alarmRelationManager;
    @Resource
    AlarmService alarmService;
    
	public Page page(Page page, List<PropertyFilter> propertyFilters) {
		return alarmTargetManager.pagedQuery(page, propertyFilters);
	}
    
    @Transactional(readOnly = false)
	public void add(AlarmTarget alarmTarget) {
		//主表数据保存
    	alarmTargetManager.save(alarmTarget);
		//三张或三张以上表数据采集时,没有表数据关联和查询条件
		if(alarmTarget.getDbTableCount()==3){
			return;
		}
		//查询条件保存
		if (alarmTarget.getConditions() != null) {
			List<AlarmCondition> gcList = alarmTarget.getConditions();
			List<AlarmCondition> deleteList = new ArrayList<AlarmCondition>();
			for (AlarmCondition alarmCondition : gcList) {
				if (alarmCondition.getColName() == null
						|| "".equals(alarmCondition.getColName())) {
					deleteList.add(alarmCondition);
				}
				alarmCondition.setGo(alarmTarget);
			}
			gcList.removeAll(deleteList);
			for (AlarmCondition alarmCondition : gcList) {
				alarmConditionManager.save(alarmCondition);
			}
		}
		//表关联数据保存
		AlarmTableRelation relation = alarmTarget.getRelation();
		if (relation != null) {
			relation.setAlarmTargetId(alarmTarget.getId());
			alarmRelationManager.save(relation);
		}
		
	}

	@Transactional(readOnly = false)
	public void modify(AlarmTarget alarmTarget) {
		//查询采集对象
		AlarmTarget old = alarmTargetManager.get(alarmTarget.getId());
		old.setName(alarmTarget.getName());
		old.setSql(alarmTarget.getSql());
		old.setDbTableCount(alarmTarget.getDbTableCount());
		alarmTargetManager.save(old);
		//检索条件
		if (alarmTarget.getConditions() != null) {
			//删除所有查询条件
			alarmConditionManager.removeAll(alarmConditionManager.findBy(
					"go", alarmTarget));
			List<AlarmCondition> gcList = alarmTarget.getConditions();
			List<AlarmCondition> deleteList = new ArrayList<AlarmCondition>();
			for (AlarmCondition gatherCondition : gcList) {
				if (gatherCondition.getColName() == null
						|| "".equals(gatherCondition.getColName())) {
					deleteList.add(gatherCondition);
				}
				gatherCondition.setGo(alarmTarget);
			}
			gcList.removeAll(deleteList);
			for (AlarmCondition gatherCondition : gcList) {
				alarmConditionManager.save(gatherCondition);
			}
		}
		//三张或三张以上表数据采集时,没有表数据关联和查询条件
		if(alarmTarget.getDbTableCount()!=2){
			return;
		}
		
		//表关联管理数据修改
		AlarmTableRelation oldRelation = alarmRelationManager.findUniqueBy("alarmTargetId",alarmTarget.getId());
		//原来删除
		if(oldRelation!=null){
			alarmRelationManager.removeById(oldRelation.getId());
		}
		//新增表关联关系
		AlarmTableRelation relation = alarmTarget.getRelation();
		if(relation!=null){}{
			relation.setAlarmTargetId(alarmTarget.getId());
			alarmRelationManager.save(relation);
		}

	}

	@Transactional(readOnly = false)
	public void remove(Long id) {
		alarmTargetManager.removeById(id);
		alarmConditionManager.removeAll(alarmConditionManager.find(
				"from AlarmCondition t where t.go.id = ?", id));
		alarmRelationManager.removeAll(alarmRelationManager.find(
				"from AlarmTableRelation t where t.alarmTargetId = ?", id));
		
	}

	public AlarmTarget get(Long id) {
		AlarmTarget result = alarmTargetManager.get(id);
		
		try {
			if (result != null&&result.getDbTableCount()!=3) {
				
				result.setConditions(alarmConditionManager.findBy("go", result));
		
			
				if(result.getDbTableCount()==2){
					//数据采集表关联关系 不能沒有 TODO
					AlarmTableRelation relation = alarmRelationManager
							.findUniqueBy("alarmTargetId", id);
					result.setRelation(relation);
		
					result.setTblColumns(alarmService.queryColumnNamesFromTable(relation.getDbTableName1()
							));
					result.setTblColumns2(alarmService.queryColumnNamesFromTable(relation.getDbTableName2()
							));
					
				}
			
			}
		} catch (Exception e) {
			
		}
		
		return result;
	}

    
}
