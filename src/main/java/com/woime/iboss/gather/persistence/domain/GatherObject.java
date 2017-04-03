package com.woime.iboss.gather.persistence.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.woime.iboss.gather.support.DBTableSchema;

/**
 * @author Chen Yujian on 2017/2/7 16:35.
 */
@Entity
@Table(name = "gather_object")
public class GatherObject implements Serializable
{

	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;
	private String comment;

	private GatherSource gatherSource;
	private String dbTableName;
	private String sql;

	private int dbTableCount;
	
	private List<GatherCondition> condition;

	private List<GatherCondition> condition1;

	private List<GatherCondition> condition2;
	
	private GatherTableRelation relation;
	
	
	private List<DBTableSchema> tblColumns;
	
	private List<DBTableSchema> tblColumns2;
	
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

	@Column(name = "comments")
	public String getComment()
	{
		return comment;
	}

	public void setComment(String comment)
	{
		this.comment = comment;
	}

	@Column(name = "db_table_name")
	public String getDbTableName()
	{
		return dbTableName;
	}

	public void setDbTableName(String dbTableName)
	{
		this.dbTableName = dbTableName;
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

//	@OneToMany(mappedBy = "go", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@Transient
	public List<GatherCondition> getCondition()
	{
		return condition;
	}

	public void setCondition(List<GatherCondition> condition)
	{
		this.condition = condition;
	}

	@ManyToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.EAGER)
	@JoinColumn(name = "gather_source_id")
	public GatherSource getGatherSource()
	{
		return gatherSource;
	}

	public void setGatherSource(GatherSource gatherSource)
	{
		this.gatherSource = gatherSource;
	}
	@Transient
	public GatherTableRelation getRelation() {
		return relation;
	}

	public void setRelation(GatherTableRelation relation) {
		this.relation = relation;
	}
	@Column(name = "db_table_count")
	public int getDbTableCount() {
		return dbTableCount;
	}

	public void setDbTableCount(int dbTableCount) {
		this.dbTableCount = dbTableCount;
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
	public List<GatherCondition> getCondition2() {
		
		if(dbTableCount==2&&condition!=null&&condition.size()>0){
			condition2 = new ArrayList<GatherCondition>();
			for(GatherCondition c:condition){
				if(c.getTableName().equals(relation.getDbTableName2())){
					condition2.add(c);
				}
			}
		}
		return condition2;
	}

	public void setCondition2(List<GatherCondition> condition2) {
		this.condition2 = condition2;
	}
	@Transient
	public List<GatherCondition> getCondition1() {
		if(dbTableCount==2){
			if(condition!=null&&condition.size()>0){
				condition1 = new ArrayList<GatherCondition>();
				for(GatherCondition c:condition){
					if(c.getTableName().equals(relation.getDbTableName1())){
						condition1.add(c);
					}
				}
			}
			
		}else{
			return condition;
		}
		return condition1;
	}

	public void setCondition1(List<GatherCondition> condition1) {
		this.condition1 = condition1;
	}

}
