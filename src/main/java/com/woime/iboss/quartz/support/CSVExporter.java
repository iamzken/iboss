package com.woime.iboss.quartz.support;

import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.woime.iboss.gather.persistence.domain.GatherPlanTask;

import au.com.bytecode.opencsv.CSVWriter;

/**
 * 导出csv
 * 
 * @author 王国栋
 *
 */
public class CSVExporter
{
	private static final Logger logger = LoggerFactory.getLogger(CSVExporter.class);
	private Connection connection;

	/**
	 * 构造csvloader，并指定默认的分隔符为逗号
	 * 
	 * @param connection
	 */
	public CSVExporter(Connection connection)
	{
		this.connection = connection;
	}

	/**
	 * 导出采集源 与采集计划
	 * 
	 * @param gatherTask
	 * @param exportFile
	 */
	public void exportCsv(GatherPlanTask gatherTask, File exportFile)
	{
		CSVWriter writer = null;
		ResultSet rs = null;
		try
		{
			Statement st = connection.createStatement();
			// 把采集计划里面的sql 查出来 ，类似于这样 INSERT INTO t_abc(id, name) VALUES (SELECT
			// id, name FROM account_avatar where id = 1)
			// 取出 里面的 select 部分
			String sql = gatherTask.getSql();
			String temp = null;
			
			String colNames = null;
			if (StringUtils.isNotBlank(sql))
			{
				temp = sql.substring(sql.lastIndexOf("(") + 1, sql.lastIndexOf(")"));
				
				colNames = sql.substring(sql.indexOf("(") + 1, sql.indexOf(")"));
			}
			
			List<String> c = new ArrayList<String>();
			String[] cc = colNames.split(",");
			for (String string : cc)
			{
				if (StringUtils.isNotBlank(string))
				{
					c.add(string.trim());
				}
			}
			
			rs = st.executeQuery(temp);

			writer = new CSVWriter(new FileWriter(exportFile), '\t');
			String[] cos = new String[c.size()];
			c.toArray(cos);
			writer.writeNext(cos);
			writer.writeAll(rs, true);
		}
		catch (Exception e)
		{
			logger.error("Unable to connect to database", e);
		}
		finally
		{
			try
			{
				if (rs != null)
				{
					rs.close();
				}
				if (writer != null)
				{
					writer.close();// 关闭文件流
				}
				if (connection != null)
				{
					connection.close();
				}
			}
			catch (Exception e)
			{
				// TODO Auto-generated catch block
			}
		}

	}
}
