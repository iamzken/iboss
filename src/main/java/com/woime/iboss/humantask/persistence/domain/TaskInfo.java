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
 * TaskInfo 人工任务.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "TASK_INFO")
public class TaskInfo implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 外键，父任务. */
	private TaskInfo taskInfo;

	/** 业务标识. */
	private String businessKey;

	/** 代码. */
	private String code;

	/** 任务名称. */
	private String name;

	/** 任务描述. */
	private String description;

	/** 优先级. */
	private Integer priority;

	/** 分类. */
	private String category;

	/** 表单. */
	private String form;

	/** 租户. */
	private String tenantId;

	/** 状态. */
	private String status;

	/** 暂停状态. */
	private String suspendStatus;

	/** 代理状态. */
	private String delegateStatus;

	/** 完成状态. */
	private String completeStatus;

	/** 跳过状态. */
	private String skipStatus;

	/** 升级状态. */
	private String escalateStatus;

	/** 抄送状态. */
	private String copyStatus;

	/** 抄送任务ID. */
	private String copyTaskId;

	/** 展示名称. */
	private String presentationName;

	/** 展示标题. */
	private String presentationSubject;

	/** 创建时间. */
	private Date createTime;

	/** 激活时间. */
	private Date activationTime;

	/** 领取时间. */
	private Date claimTime;

	/** 完成时间. */
	private Date completeTime;

	/** 过期时间. */
	private Date expirationTime;

	/** 最后修改时间. */
	private Date lastModifiedTime;

	/** 持续时间. */
	private String duration;

	/** 创建人. */
	private String creator;

	/** 任务发起人. */
	private String initiator;

	/** 负责人. */
	private String assignee;

	/** 委托人（被代理）. */
	private String owner;

	/** 最后处理人. */
	private String lastModifier;

	/** 泳道. */
	private String swimlane;

	/** 关联的任务ID. */
	private String taskId;

	/** 关联的分支ID. */
	private String executionId;

	/** 关联的流程实例ID. */
	private String processInstanceId;

	/** 关联的流程定义ID. */
	private String processDefinitionId;

	/** 扩展字段1. */
	private String attr1;

	/** 扩展字段2. */
	private String attr2;

	/** 扩展字段3. */
	private String attr3;

	/** 扩展字段4. */
	private String attr4;

	/** 扩展字段5. */
	private String attr5;

	/** 流程业务标识. */
	private String processBusinessKey;

	/** 关联的流程发起人. */
	private String processStarter;

	/** 分类. */
	private String catalog;

	/** 操作. */
	private String action;

	/** 意见. */
	private String comment;

	/** 消息. */
	private String message;

	/** . */
	private Set<TaskDeadline> taskDeadlines = new HashSet<TaskDeadline>(0);

	/** . */
	private Set<TaskInfo> taskInfos = new HashSet<TaskInfo>(0);

	/** . */
	private Set<TaskParticipant> taskParticipants = new HashSet<TaskParticipant>(0);

	/** . */
	private Set<TaskLog> taskLogs = new HashSet<TaskLog>(0);

	public TaskInfo()
	{
	}

	public TaskInfo(Long id)
	{
		this.id = id;
	}

	public TaskInfo(Long id, TaskInfo taskInfo, String businessKey, String code, String name, String description, Integer priority, String category, String form, String tenantId, String status,
			String suspendStatus, String delegateStatus, String completeStatus, String skipStatus, String escalateStatus, String copyStatus, String copyTaskId, String presentationName,
			String presentationSubject, Date createTime, Date activationTime, Date claimTime, Date completeTime, Date expirationTime, Date lastModifiedTime, String duration, String creator,
			String initiator, String assignee, String owner, String lastModifier, String swimlane, String taskId, String executionId, String processInstanceId, String processDefinitionId,
			String attr1, String attr2, String attr3, String attr4, String attr5, String processBusinessKey, String processStarter, String catalog, String action, String comment, String message,
			Set<TaskDeadline> taskDeadlines, Set<TaskInfo> taskInfos, Set<TaskParticipant> taskParticipants, Set<TaskLog> taskLogs)
	{
		this.id = id;
		this.taskInfo = taskInfo;
		this.businessKey = businessKey;
		this.code = code;
		this.name = name;
		this.description = description;
		this.priority = priority;
		this.category = category;
		this.form = form;
		this.tenantId = tenantId;
		this.status = status;
		this.suspendStatus = suspendStatus;
		this.delegateStatus = delegateStatus;
		this.completeStatus = completeStatus;
		this.skipStatus = skipStatus;
		this.escalateStatus = escalateStatus;
		this.copyStatus = copyStatus;
		this.copyTaskId = copyTaskId;
		this.presentationName = presentationName;
		this.presentationSubject = presentationSubject;
		this.createTime = createTime;
		this.activationTime = activationTime;
		this.claimTime = claimTime;
		this.completeTime = completeTime;
		this.expirationTime = expirationTime;
		this.lastModifiedTime = lastModifiedTime;
		this.duration = duration;
		this.creator = creator;
		this.initiator = initiator;
		this.assignee = assignee;
		this.owner = owner;
		this.lastModifier = lastModifier;
		this.swimlane = swimlane;
		this.taskId = taskId;
		this.executionId = executionId;
		this.processInstanceId = processInstanceId;
		this.processDefinitionId = processDefinitionId;
		this.attr1 = attr1;
		this.attr2 = attr2;
		this.attr3 = attr3;
		this.attr4 = attr4;
		this.attr5 = attr5;
		this.processBusinessKey = processBusinessKey;
		this.processStarter = processStarter;
		this.catalog = catalog;
		this.action = action;
		this.comment = comment;
		this.message = message;
		this.taskDeadlines = taskDeadlines;
		this.taskInfos = taskInfos;
		this.taskParticipants = taskParticipants;
		this.taskLogs = taskLogs;
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
	public TaskInfo getTaskInfo()
	{
		return this.taskInfo;
	}

	/**
	 * @param taskInfo
	 *            外键，父任务.
	 */
	public void setTaskInfo(TaskInfo taskInfo)
	{
		this.taskInfo = taskInfo;
	}

	/** @return 业务标识. */
	@Column(name = "BUSINESS_KEY", length = 100)
	public String getBusinessKey()
	{
		return this.businessKey;
	}

	/**
	 * @param businessKey
	 *            业务标识.
	 */
	public void setBusinessKey(String businessKey)
	{
		this.businessKey = businessKey;
	}

	/** @return 代码. */
	@Column(name = "CODE", length = 100)
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

	/** @return 分类. */
	@Column(name = "CATEGORY", length = 100)
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

	/** @return 表单. */
	@Column(name = "FORM", length = 100)
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

	/** @return 租户. */
	@Column(name = "TENANT_ID", length = 100)
	public String getTenantId()
	{
		return this.tenantId;
	}

	/**
	 * @param tenantId
	 *            租户.
	 */
	public void setTenantId(String tenantId)
	{
		this.tenantId = tenantId;
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

	/** @return 完成状态. */
	@Column(name = "COMPLETE_STATUS", length = 50)
	public String getCompleteStatus()
	{
		return this.completeStatus;
	}

	/**
	 * @param completeStatus
	 *            完成状态.
	 */
	public void setCompleteStatus(String completeStatus)
	{
		this.completeStatus = completeStatus;
	}

	/** @return 跳过状态. */
	@Column(name = "SKIP_STATUS", length = 50)
	public String getSkipStatus()
	{
		return this.skipStatus;
	}

	/**
	 * @param skipStatus
	 *            跳过状态.
	 */
	public void setSkipStatus(String skipStatus)
	{
		this.skipStatus = skipStatus;
	}

	/** @return 升级状态. */
	@Column(name = "ESCALATE_STATUS", length = 50)
	public String getEscalateStatus()
	{
		return this.escalateStatus;
	}

	/**
	 * @param escalateStatus
	 *            升级状态.
	 */
	public void setEscalateStatus(String escalateStatus)
	{
		this.escalateStatus = escalateStatus;
	}

	/** @return 抄送状态. */
	@Column(name = "COPY_STATUS", length = 50)
	public String getCopyStatus()
	{
		return this.copyStatus;
	}

	/**
	 * @param copyStatus
	 *            抄送状态.
	 */
	public void setCopyStatus(String copyStatus)
	{
		this.copyStatus = copyStatus;
	}

	/** @return 抄送任务ID. */
	@Column(name = "COPY_TASK_ID", length = 64)
	public String getCopyTaskId()
	{
		return this.copyTaskId;
	}

	/**
	 * @param copyTaskId
	 *            抄送任务ID.
	 */
	public void setCopyTaskId(String copyTaskId)
	{
		this.copyTaskId = copyTaskId;
	}

	/** @return 展示名称. */
	@Column(name = "PRESENTATION_NAME", length = 200)
	public String getPresentationName()
	{
		return this.presentationName;
	}

	/**
	 * @param presentationName
	 *            展示名称.
	 */
	public void setPresentationName(String presentationName)
	{
		this.presentationName = presentationName;
	}

	/** @return 展示标题. */
	@Column(name = "PRESENTATION_SUBJECT", length = 200)
	public String getPresentationSubject()
	{
		return this.presentationSubject;
	}

	/**
	 * @param presentationSubject
	 *            展示标题.
	 */
	public void setPresentationSubject(String presentationSubject)
	{
		this.presentationSubject = presentationSubject;
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

	/** @return 激活时间. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ACTIVATION_TIME", length = 26)
	public Date getActivationTime()
	{
		return this.activationTime;
	}

	/**
	 * @param activationTime
	 *            激活时间.
	 */
	public void setActivationTime(Date activationTime)
	{
		this.activationTime = activationTime;
	}

	/** @return 领取时间. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CLAIM_TIME", length = 26)
	public Date getClaimTime()
	{
		return this.claimTime;
	}

	/**
	 * @param claimTime
	 *            领取时间.
	 */
	public void setClaimTime(Date claimTime)
	{
		this.claimTime = claimTime;
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

	/** @return 过期时间. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "EXPIRATION_TIME", length = 26)
	public Date getExpirationTime()
	{
		return this.expirationTime;
	}

	/**
	 * @param expirationTime
	 *            过期时间.
	 */
	public void setExpirationTime(Date expirationTime)
	{
		this.expirationTime = expirationTime;
	}

	/** @return 最后修改时间. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "LAST_MODIFIED_TIME", length = 26)
	public Date getLastModifiedTime()
	{
		return this.lastModifiedTime;
	}

	/**
	 * @param lastModifiedTime
	 *            最后修改时间.
	 */
	public void setLastModifiedTime(Date lastModifiedTime)
	{
		this.lastModifiedTime = lastModifiedTime;
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

	/** @return 创建人. */
	@Column(name = "CREATOR", length = 64)
	public String getCreator()
	{
		return this.creator;
	}

	/**
	 * @param creator
	 *            创建人.
	 */
	public void setCreator(String creator)
	{
		this.creator = creator;
	}

	/** @return 任务发起人. */
	@Column(name = "INITIATOR", length = 64)
	public String getInitiator()
	{
		return this.initiator;
	}

	/**
	 * @param initiator
	 *            任务发起人.
	 */
	public void setInitiator(String initiator)
	{
		this.initiator = initiator;
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

	/** @return 委托人（被代理）. */
	@Column(name = "OWNER", length = 64)
	public String getOwner()
	{
		return this.owner;
	}

	/**
	 * @param owner
	 *            委托人（被代理）.
	 */
	public void setOwner(String owner)
	{
		this.owner = owner;
	}

	/** @return 最后处理人. */
	@Column(name = "LAST_MODIFIER", length = 64)
	public String getLastModifier()
	{
		return this.lastModifier;
	}

	/**
	 * @param lastModifier
	 *            最后处理人.
	 */
	public void setLastModifier(String lastModifier)
	{
		this.lastModifier = lastModifier;
	}

	/** @return 泳道. */
	@Column(name = "SWIMLANE", length = 100)
	public String getSwimlane()
	{
		return this.swimlane;
	}

	/**
	 * @param swimlane
	 *            泳道.
	 */
	public void setSwimlane(String swimlane)
	{
		this.swimlane = swimlane;
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

	/** @return 扩展字段1. */
	@Column(name = "ATTR1", length = 100)
	public String getAttr1()
	{
		return this.attr1;
	}

	/**
	 * @param attr1
	 *            扩展字段1.
	 */
	public void setAttr1(String attr1)
	{
		this.attr1 = attr1;
	}

	/** @return 扩展字段2. */
	@Column(name = "ATTR2", length = 100)
	public String getAttr2()
	{
		return this.attr2;
	}

	/**
	 * @param attr2
	 *            扩展字段2.
	 */
	public void setAttr2(String attr2)
	{
		this.attr2 = attr2;
	}

	/** @return 扩展字段3. */
	@Column(name = "ATTR3", length = 100)
	public String getAttr3()
	{
		return this.attr3;
	}

	/**
	 * @param attr3
	 *            扩展字段3.
	 */
	public void setAttr3(String attr3)
	{
		this.attr3 = attr3;
	}

	/** @return 扩展字段4. */
	@Column(name = "ATTR4", length = 100)
	public String getAttr4()
	{
		return this.attr4;
	}

	/**
	 * @param attr4
	 *            扩展字段4.
	 */
	public void setAttr4(String attr4)
	{
		this.attr4 = attr4;
	}

	/** @return 扩展字段5. */
	@Column(name = "ATTR5", length = 100)
	public String getAttr5()
	{
		return this.attr5;
	}

	/**
	 * @param attr5
	 *            扩展字段5.
	 */
	public void setAttr5(String attr5)
	{
		this.attr5 = attr5;
	}

	/** @return 流程业务标识. */
	@Column(name = "PROCESS_BUSINESS_KEY", length = 200)
	public String getProcessBusinessKey()
	{
		return this.processBusinessKey;
	}

	/**
	 * @param processBusinessKey
	 *            流程业务标识.
	 */
	public void setProcessBusinessKey(String processBusinessKey)
	{
		this.processBusinessKey = processBusinessKey;
	}

	/** @return 关联的流程发起人. */
	@Column(name = "PROCESS_STARTER", length = 64)
	public String getProcessStarter()
	{
		return this.processStarter;
	}

	/**
	 * @param processStarter
	 *            关联的流程发起人.
	 */
	public void setProcessStarter(String processStarter)
	{
		this.processStarter = processStarter;
	}

	/** @return 分类. */
	@Column(name = "CATALOG", length = 100)
	public String getCatalog()
	{
		return this.catalog;
	}

	/**
	 * @param catalog
	 *            分类.
	 */
	public void setCatalog(String catalog)
	{
		this.catalog = catalog;
	}

	/** @return 操作. */
	@Column(name = "ACTION", length = 200)
	public String getAction()
	{
		return this.action;
	}

	/**
	 * @param action
	 *            操作.
	 */
	public void setAction(String action)
	{
		this.action = action;
	}

	/** @return 意见. */
	@Column(name = "COMMENTS", length = 200)
	public String getComment()
	{
		return this.comment;
	}

	/**
	 * @param comment
	 *            意见.
	 */
	public void setComment(String comment)
	{
		this.comment = comment;
	}

	/** @return 消息. */
	@Column(name = "MESSAGE", length = 200)
	public String getMessage()
	{
		return this.message;
	}

	/**
	 * @param message
	 *            消息.
	 */
	public void setMessage(String message)
	{
		this.message = message;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "taskInfo")
	public Set<TaskDeadline> getTaskDeadlines()
	{
		return this.taskDeadlines;
	}

	/**
	 * @param taskDeadlines
	 *            .
	 */
	public void setTaskDeadlines(Set<TaskDeadline> taskDeadlines)
	{
		this.taskDeadlines = taskDeadlines;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "taskInfo")
	public Set<TaskInfo> getTaskInfos()
	{
		return this.taskInfos;
	}

	/**
	 * @param taskInfos
	 *            .
	 */
	public void setTaskInfos(Set<TaskInfo> taskInfos)
	{
		this.taskInfos = taskInfos;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "taskInfo")
	public Set<TaskParticipant> getTaskParticipants()
	{
		return this.taskParticipants;
	}

	/**
	 * @param taskParticipants
	 *            .
	 */
	public void setTaskParticipants(Set<TaskParticipant> taskParticipants)
	{
		this.taskParticipants = taskParticipants;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "taskInfo")
	public Set<TaskLog> getTaskLogs()
	{
		return this.taskLogs;
	}

	/**
	 * @param taskLogs
	 *            .
	 */
	public void setTaskLogs(Set<TaskLog> taskLogs)
	{
		this.taskLogs = taskLogs;
	}
}