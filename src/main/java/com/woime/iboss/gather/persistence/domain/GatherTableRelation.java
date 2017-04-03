package com.woime.iboss.gather.persistence.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 采集对象关联到的采集表关系
 * 
 * 
 */
@Entity
@Table(name = "gather_table_relation")
public class GatherTableRelation implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3790851453897965445L;
	private Long id;
	private String colName1;
	private String dbTableName1;
	private String colName2;
	private String dbTableName2;
	private Long gatherObjectId;

	@Id
	@Column(name = "id")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
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

	@Column(name = "gather_object_id")
	public Long getGatherObjectId() {
		return gatherObjectId;
	}

	public void setGatherObjectId(Long gatherObjectId) {
		this.gatherObjectId = gatherObjectId;
	}

	public boolean check() {
		if (colName1 == null) {
			return false;
		}
		if (dbTableName1 == null) {
			return false;
		}
		if (colName2 == null) {
			return false;
		}
		if (dbTableName2 == null) {
			return false;
		}
		return true;
	}
}
