package com.woime.iboss.alarm.persistence.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "alarm_table_schema")
public class AlarmTableSchema implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String colName;
	private String dbTableName;
	private Integer type;
	private Long alarmTargetId;
	
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	@Column(name = "column_name")
	public String getColName()
	{
		return colName;
	}
	public void setColName(String colName)
	{
		this.colName = colName;
	}
	@Column(name = "type")
	public Integer getType()
	{
		return type;
	}
	public void setType(Integer type)
	{
		this.type = type;
	}
	@Column(name = "db_table_name")
	public String getDbTableName() {
		return dbTableName;
	}
	public void setDbTableName(String dbTableName) {
		this.dbTableName = dbTableName;
	}
	@Column(name = "alarm_target_id")
	public Long getAlarmTargetId() {
		return alarmTargetId;
	}
	public void setAlarmTargetId(Long alarmTargetId) {
		this.alarmTargetId = alarmTargetId;
	}
	
	
}
