package com.woime.iboss.alarm.persistence.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 自动确认配置
 *
 * @author xue
 */
@Entity
@Table(name = "auto_confirm")
public class AutoConfirm implements Serializable {
    private static final long serialVersionUID = 1L;

    private String alrmLevel;
    private String comType;
    private String comTime;
    
    @Id
    @Column(name = "alrm_level")
	public String getAlrmLevel() {
		return alrmLevel;
	}
	public void setAlrmLevel(String alrmLevel) {
		this.alrmLevel = alrmLevel;
	}
	
    @Column(name = "com_type")
	public String getComType() {
		return comType;
	}
	public void setComType(String comType) {
		this.comType = comType;
	}
	
    @Column(name = "com_time")
	public String getComTime() {
		return comTime;
	}
	public void setComTime(String comTime) {
		this.comTime = comTime;
	}
    
}
