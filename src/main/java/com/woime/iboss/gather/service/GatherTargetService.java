package com.woime.iboss.gather.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.gather.persistence.domain.GatherResultQueryModel;
import com.woime.iboss.gather.persistence.domain.GatherTarget;
import com.woime.iboss.gather.persistence.domain.GatherTargetColumn;
import com.woime.iboss.gather.persistence.manager.GatherTargetColumnManager;
import com.woime.iboss.gather.persistence.manager.GatherTargetManager;
import com.woime.iboss.gather.support.DBUtils;

@Transactional(readOnly = true)
@Service
public class GatherTargetService {
	private static final Logger logger = LoggerFactory.getLogger(GatherTargetService.class);
    @Autowired
    private GatherTargetManager targetManager;
    @Autowired
    private GatherTargetColumnManager targetColumnManager;

    public GatherTargetManager getTargetManager() {
        return targetManager;
    }

    public void setTargetManager(GatherTargetManager targetManager) {
        this.targetManager = targetManager;
    }

    public GatherTargetColumnManager getTargetColumnManager() {
        return targetColumnManager;
    }

    public void setTargetColumnManager(GatherTargetColumnManager targetColumnManager) {
        this.targetColumnManager = targetColumnManager;
    }

    public Page page(Page page, List<PropertyFilter> buildFromMap) {
        return targetManager.pagedQuery(page, buildFromMap);
    }

    @Transactional(readOnly = false)
    public void add(GatherTarget gt) throws SQLException {
        targetManager.save(gt);
        if (gt.getColumns() != null)
		{
        	int i = 0;
        	List<GatherTargetColumn> columns = gt.getColumns();
        	for (GatherTargetColumn gatherTargetColumn : columns)
			{
        		if (gatherTargetColumn != null && gatherTargetColumn.getName() != null && !gatherTargetColumn.getName().equals(""))
				{
	        		i++;
	        		gatherTargetColumn.setTarget(gt);
	        		gatherTargetColumn.setOrders(i);
	        		targetColumnManager.save(gatherTargetColumn);
				}
			}
		}
        //建表
        DBUtils db = new DBUtils();
        db.createTable(gt);
    }

    @Transactional(readOnly = false)
    public void update(GatherTarget gt) throws SQLException {
        targetManager.update(gt);
        if (gt.getColumns() != null)
		{
        	targetColumnManager.removeAll(targetColumnManager.find("from GatherTargetColumn t where t.target = ?", gt));
        	List<GatherTargetColumn> columns = gt.getColumns();
        	for (GatherTargetColumn gatherTargetColumn : columns)
			{
        		if (gatherTargetColumn != null && gatherTargetColumn.getName() != null && !gatherTargetColumn.getName().equals(""))
				{
            		gatherTargetColumn.setTarget(gt);
            		targetColumnManager.save(gatherTargetColumn);
				}
			}
            DBUtils db = new DBUtils();
            try {
				db.dropTable(gt.getDbTableName());
			} catch (Exception e) {
				logger.info(e.getMessage());
			}
            db.createTable(gt);
		}
    }

    @Transactional(readOnly = false)
    public void remove(Long id) {
    	GatherTarget gt = targetManager.get(id);
        targetManager.removeById(id);
    	targetColumnManager.removeAll(targetColumnManager.find("from GatherTargetColumn t where t.target.id = ? ", id));
    	//删除物理表
        DBUtils db = new DBUtils();
        db.dropTable(gt.getDbTableName());
    }

    @SuppressWarnings("unchecked")
	public GatherTarget get(Long id) {
    	GatherTarget result = targetManager.get(id);
    	if (result != null)
		{
    		result.setColumns(targetColumnManager.find("from GatherTargetColumn t where t.target = ? order by orders", result));
		}
        return result;
    }

    public List<GatherTarget> all() {
        return targetManager.getAll();
    }
    
	public Map<String,Object> queryResult(GatherResultQueryModel qm, int pageSize, int pageNo,Long counts) throws SQLException
	{
		Long targetId = qm.getTargetId();
		GatherTarget target = get(targetId);
		if (target != null)
		{
			String dbTableName = target.getDbTableName();
			DBUtils db = new DBUtils();
			return db.getCurrentPageSql(dbTableName, qm, pageSize, pageNo,counts);
		}
		return null;
	}

}
