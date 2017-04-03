package com.woime.iboss.internal.delegate.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * DelegateHistory .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "DELEGATE_HISTORY")
public class DelegateHistory implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String assignee;

	/** null. */
	private String attorney;

	/** null. */
	private Date delegateTime;

	/** null. */
	private String taskId;

	/** null. */
	private String processDefinitionId;

	/** null. */
	private String taskDefinitionKey;

	/** null. */
	private Integer status;

	/** null. */
	private String tenantId;

	public DelegateHistory()
	{
	}

	public DelegateHistory(Long id)
	{
		this.id = id;
	}

	public DelegateHistory(Long id, String assignee, String attorney, Date delegateTime, String taskId, String processDefinitionId, String taskDefinitionKey, Integer status, String tenantId)
	{
		this.id = id;
		this.assignee = assignee;
		this.attorney = attorney;
		this.delegateTime = delegateTime;
		this.taskId = taskId;
		this.processDefinitionId = processDefinitionId;
		this.taskDefinitionKey = taskDefinitionKey;
		this.status = status;
		this.tenantId = tenantId;
	}

	/** @return null. */
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Long getId()
	{
		return this.id;
	}

	/**
	 * @param id
	 *            null.
	 */
	public void setId(Long id)
	{
		this.id = id;
	}

	/** @return null. */
	@Column(name = "ASSIGNEE", length = 200)
	public String getAssignee()
	{
		return this.assignee;
	}

	/**
	 * @param assignee
	 *            null.
	 */
	public void setAssignee(String assignee)
	{
		this.assignee = assignee;
	}

	/** @return null. */
	@Column(name = "ATTORNEY", length = 200)
	public String getAttorney()
	{
		return this.attorney;
	}

	/**
	 * @param attorney
	 *            null.
	 */
	public void setAttorney(String attorney)
	{
		this.attorney = attorney;
	}

	/** @return null. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "DELEGATE_TIME", length = 26)
	public Date getDelegateTime()
	{
		return this.delegateTime;
	}

	/**
	 * @param delegateTime
	 *            null.
	 */
	public void setDelegateTime(Date delegateTime)
	{
		this.delegateTime = delegateTime;
	}

	/** @return null. */
	@Column(name = "TASK_ID", length = 100)
	public String getTaskId()
	{
		return this.taskId;
	}

	/**
	 * @param taskId
	 *            null.
	 */
	public void setTaskId(String taskId)
	{
		this.taskId = taskId;
	}

	/** @return null. */
	@Column(name = "PROCESS_DEFINITION_ID", length = 100)
	public String getProcessDefinitionId()
	{
		return this.processDefinitionId;
	}

	/**
	 * @param processDefinitionId
	 *            null.
	 */
	public void setProcessDefinitionId(String processDefinitionId)
	{
		this.processDefinitionId = processDefinitionId;
	}

	/** @return null. */
	@Column(name = "TASK_DEFINITION_KEY", length = 100)
	public String getTaskDefinitionKey()
	{
		return this.taskDefinitionKey;
	}

	/**
	 * @param taskDefinitionKey
	 *            null.
	 */
	public void setTaskDefinitionKey(String taskDefinitionKey)
	{
		this.taskDefinitionKey = taskDefinitionKey;
	}

	/** @return null. */
	@Column(name = "STATUS")
	public Integer getStatus()
	{
		return this.status;
	}

	/**
	 * @param status
	 *            null.
	 */
	public void setStatus(Integer status)
	{
		this.status = status;
	}

	/** @return null. */
	@Column(name = "TENANT_ID", length = 64)
	public String getTenantId()
	{
		return this.tenantId;
	}

	/**
	 * @param tenantId
	 *            null.
	 */
	public void setTenantId(String tenantId)
	{
		this.tenantId = tenantId;
	}
}
