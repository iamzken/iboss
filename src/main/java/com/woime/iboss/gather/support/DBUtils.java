package com.woime.iboss.gather.support;

import java.io.File;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.woime.iboss.core.spring.ApplicationContextHelper;
import com.woime.iboss.gather.persistence.domain.GatherObject;
import com.woime.iboss.gather.persistence.domain.GatherPlanTask;
import com.woime.iboss.gather.persistence.domain.GatherResultQueryModel;
import com.woime.iboss.gather.persistence.domain.GatherSource;
import com.woime.iboss.gather.persistence.domain.GatherTarget;
import com.woime.iboss.gather.persistence.domain.GatherTargetColumn;
import com.woime.iboss.gather.service.enums.DBType;
import com.woime.iboss.quartz.support.CSVExporter;
import com.woime.iboss.quartz.support.CSVLoader;

/**
 * 数据库工具
 * 
 * @author 王国栋
 *
 */
public class DBUtils
{
	private static final Logger logger = LoggerFactory.getLogger(DBUtils.class);

	private JdbcTemplate get(String url, String className, String userName, String password)
	{
		// 创建数据源
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		// 设置数据库连接信息
		dataSource.setUrl(url);
		dataSource.setDriverClassName(className);
		dataSource.setUsername(userName);
		dataSource.setPassword(password);

		// 创建连接数据库的对象JdbcTemplate
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		return jdbcTemplate;
	}

	/**
	 * 获取所有的表名
	 * 
	 * @param source
	 * @return
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */
	public List<String> getAllTableNames(GatherSource source) throws ClassNotFoundException, SQLException
	{
		JdbcTemplate jt = null;
		Connection conn = null;
		ResultSet rs = null;
		List<String> result;
		try
		{
			result = new ArrayList<String>();
			if (Objects.equals(source.getDbType(), DBType.MYSQL.getCode()))
			{
				jt = get("jdbc:mysql://" + source.getIp() + "/" + source.getDbSid(), "com.mysql.jdbc.Driver", source.getDbUser(), source.getDbPassword());
			}
			else if (Objects.equals(source.getDbType(), DBType.ORACLE.getCode()))
			{
				// oracle
				jt = get("jdbc:oracle:thin:@" + source.getIp() + ":" + source.getDbPort() + ":" + source.getDbSid(), "oracle.jdbc.OracleDriver", source.getDbUser(), source.getDbPassword());
			}
			conn = jt.getDataSource().getConnection();
			DatabaseMetaData dmd = conn.getMetaData();
			rs = dmd.getTables(conn.getCatalog(), source.getDbUser(), null, new String[] { "TABLE" });
			while (rs.next())
			{
				result.add(rs.getString("TABLE_NAME"));
			}
		}
		finally
		{
			if (rs != null)
			{
				rs.close();
			}
			if (conn != null)
			{
				conn.close();
			}
		}
		return result;
	}

	/**
	 * 获取指定表的所有列
	 * 
	 * @param tableName
	 * @param source
	 * @return
	 * @throws SQLException
	 */
	public List<DBTableSchema> getTableSchema(String tableName, GatherSource source) throws SQLException
	{

		JdbcTemplate jt = null;
		Connection conn = null;
		ResultSet rs = null;
		List<DBTableSchema> result = null;
		try
		{
			result = new ArrayList<DBTableSchema>();
			if (Objects.equals(source.getDbType(), DBType.MYSQL.getCode()))
			{
				jt = get("jdbc:mysql://" + source.getIp() + ":" + source.getDbPort() + "/" + source.getDbSid(), "com.mysql.jdbc.Driver", source.getDbUser(), source.getDbPassword());
			}
			else if (Objects.equals(source.getDbType(), DBType.ORACLE.getCode()))
			{
				// oracle
				jt = get("jdbc:oracle:thin:@" + source.getIp() + ":" + source.getDbPort() + ":" + source.getDbSid(),"oracle.jdbc.OracleDriver",source.getDbUser(),source.getDbPassword());
			}
			conn = jt.getDataSource().getConnection();
			DatabaseMetaData dmd = conn.getMetaData();
			rs = dmd.getColumns(conn.getCatalog(), null, tableName, null);
			DBTableSchema schema;
			while (rs.next())
			{
				schema = new DBTableSchema();
				schema.setColName(rs.getString("COLUMN_NAME"));
				schema.setType(rs.getString("TYPE_NAME"));
				result.add(schema);
			}
		}
		finally
		{
			if (rs != null)
			{
				rs.close();
			}
			if (conn != null)
			{
				conn.close();
			}
		}

		return result;
	}

