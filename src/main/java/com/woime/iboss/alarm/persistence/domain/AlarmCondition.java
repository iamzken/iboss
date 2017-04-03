package com.woime.iboss.alarm.persistence.domain;

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
@Table(name = "alarm_target_condition")
public class AlarmCondition implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private String colName;
    private String condition;
    private String value;
    private String relation;
    private AlarmTarget go;

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
    @JoinColumn(name = "alarm_object_id")
    public AlarmTarget getGo() {
        return go;
    }

    public void setGo(AlarmTarget go) {
        this.go = go;
    }
}
