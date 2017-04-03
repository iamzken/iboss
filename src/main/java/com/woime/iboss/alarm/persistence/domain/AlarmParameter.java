package com.woime.iboss.alarm.persistence.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 自动确认配置
 *
 * @author xue
 */
@Entity
@Table(name = "alarm_parameter")
public class AlarmParameter implements Serializable {
    private static final long serialVersionUID = 1L;

    private String id;
    private String name;
    private String value;
    private String seq;
    
    @Id
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
    
    
}