	/**
	 * 导出到csv 文件
	 * 
	 * @param ori
	 * @param exportFile
	 */
	public void exportCsvToFile(GatherPlanTask ori, File exportFile)
	{
		GatherSource gatherSource = ori.getObject().getGatherSource();
		if (gatherSource != null)
		{
			Connection conn = null;
			try
			{
				conn = getConnection(gatherSource);
				CSVExporter exporter = new CSVExporter(conn);
				exporter.exportCsv(ori, exportFile);
			}
			catch (SQLException e)
			{
				logger.error("export gatherSource error", e);
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
		}
	}

	/**
	 * 导入 csv 文件到数据库
	 * 
	 * @param target
	 * @param importCsvFile
	 */
	public void importCsvToDb(GatherTarget target, String importCsvFile)
	{
		Connection conn = null;
		try
		{
			conn = getConnection(target);
			CSVLoader loader = new CSVLoader(conn);
			Date now = new Date();
			loader.loadCSV(importCsvFile, target.getDbTableName(), true,now,target);
		}
		catch (Exception e)
		{
			logger.error("import gatherTarget error", e);
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
	}

	private Connection getConnection(GatherTarget target) throws SQLException
	{
		JdbcTemplate template = ApplicationContextHelper.getBean(JdbcTemplate.class);
		return template.getDataSource().getConnection();
	}

	private Connection getConnection(GatherSource source) throws SQLException
	{
		JdbcTemplate jt = null;
		Connection conn = null;
		if (Objects.equals(source.getDbType(), DBType.MYSQL.getCode()))
		{
			jt = get("jdbc:mysql://" + source.getIp() + "/" + source.getDbSid(), "com.mysql.jdbc.Driver", source.getDbUser(), source.getDbPassword());
		}
		else if (Objects.equals(source.getDbType(), DBType.ORACLE.getCode()))
		{
			// oracle
			jt = get("jdbc:oracle:thin:@" + source.getIp() + ":" + source.getDbPort() + ":" + source.getDbSid() + "", "oracle.jdbc.driver.OracleDriver", source.getDbUser(), source.getDbPassword());
		}
		conn = jt.getDataSource().getConnection();
		return conn;
	}

	public Connection getConnection(GatherObject object) throws SQLException
	{
		return getConnection(object.getGatherSource());
	}

	private static final String DDL = "CREATE TABLE ${table} (${columns})";
	private static final String TABLE_REGEX = "\\$\\{table\\}";
	private static final String COLUMN_REGEX = "\\$\\{columns\\}";

	public void createTable(GatherTarget gt) throws SQLException
	{
		// TODO Auto-generated method stub
		JdbcTemplate jd = ApplicationContextHelper.getBean(JdbcTemplate.class);
		List<GatherTargetColumn> columns = gt.getColumns();
		StringBuilder sb = new StringBuilder();
		String sql = DDL.replaceFirst(TABLE_REGEX, gt.getDbTableName());
		String key = null;
		String colN = "VARCHAR2";
		for (GatherTargetColumn col : columns)
		{
			if (col != null && col.getName() != null && !"".equals(col.getName()))
			{

//				if("1".equals(col.getType()))
//				{
					colN = "VARCHAR2";
					if(col.getLen() != null && !"".equals(col.getLen()))
					{
						colN = colN + "(" + col.getLen() + ")";
					}
//				}
//				else if("2".equals(col.getType()))
//				{
//					colN = "NUMBER";
//					if(col.getLen() != null && !"".equals(col.getLen()))
//					{
//						colN = colN + "(" + col.getLen() + ")";
//					}
//				}
//				else if("3".equals(col.getType()))
//				{
//					colN = "DATE";
//				}
				sb.append(col.getName()).append(" ").append(colN);//
				if (col.getNill() != null)
				{
					sb.append(col.getNill().intValue() == 1? "NOT NULL":"");
				}
				
				if (col.getKey()!= null && col.getKey().intValue() == 1)
				{
					key = col.getName();
				}
				sb.append(",");
			
			}
		}
		if (sb.length() > 0)
		{
			//增加三个时间列
			sb.append(" PLAN_EXE_TIME_ DATE, SYS_EXE_TIME_ DATE, DB_EXE_TIME_ DATE  default sysdate NOT NULL,");
			if (jd.getDataSource().getConnection().getMetaData().getDatabaseProductName().toLowerCase().contains("oracle"))
			{
				//oracle 主键
				sb.append("CONSTRAINT " + gt.getDbTableName() + "_key PRIMARY KEY ("+ key + ")");
			}
			else if (jd.getDataSource().getConnection().getMetaData().getDatabaseProductName().toLowerCase().contains("mysql"))
			{
				//mysql 主键方式
				sb.append("PRIMARY KEY ("+ key + ")");
			}
			sql = sql.replaceFirst(COLUMN_REGEX, sb.toString());
			jd.execute(sql);
		}
		
	}

	private static final String PAGE_SQL_MYSQL = "select o.* from (${sql}) o limit ${firstIndex},${pageSize};";
	private static final String PAGE_SQL_ORACLE = "select * from (select a.*,ROWNUM rn from (${sql}) a where ROWNUM <=${lastIdex}) where rn > ${firstIndex}";
	
	private static final String SELECT_SQL = "select * from ${table} ${columns}";
	public Map<String, Object> getCurrentPageSql(String dbTableName, GatherResultQueryModel qm, int pageSize, int pageNo,Long counts) throws SQLException
	{
		List<Map<String,Object>> rows = Lists.newArrayList();
		// TODO Auto-generated method stub
		JdbcTemplate jdbcTemplate = ApplicationContextHelper.getBean(JdbcTemplate.class);
		String sql = SELECT_SQL.replaceFirst(TABLE_REGEX, dbTableName);
		if (qm.getConditions() != null)
		{
			StringBuilder sb = new StringBuilder();
			List<Map<String, String>>  map = qm.getConditions();
			int i = 0;
			for (Map<String, String> m : map)
			{
				if (i == 0)
				{
					sb.append(" where ");
				}
				i++;
				sb.append(" ").append(m.get("columnName")).append(" ").append(m.get("condition")).append(" ").append("'").append(m.get("value")).append("' ");
				if (i < map.size())
				{
					sb.append(" ").append(m.get("relation"));
				}
			}
			
			if (qm.getSorts() != null)
			{
				int j = 0;
				List<Map<String, String>> sorts = qm.getSorts();
				for (Map<String, String> sortMap : sorts)
				{
					if (j == 0)
					{
						sb.append(" order by ");
					}
					j++;
					sb.append(sortMap.get("columnName")).append(" ").append(sortMap.get("direction"));
					if (j < sorts.size())
					{
						sb.append(" ,");
					}
				}
			}
			
			sql  =sql.replaceFirst("\\$\\{columns\\}", sb.toString());
			
			String pageSql = null;
			if (getDbType(jdbcTemplate).toLowerCase().contains("mysql"))
			{
				pageSql = PAGE_SQL_MYSQL.replaceFirst("\\$\\{sql\\}", sql).replaceAll("\\$\\{firstIndex\\}", String.valueOf(pageSize * (pageNo - 1))).replaceAll("\\$\\{pageSize\\}", String.valueOf(pageSize * (pageNo - 1) + pageSize));
			}
			else if(getDbType(jdbcTemplate).toLowerCase().contains("oracle"))
			{
				
				pageSql = PAGE_SQL_ORACLE.replaceFirst("\\$\\{sql\\}", sql).replaceAll("\\$\\{lastIdex\\}", String.valueOf(pageSize * (pageNo - 1) + pageSize)).replaceAll("\\$\\{firstIndex\\}", String.valueOf(pageSize * (pageNo - 1)));
			}
			counts = Long.parseLong(String.valueOf(jdbcTemplate.queryForList("select count(*) from (" + pageSql + ")" ).get(0).get("count(*)")));
			rows = jdbcTemplate.queryForList(pageSql);
		}
		else 
		{
			if (qm.getSorts() != null)
			{
				StringBuilder sb = new StringBuilder();
				if (qm.getSorts() != null)
				{
					int j = 0;
					List<Map<String, String>> sorts = qm.getSorts();
					for (Map<String, String> sortMap : sorts)
					{
						if (j == 0)
						{
							sb.append(" order by ");
						}
						j++;
						sb.append(sortMap.get("columnName")).append(" ").append(sortMap.get("direction"));
						if (j < sorts.size())
						{
							sb.append(" ,");
						}
					}
				}
				
				sql  =sql.replaceFirst("\\$\\{columns\\}", sb.toString());
				
				String pageSql = null;
				if (getDbType(jdbcTemplate).toLowerCase().contains("mysql"))
				{
					pageSql = PAGE_SQL_MYSQL.replaceFirst("\\$\\{sql\\}", sql).replaceAll("\\$\\{firstIndex\\}", String.valueOf(pageSize * (pageNo - 1))).replaceAll("\\$\\{pageSize\\}", String.valueOf(pageSize * (pageNo - 1) + pageSize));
				}
				else if(getDbType(jdbcTemplate).toLowerCase().contains("oracle"))
				{
					
					pageSql = PAGE_SQL_ORACLE.replaceFirst("\\$\\{sql\\}", sql).replaceAll("\\$\\{lastIdex\\}", String.valueOf(pageSize * (pageNo - 1) + pageSize)).replaceAll("\\$\\{firstIndex\\}", String.valueOf(pageSize * (pageNo - 1)));
				}
				counts = Long.parseLong(String.valueOf(jdbcTemplate.queryForList("select count(*) from (" + pageSql + ")" ).get(0).get("count(*)")));
				rows = jdbcTemplate.queryForList(pageSql);
			
			}
			else
			{
				String pageSql = SELECT_SQL.replaceFirst(TABLE_REGEX, dbTableName);
				pageSql = pageSql.replaceFirst("\\$\\{columns\\}", "");
				counts = Long.parseLong(String.valueOf(jdbcTemplate.queryForList("select count(*) from (" + pageSql + ")" ).get(0).get("count(*)")));
				rows = jdbcTemplate.queryForList(pageSql);
			}
		}
		Map<String, Object> result = Maps.newHashMap();
		result.put("rows", rows);
		result.put("count", counts);
		return result;
	}

	private String getDbType(JdbcTemplate jdbcTemplate) throws SQLException
	{
		return jdbcTemplate.getDataSource().getConnection().getMetaData().getDatabaseProductName();
	}

	public void dropTable(String dbTableName)
	{
		JdbcTemplate jdbcTemplate = ApplicationContextHelper.getBean(JdbcTemplate.class);
		try
		{
			jdbcTemplate.execute("drop table  " + dbTableName);;
		}
		catch (Throwable e)
		{
			logger.info(e.getMessage());
		}
	}
}
