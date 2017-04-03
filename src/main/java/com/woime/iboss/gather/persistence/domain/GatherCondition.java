package com.woime.iboss.gather.persistence.domain;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 采集对象关联到的采集条件
 *
 * @author 王国栋
 */
@Entity
@Table(name = "gather_condition")
public class GatherCondition implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private String colName;
    private String condition;
    private String value;
    private String relation;
    private GatherObject go;
	
	private String tableName;
	
	
    @Id
    @Column(name = "id")
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name = "column_name")
    public String getColName() {
        return colName;
    }

    public void setColName(String colName) {
        this.colName = colName;
    }

    @Column(name = "condition_")
    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    @Column(name = "value_")
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Column(name = "relation_")
    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    @JsonIgnore
    @ManyToOne(cascade = {CascadeType.MERGE, CascadeType.REFRESH}, fetch = FetchType.LAZY)
    @JoinColumn(name = "gather_object_id")
    public GatherObject getGo() {
        return go;
    }

    public void setGo(GatherObject go) {
        this.go = go;
    }
    

	@Column(name = "table_name")
	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	
}
