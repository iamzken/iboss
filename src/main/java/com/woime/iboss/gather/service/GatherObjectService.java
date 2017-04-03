package com.woime.iboss.gather.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.gather.persistence.domain.GatherCondition;
import com.woime.iboss.gather.persistence.domain.GatherObject;
import com.woime.iboss.gather.persistence.domain.GatherSource;
import com.woime.iboss.gather.persistence.domain.GatherTableRelation;
import com.woime.iboss.gather.persistence.manager.GatherConditionManager;
import com.woime.iboss.gather.persistence.manager.GatherObjectManager;
import com.woime.iboss.gather.persistence.manager.GatherSourceManager;
import com.woime.iboss.gather.persistence.manager.GatherTableRelationManager;

/**
 * @author Chen Yujian on 2017/2/7 17:38.
 */
@Transactional
@Service
public class GatherObjectService {

	@Autowired
	private GatherObjectManager gatherObjectManager;
	@Autowired
	private GatherConditionManager gatherConditionManager;

	@Autowired
	private GatherTableRelationManager gatherTableRelationManager;
    @Autowired
    private GatherSourceService gatherSourceService;
	@Autowired
	private GatherSourceManager gatherSourceManager;

	public Page page(Page page, List<PropertyFilter> propertyFilters) {
		return gatherObjectManager.pagedQuery(page, propertyFilters);
	}

	@Transactional(readOnly = false)
	public void add(GatherObject gatherObject) {
		//主表数据保存
		gatherObjectManager.save(gatherObject);
		//三张或三张以上表数据采集时,没有表数据关联和查询条件
		if(gatherObject.getDbTableCount()==3){
			return;
		}
		//查询条件保存
		if (gatherObject.getCondition() != null) {
			List<GatherCondition> gcList = gatherObject.getCondition();
			List<GatherCondition> deleteList = new ArrayList<GatherCondition>();
			for (GatherCondition gatherCondition : gcList) {
				if (gatherCondition.getColName() == null
						|| "".equals(gatherCondition.getColName())) {
					deleteList.add(gatherCondition);
				}
				gatherCondition.setGo(gatherObject);
			}
			gcList.removeAll(deleteList);
			for (GatherCondition gatherCondition : gcList) {
				gatherConditionManager.save(gatherCondition);
			}
		}
		//表关联数据保存
		GatherTableRelation relation = gatherObject.getRelation();
		if (relation != null && relation.check()) {
			gatherObject.getRelation().setGatherObjectId(gatherObject.getId());
			gatherTableRelationManager.save(gatherObject.getRelation());
		}
		// 给 采集源的数目加1
		GatherSource gs = gatherSourceManager.get(gatherObject
				.getGatherSource().getId());
		if (gs != null) {
			gs.setQuantity(gs.getQuantity() + 1);
			gatherSourceManager.update(gs);
		}
	}

	@Transactional(readOnly = false)
	public void modify(GatherObject gatherObject) {
		//查询采集对象
		GatherObject old = gatherObjectManager.get(gatherObject.getId());
		old.setName(gatherObject.getName());
		old.setComment(gatherObject.getComment());
		old.setDbTableName(gatherObject.getDbTableName());
		old.setGatherSource(gatherObject.getGatherSource());
		old.setSql(gatherObject.getSql());
		old.setDbTableCount(gatherObject.getDbTableCount());
		gatherObjectManager.save(old);
		//检索条件
		if (gatherObject.getCondition() != null) {
			//删除所有查询条件
			gatherConditionManager.removeAll(gatherConditionManager.findBy(
					"go", gatherObject));
			List<GatherCondition> gcList = gatherObject.getCondition();
			List<GatherCondition> deleteList = new ArrayList<GatherCondition>();
			for (GatherCondition gatherCondition : gcList) {
				if (gatherCondition.getColName() == null
						|| "".equals(gatherCondition.getColName())) {
					deleteList.add(gatherCondition);
				}
				gatherCondition.setGo(gatherObject);
			}
			gcList.removeAll(deleteList);
			for (GatherCondition gatherCondition : gcList) {
				gatherConditionManager.save(gatherCondition);
			}
		}
		//三张或三张以上表数据采集时,没有表数据关联和查询条件
		if(gatherObject.getDbTableCount()!=2){
			return;
		}
		
		//表关联管理数据修改
		GatherTableRelation oldRelation = gatherTableRelationManager.findUniqueBy("gatherObjectId",gatherObject.getId());
		//原来删除
		if(oldRelation!=null){
			gatherTableRelationManager.removeById(oldRelation.getId());
		}
		//新增表关联关系
		GatherTableRelation relation = gatherObject.getRelation();
		if(relation!=null){}{
			relation.setGatherObjectId(gatherObject.getId());
			gatherTableRelationManager.save(relation);
		}

	}

	@Transactional(readOnly = false)
	public void remove(Long id) {
		GatherObject go = gatherObjectManager.get(id);
		GatherSource gs = go.getGatherSource();

		gatherObjectManager.removeById(id);
		gatherConditionManager.removeAll(gatherConditionManager.find(
				"from GatherCondition t where t.go.id = ?", id));
		gatherTableRelationManager.removeAll(gatherTableRelationManager.find(
				"from GatherTableRelation t where t.gatherObjectId = ?", id));
		// 给 采集源的数目减1
		if (gs != null) {
			gs.setQuantity(gs.getQuantity() - 1);
			gatherSourceManager.update(gs);
		}
	}

	public GatherObject get(Long id) {
		GatherObject result = gatherObjectManager.get(id);
		
		try {
			if (result != null&&result.getDbTableCount()!=3) {
				
				result.setCondition(gatherConditionManager.findBy("go", result));
		
				if (result.getDbTableCount() == 1) {
					
					if(result.getDbTableName()!=null){
						result.setTblColumns(gatherSourceService.queryColumnNamesFromTable(result.getGatherSource().getId(),result.getDbTableName()
								));
					}
				}
				if(result.getDbTableCount()==2){
					//数据采集表关联关系 不能沒有 TODO
					GatherTableRelation relation = gatherTableRelationManager
							.findUniqueBy("gatherObjectId", id);
					result.setRelation(relation);
					
					Long sourceId=	result.getGatherSource().getId();
					result.setTblColumns(gatherSourceService.queryColumnNamesFromTable(sourceId,relation.getDbTableName1()
							));
					result.setTblColumns2(gatherSourceService.queryColumnNamesFromTable(sourceId,relation.getDbTableName2()
							));
					
				}
			
			}
		} catch (Exception e) {
			
		}
		
		return result;
	}

	public List<GatherObject> all() {
		return gatherObjectManager.getAll();
	}
}
