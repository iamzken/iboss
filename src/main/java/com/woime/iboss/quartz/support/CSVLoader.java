package com.woime.iboss.quartz.support;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.woime.iboss.core.spring.ApplicationContextHelper;
import com.woime.iboss.gather.persistence.domain.GatherTarget;
import com.woime.iboss.gather.persistence.domain.GatherTargetColumn;
import com.woime.iboss.gather.persistence.manager.GatherTargetColumnManager;

import au.com.bytecode.opencsv.CSVReader;

/**
 * @author 王国栋
 *
 */
public class CSVLoader
{
	private static final Logger logger = LoggerFactory.getLogger(CSVLoader.class);

	private static final String SQL_INSERT = "INSERT INTO ${table}(${keys}) VALUES(${values})";
	private static final String TABLE_REGEX = "\\$\\{table\\}";
	private static final String KEYS_REGEX = "\\$\\{keys\\}";
	private static final String VALUES_REGEX = "\\$\\{values\\}";

	private Connection connection;
	private char seprator;

	/**
	 * 构造csvloader，并指定默认的分隔符为逗号
	 * 
	 * @param connection
	 */
	public CSVLoader(Connection connection)
	{
		this.connection = connection;
		this.seprator = '\t';
	}

	/**
	 * 使用 OpenCSV 解析csv文件，并导入指定的表
	 * 
	 * @param csvFile
	 *            导入的csv 文件
	 * @param tableName
	 *            要导入的数据库表名
	 * @param truncateBeforeLoad
	 *            是否先删后插
	 * @throws Exception
	 */
	public void loadCSV(String csvFile, String tableName, boolean truncateBeforeLoad,Date now,GatherTarget target) throws Exception
	{
		List<GatherTargetColumn> columns = target.getColumns();
		if (columns == null)
		{
			GatherTargetColumnManager gcm = ApplicationContextHelper.getBean(GatherTargetColumnManager.class);
			columns = gcm.find(" from GatherTargetColumn t where t.target.id = ?", target.getId());
		}
		Map<String,String> colMap = new HashMap<String,String>();
		Map<String,GatherTargetColumn> colMapA = new HashMap<String,GatherTargetColumn>();
		for (GatherTargetColumn gatherTargetColumn : columns) {
			colMap.put(gatherTargetColumn.getName(), gatherTargetColumn.getType());
			colMapA.put(gatherTargetColumn.getName(), gatherTargetColumn);
		}
		CSVReader csvReader = null;
		if (null == this.connection)
		{
			throw new Exception("Not a valid connection.");
		}
		try
		{
			csvReader = new CSVReader(new FileReader(csvFile), this.seprator);
		}
		catch (Exception e)
		{
			throw new Exception("Error occured while executing file. " + e.getMessage());
		}

		String[] hr = csvReader.readNext();
		
		
		if (null == hr)
		{
			csvReader.close();
			throw new FileNotFoundException("No columns defined in given CSV file." + "Please check the CSV file format.");
		}
		String[] headerRow = new String[hr.length + 2];
		for (int i = 0; i < hr.length; i++)
		{
			headerRow[i] = hr[i];
		}
		headerRow[headerRow.length - 2] = "PLAN_EXE_TIME_";
		headerRow[headerRow.length - 1] = "SYS_EXE_TIME_";
		String questionmarks = StringUtils.repeat("?,", headerRow.length);
		questionmarks = (String) questionmarks.subSequence(0, questionmarks.length() - 1);

		String query = SQL_INSERT.replaceFirst(TABLE_REGEX, tableName);
		query = query.replaceFirst(KEYS_REGEX, StringUtils.join(headerRow, ","));
		query = query.replaceFirst(VALUES_REGEX, questionmarks);

		logger.info("query:" + query);

		String[] nextLine;
		Connection con = null;
		PreparedStatement ps = null;
		try
		{
			con = this.connection;
			con.setAutoCommit(false);
			ps = con.prepareStatement(query);

			if (truncateBeforeLoad)
			{
				// delete data from table before loading csv
				con.createStatement().execute("DELETE FROM " + tableName);
			}

			final int batchSize = 1000;
			int count = 0;
			Date date = null;
			int kk = 0;
			while ((nextLine = csvReader.readNext()) != null)
			{
				if (kk == 0)
				{
					++kk;
					continue;
				}
				else
				{

					if (null != nextLine)
					{
						int index = 1;
						int i = 0;
						for (String string : nextLine)
						{
							if (colMap.containsKey(headerRow[i])) {
								if (colMap.get(headerRow[i]).equals("1")) {
									//varchar
									ps.setString(index++, string);//这里需要根据目标的数据类型进行插入，不能直接插入string
								}
								else if(colMap.get(headerRow[i]).equals("2"))
								{
									//number
									if(colMapA.get(headerRow[i]).getLen().contains(","))
									{
										ps.setDouble(index++, Double.valueOf(string));
									}
									else
									{
										ps.setLong(index++, Long.valueOf(string));
									}
								}
								else if(colMap.get(headerRow[i]).equals("3"))
								{
									//date
									date = DateUtil.convertToDate(string);
									if (null != date)
									{
										ps.setDate(index++, new java.sql.Date(date.getTime()));
									}
								}
							}
							else
							{
								throw new Exception("请检查采集目标的列名是否正确");
							}
						}
						ps.setDate(index++, new java.sql.Date(now.getTime()));
						ps.setDate(index++, new java.sql.Date(System.currentTimeMillis()));
						
						ps.addBatch();
					}
					if (++count % batchSize == 0)
					{
						ps.executeBatch();
					}
				}
			}
			ps.executeBatch(); // insert remaining records
			con.commit();
		}
		catch (Exception e)
		{
			con.rollback();
			throw new Exception("Error occured while loading data from file to database." + e.getMessage());
		}
		finally
		{
			if (null != ps)
			{
				ps.close();
			}
			if (null != con)
			{
				con.close();
			}
			csvReader.close();
		}
	}

	public char getSeprator()
	{
		return seprator;
	}

	public void setSeprator(char seprator)
	{
		this.seprator = seprator;
	}
}
