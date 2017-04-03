package com.woime.iboss.gather.persistence.domain;

import java.io.Serializable;
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

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 采集计划详细
 * 
 * @author 王国栋
 *
 */
@Entity
@Table(name = "gather_plan_task")
public class GatherPlanTask implements Serializable
{
	private static final long serialVersionUID = 1L;
	private Long id;
	/** 计划名称 **/
	private String name;
	/** 采集目标 **/
	private GatherTarget target;
	/** 采集源 **/
	private GatherObject object;
	/** 频率ISO表达式 **/
	private String frequency;
	/** 排序 **/
	private Integer orders;
	
	private GatherPlan gatherPlan;
	
	private List<PlanTaskColMapping> colMaps;

	private String sql;
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

	@ManyToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "gather_target_id")
	public GatherTarget getTarget()
	{
		return target;
	}

	public void setTarget(GatherTarget target)
	{
		this.target = target;
	}

	@ManyToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.EAGER, optional = false)
	@JoinColumn(name = "gather_object_id")
	public GatherObject getObject() {
		return object;
	}

	public void setObject(GatherObject object) {
		this.object = object;
	}

	@Column(name = "frequency")
	public String getFrequency()
	{
		return frequency;
	}

	public void setFrequency(String frequency)
	{
		this.frequency = frequency;
	}

	@Column(name = "orders")
	public Integer getOrders()
	{
		return orders;
	}

	public void setOrders(Integer orders)
	{
		this.orders = orders;
	}

	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.REFRESH }, fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "gather_plan_id")
	@JsonIgnore
	public GatherPlan getGatherPlan()
	{
		return gatherPlan;
	}

	public void setGatherPlan(GatherPlan gatherPlan)
	{
		this.gatherPlan = gatherPlan;
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

//	@OneToMany(mappedBy = "planTask", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@Transient
	public List<PlanTaskColMapping> getColMaps() {
		return colMaps;
	}

	public void setColMaps(List<PlanTaskColMapping> colMaps) {
		this.colMaps = colMaps;
	}

}
