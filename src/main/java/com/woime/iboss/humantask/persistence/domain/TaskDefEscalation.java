package com.woime.iboss.humantask.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * TaskDefEscalation 任务定义升级.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "TASK_DEF_ESCALATION")
public class TaskDefEscalation implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 外键，截止时间. */
	private TaskDefDeadline taskDefDeadline;

	/** 类型. */
	private String type;

	/** 状态. */
	private String status;

	/** 升级条件. */
	private String escalationCondition;

	/** 值. */
	private String value;

	public TaskDefEscalation()
	{
	}

	public TaskDefEscalation(Long id)
	{
		this.id = id;
	}

	public TaskDefEscalation(Long id, TaskDefDeadline taskDefDeadline, String type, String status, String escalationCondition, String value)
	{
		this.id = id;
		this.taskDefDeadline = taskDefDeadline;
		this.type = type;
		this.status = status;
		this.escalationCondition = escalationCondition;
		this.value = value;
	}

	/** @return 主键. */
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Long getId()
	{
		return this.id;
	}

	/**
	 * @param id
	 *            主键.
	 */
	public void setId(Long id)
	{
		this.id = id;
	}

	/** @return 外键，截止时间. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "DEADLINE_ID")
	public TaskDefDeadline getTaskDefDeadline()
	{
		return this.taskDefDeadline;
	}

	/**
	 * @param taskDefDeadline
	 *            外键，截止时间.
	 */
	public void setTaskDefDeadline(TaskDefDeadline taskDefDeadline)
	{
		this.taskDefDeadline = taskDefDeadline;
	}

	/** @return 类型. */
	@Column(name = "TYPE", length = 50)
	public String getType()
	{
		return this.type;
	}

	/**
	 * @param type
	 *            类型.
	 */
	public void setType(String type)
	{
		this.type = type;
	}

	/** @return 状态. */
	@Column(name = "STATUS", length = 50)
	public String getStatus()
	{
		return this.status;
	}

	/**
	 * @param status
	 *            状态.
	 */
	public void setStatus(String status)
	{
		this.status = status;
	}

	/** @return 升级条件. */
	@Column(name = "ESCALATION_CONDITION", length = 200)
	public String getEscalationCondition()
	{
		return this.escalationCondition;
	}

	/**
	 * @param escalationCondition
	 *            升级条件.
	 */
	public void setEscalationCondition(String escalationCondition)
	{
		this.escalationCondition = escalationCondition;
	}

	/** @return 值. */
	@Column(name = "VALUE", length = 200)
	public String getValue()
	{
		return this.value;
	}

	/**
	 * @param value
	 *            值.
	 */
	public void setValue(String value)
	{
		this.value = value;
	}
}