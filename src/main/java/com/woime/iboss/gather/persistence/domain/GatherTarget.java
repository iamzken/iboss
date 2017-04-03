package com.woime.iboss.gather.persistence.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 采集目标库
 * 
 * @author 王国栋
 *
 */
@Entity
@Table(name = "gather_target")
public class GatherTarget implements Serializable
{
	private static final long serialVersionUID = 1L;

	private Long id;
	private String name;
	private String dbTableName;

	private List<GatherTargetColumn> columns;

	private String sql;

	@Id
	@Column(name = "id")
	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	@Column(name = "name")
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	@Column(name = "table_name")
	public String getDbTableName()
	{
		return dbTableName;
	}

	public void setDbTableName(String dbTableName)
	{
		this.dbTableName = dbTableName;
	}

//	@OneToMany(mappedBy = "target", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@Transient
	public List<GatherTargetColumn> getColumns()
	{
		return columns;
	}

	public void setColumns(List<GatherTargetColumn> columns)
	{
		this.columns = columns;
	}

	@Column(name = "sql_")
	public String getSql()
	{
		return sql;
	}

	public void setSql(String sql)
	{
		this.sql = sql;
	}
}
