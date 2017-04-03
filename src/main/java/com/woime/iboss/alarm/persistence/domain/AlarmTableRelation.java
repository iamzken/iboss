package com.woime.iboss.alarm.persistence.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 告警指标
 * 
 * @author 王国栋
 *
 */
@Entity
@Table(name = "alarm_table_relation")
public class AlarmTableRelation implements Serializable
{
	private static final long serialVersionUID = 1L;

	private Long id;
	private String colName1;
	private String dbTableName1;
	private String colName2;
	private String dbTableName2;
	private Long alarmTargetId;

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

	@Column(name = "column_name1")
	public String getColName1() {
		return colName1;
	}

	public void setColName1(String colName1) {
		this.colName1 = colName1;
	}

	@Column(name = "db_table_name1")
	public String getDbTableName1() {
		return dbTableName1;
	}

	public void setDbTableName1(String dbTableName1) {
		this.dbTableName1 = dbTableName1;
	}

	@Column(name = "column_name2")
	public String getColName2() {
		return colName2;
	}

	public void setColName2(String colName2) {
		this.colName2 = colName2;
	}

	@Column(name = "db_table_name2")
	public String getDbTableName2() {
		return dbTableName2;
	}

	public void setDbTableName2(String dbTableName2) {
		this.dbTableName2 = dbTableName2;
	}


	
	@Column(name = "alarm_target_id")
	public Long getAlarmTargetId() {
		return alarmTargetId;
	}

	public void setAlarmTargetId(Long alarmTargetId) {
		this.alarmTargetId = alarmTargetId;
	}
}
