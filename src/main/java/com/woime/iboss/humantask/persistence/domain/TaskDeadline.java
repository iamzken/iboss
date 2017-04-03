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
 * TaskDeadline 任务截止时间.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "TASK_DEADLINE")
public class TaskDeadline implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 外键，任务. */
	private TaskInfo taskInfo;

	/** 类型. */
	private String type;

	/** 截止时间. */
	private Date deadlineTime;

	/** 触发时间. */
	private Date triggerTime;

	/** 重复次数. */
	private Integer repeatTimes;

	/** 提醒类型. */
	private String notificationType;

	/** 提醒接收人. */
	private String notificationReceiver;

	/** 提醒模板编码. */
	private String notificationTemplateCode;

	/** 重分配. */
	private String reassignment;

	/** 操作. */
	private String operation;

	public TaskDeadline()
	{
	}

	public TaskDeadline(Long id)
	{
		this.id = id;
	}

	public TaskDeadline(Long id, TaskInfo taskInfo, String type, Date deadlineTime, Date triggerTime, Integer repeatTimes, String notificationType, String notificationReceiver,
			String notificationTemplateCode, String reassignment, String operation)
	{
		this.id = id;
		this.taskInfo = taskInfo;
		this.type = type;
		this.deadlineTime = deadlineTime;
		this.triggerTime = triggerTime;
		this.repeatTimes = repeatTimes;
		this.notificationType = notificationType;
		this.notificationReceiver = notificationReceiver;
		this.notificationTemplateCode = notificationTemplateCode;
		this.reassignment = reassignment;
		this.operation = operation;
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

	/** @return 类型. */
	@Column(name = "TYPE", length = 100)
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

	/** @return 截止时间. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DEADLINE_TIME", length = 26)
	public Date getDeadlineTime()
	{
		return this.deadlineTime;
	}

	/**
	 * @param deadlineTime
	 *            截止时间.
	 */
	public void setDeadlineTime(Date deadlineTime)
	{
		this.deadlineTime = deadlineTime;
	}

	/** @return 触发时间. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "TRIGGER_TIME", length = 26)
	public Date getTriggerTime()
	{
		return this.triggerTime;
	}

	/**
	 * @param triggerTime
	 *            触发时间.
	 */
	public void setTriggerTime(Date triggerTime)
	{
		this.triggerTime = triggerTime;
	}

	/** @return 重复次数. */
	@Column(name = "REPEAT_TIMES")
	public Integer getRepeatTimes()
	{
		return this.repeatTimes;
	}

	/**
	 * @param repeatTimes
	 *            重复次数.
	 */
	public void setRepeatTimes(Integer repeatTimes)
	{
		this.repeatTimes = repeatTimes;
	}

	/** @return 提醒类型. */
	@Column(name = "NOTIFICATION_TYPE", length = 200)
	public String getNotificationType()
	{
		return this.notificationType;
	}

	/**
	 * @param notificationType
	 *            提醒类型.
	 */
	public void setNotificationType(String notificationType)
	{
		this.notificationType = notificationType;
	}

	/** @return 提醒接收人. */
	@Column(name = "NOTIFICATION_RECEIVER", length = 200)
	public String getNotificationReceiver()
	{
		return this.notificationReceiver;
	}

	/**
	 * @param notificationReceiver
	 *            提醒接收人.
	 */
	public void setNotificationReceiver(String notificationReceiver)
	{
		this.notificationReceiver = notificationReceiver;
	}

	/** @return 提醒模板编码. */
	@Column(name = "NOTIFICATION_TEMPLATE_CODE", length = 200)
	public String getNotificationTemplateCode()
	{
		return this.notificationTemplateCode;
	}

	/**
	 * @param notificationTemplateCode
	 *            提醒模板编码.
	 */
	public void setNotificationTemplateCode(String notificationTemplateCode)
	{
		this.notificationTemplateCode = notificationTemplateCode;
	}

	/** @return 重分配. */
	@Column(name = "REASSIGNMENT", length = 200)
	public String getReassignment()
	{
		return this.reassignment;
	}

	/**
	 * @param reassignment
	 *            重分配.
	 */
	public void setReassignment(String reassignment)
	{
		this.reassignment = reassignment;
	}

	/** @return 操作. */
	@Column(name = "OPERATION", length = 200)
	public String getOperation()
	{
		return this.operation;
	}

	/**
	 * @param operation
	 *            操作.
	 */
	public void setOperation(String operation)
	{
		this.operation = operation;
	}
}
