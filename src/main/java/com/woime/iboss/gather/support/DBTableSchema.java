package com.woime.iboss.gather.support;

import java.io.Serializable;

/**
 * 数据库表结构。列名，类型
 * @author 王国栋
 *
 */
public class DBTableSchema implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private String colName;
	private String type;
	public String getColName()
	{
		return colName;
	}
	public void setColName(String colName)
	{
		this.colName = colName;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
}
