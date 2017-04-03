package com.woime.iboss.internal.delegate.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * DelegateInfo .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "DELEGATE_INFO")
public class DelegateInfo implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String assignee;

	/** null. */
	private String attorney;

	/** null. */
	private Date startTime;

	/** null. */
	private Date endTime;

	/** null. */
	private String processDefinitionId;

	/** null. */
	private String taskDefinitionKey;

	/** null. */
	private Integer status;

	/** null. */
	private String tenantId;

	public DelegateInfo()
	{
	}

	public DelegateInfo(Long id)
	{
		this.id = id;
	}

	public DelegateInfo(Long id, String assignee, String attorney, Date startTime, Date endTime, String processDefinitionId, String taskDefinitionKey, Integer status, String tenantId)
	{
		this.id = id;
		this.assignee = assignee;
		this.attorney = attorney;
		this.startTime = startTime;
		this.endTime = endTime;
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
	@Column(name = "START_TIME", length = 26)
	public Date getStartTime()
	{
		return this.startTime;
	}

	/**
	 * @param startTime
	 *            null.
	 */
	public void setStartTime(Date startTime)
	{
		this.startTime = startTime;
	}

	/** @return null. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "END_TIME", length = 26)
	public Date getEndTime()
	{
		return this.endTime;
	}

	/**
	 * @param endTime
	 *            null.
	 */
	public void setEndTime(Date endTime)
	{
		this.endTime = endTime;
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
