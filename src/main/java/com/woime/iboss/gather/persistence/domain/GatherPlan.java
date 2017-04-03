package com.woime.iboss.gather.persistence.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

/**
 * 采集计划
 * 
 * @author 王国栋
 *
 */
@Entity
@Table(name = "gather_plan")
public class GatherPlan implements Serializable
{
	private static final long serialVersionUID = 1L;

	private Long id;
	private String name;
	/** 计划下面包含的任务数 **/
	private Integer taskNum;
	private List<GatherPlanTask> details;
	/** 排序字段 **/
	private Integer orders;

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

//	@OneToMany(mappedBy = "gatherPlan", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@Transient
	public List<GatherPlanTask> getDetails()
	{
		return details;
	}

	public void setDetails(List<GatherPlanTask> details)
	{
		this.details = details;
	}

	@Column(name = "task_num")
	public Integer getTaskNum()
	{
		return taskNum;
	}

	public void setTaskNum(Integer taskNum)
	{
		this.taskNum = taskNum;
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
}
