package com.woime.iboss.gather.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Maps;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.gather.persistence.domain.GatherSource;
import com.woime.iboss.gather.persistence.manager.GatherSourceManager;
import com.woime.iboss.gather.service.enums.DBType;
import com.woime.iboss.gather.service.enums.GatherSourceStatus;
import com.woime.iboss.gather.support.DBTableSchema;
import com.woime.iboss.gather.support.DBUtils;

/**
 * @author Chen Yujian on 2017/2/7 17:38.
 */
@Transactional(readOnly = true)
@Service
public class GatherSourceService {

    @Autowired
    private GatherSourceManager gatherSourceManager;

    public Page page(Page page, List<PropertyFilter> propertyFilters) {
        return gatherSourceManager.pagedQuery(page, propertyFilters);
    }

    @Transactional(readOnly = false)
    public void add(GatherSource gatherSource) {
        gatherSource.setStatus(GatherSourceStatus.ENABLED);
        gatherSourceManager.save(gatherSource);
    }

    @Transactional(readOnly = false)
    public void modify(GatherSource gatherSource) {
    	GatherSource old = get(gatherSource.getId());
//        gatherSourceManager.get(gatherSource.getId());
        old.setName(gatherSource.getName());
        old.setIp(gatherSource.getIp());
        old.setDbType(gatherSource.getDbType());
        old.setDbUser(gatherSource.getDbUser());
        old.setDbPassword(gatherSource.getDbPassword());
        old.setDbPort(gatherSource.getDbPort());
        old.setDbSid(gatherSource.getDbSid());
        if(old.getStatus() == null) {
            old.setStatus(GatherSourceStatus.DISABLED);
        }
        gatherSourceManager.save(old);
    }

    @Transactional(readOnly = false)
    public void remove(Long id) {
        gatherSourceManager.removeById(id);
    }

    @Transactional(readOnly = false)
    public GatherSource toggle(Long id) {
        GatherSource gatherSource = gatherSourceManager.get(id);
        if(Objects.equals(gatherSource.getStatus(), GatherSourceStatus.ENABLED)) {
            gatherSource.setStatus(GatherSourceStatus.DISABLED);
        } else {
            gatherSource.setStatus(GatherSourceStatus.ENABLED);
        }
        gatherSourceManager.save(gatherSource);
        return gatherSource;
    }

    public GatherSource get(Long id) {
        return gatherSourceManager.get(id);
    }

    public Map<String, Object> testConnection(GatherSource gatherSource) {
    	if (gatherSource != null && gatherSource.getId() != null)
		{
    		gatherSource = gatherSourceManager.get(gatherSource.getId());
		}
    	
        Map<String, Object> result = Maps.newHashMap();
        result.put("result", false);
        if(Objects.equals(gatherSource.getDbType(), DBType.MYSQL.getCode())) {
            return connect2mysql(gatherSource);
        } else if(Objects.equals(gatherSource.getDbType(), DBType.SQLSERVER.getCode())) {
            return result;
        } else 
        	if(Objects.equals(gatherSource.getDbType(), DBType.ORACLE.getCode())) {
        	return connect2oracle(gatherSource);
        }
        return result;
    }

    private Map<String, Object> connect2oracle(GatherSource gatherSource)
	{
        Map<String, Object> result = Maps.newHashMap();
        result.put("result", false);
        Connection conn = null;
        try {
        	if (gatherSource.getIp() == null || "".equals(gatherSource.getIp())) {
            	result.put("result", false);
                result.put("message", "请填写服务器地址");
                return result;
			}
        	else
        	{
                Class.forName("oracle.jdbc.OracleDriver");
                String url = "jdbc:oracle:thin:@" + gatherSource.getIp() + ":" + gatherSource.getDbPort() + ":" + gatherSource.getDbSid();
                conn = DriverManager.getConnection(url, gatherSource.getDbUser(), gatherSource.getDbPassword());
                result.put("result", true);
                result.put("message", "连接成功！");
        	}
        } catch (Exception e) {
        	result.put("result", false);
            result.put("message", e.getMessage());
        }
        finally
        {
        	if (conn != null)
			{
				try
				{
					conn.close();
				}
				catch (SQLException e)
				{
				}
			}
        }
        return result;
    }

	private Map<String, Object> connect2mysql(GatherSource gatherSource) {
        Map<String, Object> result = Maps.newHashMap();
        result.put("result", false);
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://" + gatherSource.getIp() + ":" + gatherSource.getDbPort() + "/" + gatherSource.getDbSid();
            conn = DriverManager.getConnection(url, gatherSource.getDbUser(), gatherSource.getDbPassword());
            result.put("result", true);
            result.put("message", "连接成功！");
        } catch (Exception e) {
            result.put("message", "加载驱动失败！");
        }
        finally
        {
        	if (conn != null)
			{
				try
				{
					conn.close();
				}
				catch (SQLException e)
				{
					// TODO Auto-generated catch block
				}
			}
        }
        return result;
    }

	public List<GatherSource> queryAllSource()
	{
		return gatherSourceManager.getAll();
	}

	public List<String> queryTableNamesFromGatherSource(Long id) throws Exception
	{
		GatherSource gs = gatherSourceManager.get(id);
		
		DBUtils db = new DBUtils();
		try
		{
			return db.getAllTableNames(gs);
		}
		catch (Exception e)
		{
			throw e;
		}
	}

	public List<DBTableSchema> queryColumnNamesFromTable(Long id, String tableName) throws Exception
	{
		GatherSource gs = gatherSourceManager.get(id);
		
		DBUtils db = new DBUtils();
		try
		{
			return db.getTableSchema(tableName, gs);
		}
		catch (Exception e)
		{
			throw e;
		}
	}

}
