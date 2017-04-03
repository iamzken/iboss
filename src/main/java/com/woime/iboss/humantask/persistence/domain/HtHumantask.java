package com.woime.iboss.humantask.persistence.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * HtHumantask 人工任务.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "HT_HUMANTASK")
public class HtHumantask implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 外键，父任务. */
	private HtHumantask htHumantask;

	/** 任务名称. */
	private String name;

	/** 任务描述. */
	private String description;

	/** 负责人. */
	private String assignee;

	/** 被代理人. */
	private String owner;

	/** 代理状态. */
	private String delegateStatus;

	/** 优先级. */
	private Integer priority;

	/** 创建时间. */
	private Date createTime;

	/** 持续时间. */
	private String duration;

	/** 暂停状态. */
	private String suspendStatus;

	/** 分类. */
	private String category;

	/** 代码. */
	private String code;

	/** 表单. */
	private String form;

	/** 关联的任务ID. */
	private String taskId;

	/** 关联的分支ID. */
	private String executionId;

	/** 关联的流程实例ID. */
	private String processInstanceId;

	/** 关联的流程定义ID. */
	private String processDefinitionId;

	/** 多租户. */
	private String tenentId;

	/** 状态. */
	private String status;

	/** 完成时间. */
	private Date completeTime;

	/** . */
	private Set<HtParticipant> htParticipants = new HashSet<HtParticipant>(0);

	/** . */
	private Set<HtHumantask> htHumantasks = new HashSet<HtHumantask>(0);

	public HtHumantask()
	{
	}

	public HtHumantask(Long id)
	{
		this.id = id;
	}

	public HtHumantask(Long id, HtHumantask htHumantask, String name, String description, String assignee, String owner, String delegateStatus, Integer priority, Date createTime, String duration,
			String suspendStatus, String category, String code, String form, String taskId, String executionId, String processInstanceId, String processDefinitionId, String tenentId, String status,
			Date completeTime, Set<HtParticipant> htParticipants, Set<HtHumantask> htHumantasks)
	{
		this.id = id;
		this.htHumantask = htHumantask;
		this.name = name;
		this.description = description;
		this.assignee = assignee;
		this.owner = owner;
		this.delegateStatus = delegateStatus;
		this.priority = priority;
		this.createTime = createTime;
		this.duration = duration;
		this.suspendStatus = suspendStatus;
		this.category = category;
		this.code = code;
		this.form = form;
		this.taskId = taskId;
		this.executionId = executionId;
		this.processInstanceId = processInstanceId;
		this.processDefinitionId = processDefinitionId;
		this.tenentId = tenentId;
		this.status = status;
		this.completeTime = completeTime;
		this.htParticipants = htParticipants;
		this.htHumantasks = htHumantasks;
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

	/** @return 外键，父任务. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PARENT_ID")
	public HtHumantask getHtHumantask()
	{
		return this.htHumantask;
	}

	/**
	 * @param htHumantask
	 *            外键，父任务.
	 */
	public void setHtHumantask(HtHumantask htHumantask)
	{
		this.htHumantask = htHumantask;
	}

	/** @return 任务名称. */
	@Column(name = "NAME", length = 200)
	public String getName()
	{
		return this.name;
	}

	/**
	 * @param name
	 *            任务名称.
	 */
	public void setName(String name)
	{
		this.name = name;
	}

	/** @return 任务描述. */
	@Column(name = "DESCRIPTION", length = 200)
	public String getDescription()
	{
		return this.description;
	}

	/**
	 * @param description
	 *            任务描述.
	 */
	public void setDescription(String description)
	{
		this.description = description;
	}

	/** @return 负责人. */
	@Column(name = "ASSIGNEE", length = 64)
	public String getAssignee()
	{
		return this.assignee;
	}

	/**
	 * @param assignee
	 *            负责人.
	 */
	public void setAssignee(String assignee)
	{
		this.assignee = assignee;
	}

	/** @return 被代理人. */
	@Column(name = "OWNER", length = 64)
	public String getOwner()
	{
		return this.owner;
	}

	/**
	 * @param owner
	 *            被代理人.
	 */
	public void setOwner(String owner)
	{
		this.owner = owner;
	}

	/** @return 代理状态. */
	@Column(name = "DELEGATE_STATUS", length = 50)
	public String getDelegateStatus()
	{
		return this.delegateStatus;
	}

	/**
	 * @param delegateStatus
	 *            代理状态.
	 */
	public void setDelegateStatus(String delegateStatus)
	{
		this.delegateStatus = delegateStatus;
	}

	/** @return 优先级. */
	@Column(name = "PRIORITY")
	public Integer getPriority()
	{
		return this.priority;
	}

	/**
	 * @param priority
	 *            优先级.
	 */
	public void setPriority(Integer priority)
	{
		this.priority = priority;
	}

	/** @return 创建时间. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_TIME", length = 26)
	public Date getCreateTime()
	{
		return this.createTime;
	}

	/**
	 * @param createTime
	 *            创建时间.
	 */
	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}

	/** @return 持续时间. */
	@Column(name = "DURATION", length = 50)
	public String getDuration()
	{
		return this.duration;
	}

	/**
	 * @param duration
	 *            持续时间.
	 */
	public void setDuration(String duration)
	{
		this.duration = duration;
	}

	/** @return 暂停状态. */
	@Column(name = "SUSPEND_STATUS", length = 50)
	public String getSuspendStatus()
	{
		return this.suspendStatus;
	}

	/**
	 * @param suspendStatus
	 *            暂停状态.
	 */
	public void setSuspendStatus(String suspendStatus)
	{
		this.suspendStatus = suspendStatus;
	}

	/** @return 分类. */
	@Column(name = "CATEGORY", length = 50)
	public String getCategory()
	{
		return this.category;
	}

	/**
	 * @param category
	 *            分类.
	 */
	public void setCategory(String category)
	{
		this.category = category;
	}

	/** @return 代码. */
	@Column(name = "CODE", length = 200)
	public String getCode()
	{
		return this.code;
	}

	/**
	 * @param code
	 *            代码.
	 */
	public void setCode(String code)
	{
		this.code = code;
	}

	/** @return 表单. */
	@Column(name = "FORM", length = 200)
	public String getForm()
	{
		return this.form;
	}

	/**
	 * @param form
	 *            表单.
	 */
	public void setForm(String form)
	{
		this.form = form;
	}

	/** @return 关联的任务ID. */
	@Column(name = "TASK_ID", length = 200)
	public String getTaskId()
	{
		return this.taskId;
	}

	/**
	 * @param taskId
	 *            关联的任务ID.
	 */
	public void setTaskId(String taskId)
	{
		this.taskId = taskId;
	}

	/** @return 关联的分支ID. */
	@Column(name = "EXECUTION_ID", length = 200)
	public String getExecutionId()
	{
		return this.executionId;
	}

	/**
	 * @param executionId
	 *            关联的分支ID.
	 */
	public void setExecutionId(String executionId)
	{
		this.executionId = executionId;
	}

	/** @return 关联的流程实例ID. */
	@Column(name = "PROCESS_INSTANCE_ID", length = 200)
	public String getProcessInstanceId()
	{
		return this.processInstanceId;
	}

	/**
	 * @param processInstanceId
	 *            关联的流程实例ID.
	 */
	public void setProcessInstanceId(String processInstanceId)
	{
		this.processInstanceId = processInstanceId;
	}

	/** @return 关联的流程定义ID. */
	@Column(name = "PROCESS_DEFINITION_ID", length = 200)
	public String getProcessDefinitionId()
	{
		return this.processDefinitionId;
	}

	/**
	 * @param processDefinitionId
	 *            关联的流程定义ID.
	 */
	public void setProcessDefinitionId(String processDefinitionId)
	{
		this.processDefinitionId = processDefinitionId;
	}

	/** @return 多租户. */
	@Column(name = "TENENT_ID", length = 64)
	public String getTenentId()
	{
		return this.tenentId;
	}

	/**
	 * @param tenentId
	 *            多租户.
	 */
	public void setTenentId(String tenentId)
	{
		this.tenentId = tenentId;
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

	/** @return 完成时间. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "COMPLETE_TIME", length = 26)
	public Date getCompleteTime()
	{
		return this.completeTime;
	}

	/**
	 * @param completeTime
	 *            完成时间.
	 */
	public void setCompleteTime(Date completeTime)
	{
		this.completeTime = completeTime;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "htHumantask")
	public Set<HtParticipant> getHtParticipants()
	{
		return this.htParticipants;
	}

	/**
	 * @param htParticipants
	 *            .
	 */
	public void setHtParticipants(Set<HtParticipant> htParticipants)
	{
		this.htParticipants = htParticipants;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "htHumantask")
	public Set<HtHumantask> getHtHumantasks()
	{
		return this.htHumantasks;
	}

	/**
	 * @param htHumantasks
	 *            .
	 */
	public void setHtHumantasks(Set<HtHumantask> htHumantasks)
	{
		this.htHumantasks = htHumantasks;
	}
}
