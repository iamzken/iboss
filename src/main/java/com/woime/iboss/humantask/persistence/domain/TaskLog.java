package com.woime.iboss.humantask.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * TaskLog 任务日志.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "TASK_LOG")
public class TaskLog implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 外键，任务. */
	private TaskInfo taskInfo;

	/** 事件类型. */
	private String eventType;

	/** 事件事件. */
	private Date eventTime;

	/** 操作人. */
	private String creator;

	/** 操作之前的负责人. */
	private String startOwner;

	/** 操作之后的负责人. */
	private String endOwner;

	/** 任务状态. */
	private String taskStatus;

	/** 内容. */
	private String content;

	/** 排序. */
	private Integer priority;

	public TaskLog()
	{
	}

	public TaskLog(Long id)
	{
		this.id = id;
	}

	public TaskLog(Long id, TaskInfo taskInfo, String eventType, Date eventTime, String creator, String startOwner, String endOwner, String taskStatus, String content, Integer priority)
	{
		this.id = id;
		this.taskInfo = taskInfo;
		this.eventType = eventType;
		this.eventTime = eventTime;
		this.creator = creator;
		this.startOwner = startOwner;
		this.endOwner = endOwner;
		this.taskStatus = taskStatus;
		this.content = content;
		this.priority = priority;
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

	/** @return 外键，任务. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "TASK_ID")
	public TaskInfo getTaskInfo()
	{
		return this.taskInfo;
	}

	/**
	 * @param taskInfo
	 *            外键，任务.
	 */
	public void setTaskInfo(TaskInfo taskInfo)
	{
		this.taskInfo = taskInfo;
	}

	/** @return 事件类型. */
	@Column(name = "EVENT_TYPE", length = 100)
	public String getEventType()
	{
		return this.eventType;
	}

	/**
	 * @param eventType
	 *            事件类型.
	 */
	public void setEventType(String eventType)
	{
		this.eventType = eventType;
	}

	/** @return 事件事件. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "EVENT_TIME", length = 26)
	public Date getEventTime()
	{
		return this.eventTime;
	}

	/**
	 * @param eventTime
	 *            事件事件.
	 */
	public void setEventTime(Date eventTime)
	{
		this.eventTime = eventTime;
	}

	/** @return 操作人. */
	@Column(name = "CREATOR", length = 64)
	public String getCreator()
	{
		return this.creator;
	}

	/**
	 * @param creator
	 *            操作人.
	 */
	public void setCreator(String creator)
	{
		this.creator = creator;
	}

	/** @return 操作之前的负责人. */
	@Column(name = "START_OWNER", length = 64)
	public String getStartOwner()
	{
		return this.startOwner;
	}

	/**
	 * @param startOwner
	 *            操作之前的负责人.
	 */
	public void setStartOwner(String startOwner)
	{
		this.startOwner = startOwner;
	}

	/** @return 操作之后的负责人. */
	@Column(name = "END_OWNER", length = 64)
	public String getEndOwner()
	{
		return this.endOwner;
	}

	/**
	 * @param endOwner
	 *            操作之后的负责人.
	 */
	public void setEndOwner(String endOwner)
	{
		this.endOwner = endOwner;
	}

	/** @return 任务状态. */
	@Column(name = "TASK_STATUS", length = 50)
	public String getTaskStatus()
	{
		return this.taskStatus;
	}

	/**
	 * @param taskStatus
	 *            任务状态.
	 */
	public void setTaskStatus(String taskStatus)
	{
		this.taskStatus = taskStatus;
	}

	/** @return 内容. */
	@Column(name = "CONTENT", length = 65535)
	public String getContent()
	{
		return this.content;
	}

	/**
	 * @param content
	 *            内容.
	 */
	public void setContent(String content)
	{
		this.content = content;
	}

	/** @return 排序. */
	@Column(name = "PRIORITY")
	public Integer getPriority()
	{
		return this.priority;
	}

	/**
	 * @param priority
	 *            排序.
	 */
	public void setPriority(Integer priority)
	{
		this.priority = priority;
	}
}
