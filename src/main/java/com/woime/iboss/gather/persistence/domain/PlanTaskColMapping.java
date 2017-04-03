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
 * 采集计划任务列映射。
 * 
 * @author wangguodong
 *
 */
@Entity
@Table(name = "gather_task_colmap")
public class PlanTaskColMapping implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	
	private GatherPlanTask planTask;
	
	private String oriColName;
	private String targetColName;
	
	@Id
	@Column(name = "id")
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	
	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "plan_task_id")
	@JsonIgnore
	public GatherPlanTask getPlanTask() {
		return planTask;
	}
	public void setPlanTask(GatherPlanTask planTask) {
		this.planTask = planTask;
	}
	
	@Column(name = "ori_col_name")
	public String getOriColName() {
		return oriColName;
	}
	public void setOriColName(String oriColName) {
		this.oriColName = oriColName;
	}
	
	@Column(name = "tar_col_name")
	public String getTargetColName() {
		return targetColName;
	}
	public void setTargetColName(String targetColName) {
		this.targetColName = targetColName;
	}
	
	
}
