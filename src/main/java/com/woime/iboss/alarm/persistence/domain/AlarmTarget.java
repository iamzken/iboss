package com.woime.iboss.alarm.persistence.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.woime.iboss.gather.support.DBTableSchema;

/**
 * 告警指标
 * 
 * @author 王国栋
 *
 */
@Entity
@Table(name = "alarm_target")
public class AlarmTarget implements Serializable
{
	private static final long serialVersionUID = 1L;

	private Long id;
	private String name;
	private String sql;
	private Long orders;

	private int dbTableCount;
	
	private List<AlarmCondition> conditions;
	
	private List<AlarmCondition> condition1;

	private List<AlarmCondition> condition2;
	
	private AlarmTableRelation relation;
	
	private List<AlarmTableSchema> schemas ;
	
	private List<DBTableSchema> tblColumns;
	
	private List<DBTableSchema> tblColumns2;
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	@Column(name = "name", length = 255)
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
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

	@Column(name = "orders")
	public Long getOrders()
	{
		return orders;
	}

	public void setOrders(Long orders)
	{
		this.orders = orders;
	}

	@Column(name = "db_table_count")
	public int getDbTableCount() {
		return dbTableCount;
	}

	public void setDbTableCount(int dbTableCount) {
		this.dbTableCount = dbTableCount;
	}

	@Transient
	public List<AlarmCondition> getCondition1() {
		return condition1;
	}

	public void setCondition1(List<AlarmCondition> condition1) {
		this.condition1 = condition1;
	}
	@Transient
	public List<AlarmCondition> getCondition2() {
		return condition2;
	}

	public void setCondition2(List<AlarmCondition> condition2) {
		this.condition2 = condition2;
	}
	@Transient
	public AlarmTableRelation getRelation() {
		return relation;
	}

	public void setRelation(AlarmTableRelation relation) {
		this.relation = relation;
	}
	@Transient
	public List<DBTableSchema> getTblColumns() {
		return tblColumns;
	}

	public void setTblColumns(List<DBTableSchema> tblColumns) {
		this.tblColumns = tblColumns;
	}
	@Transient
	public List<DBTableSchema> getTblColumns2() {
		return tblColumns2;
	}

	public void setTblColumns2(List<DBTableSchema> tblColumns2) {
		this.tblColumns2 = tblColumns2;
	}

	@Transient
	public List<AlarmCondition> getConditions() {
		return conditions;
	}

	public void setConditions(List<AlarmCondition> conditions) {
		this.conditions = conditions;
	}

	@Transient
	public List<AlarmTableSchema> getSchemas() {
		return schemas;
	}

	public void setSchemas(List<AlarmTableSchema> schemas) {
		this.schemas = schemas;
	}
}
