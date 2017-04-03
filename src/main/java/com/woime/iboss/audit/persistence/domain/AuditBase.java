package com.woime.iboss.audit.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * AuditBase .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "audit_base")
public class AuditBase implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String user;

	/** null. */
	private String resourceType;

	/** null. */
	private String resourceId;

	/** null. */
	private String action;

	/** null. */
	private String result;

	/** null. */
	private String application;

	/** null. */
	private Date auditTime;

	/** null. */
	private String client;

	/** null. */
	private String server;

	/** null. */
	private String description;

	/** null. */
	private String tenantId;

	public AuditBase()
	{
	}

	public AuditBase(Long id)
	{
		this.id = id;
	}

	public AuditBase(Long id, String user, String resourceType, String resourceId, String action, String result, String application, Date auditTime, String client, String server, String description,
			String tenantId)
	{
		this.id = id;
		this.user = user;
		this.resourceType = resourceType;
		this.resourceId = resourceId;
		this.action = action;
		this.result = result;
		this.application = application;
		this.auditTime = auditTime;
		this.client = client;
		this.server = server;
		this.description = description;
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
	@Column(name = "\"USER\"", length = 200)
	public String getUser()
	{
		return this.user;
	}

	/**
	 * @param user
	 *            null.
	 */
	public void setUser(String user)
	{
		this.user = user;
	}

	/** @return null. */
	@Column(name = "RESOURCE_TYPE", length = 200)
	public String getResourceType()
	{
		return this.resourceType;
	}

	/**
	 * @param resourceType
	 *            null.
	 */
	public void setResourceType(String resourceType)
	{
		this.resourceType = resourceType;
	}

	/** @return null. */
	@Column(name = "RESOURCE_ID", length = 200)
	public String getResourceId()
	{
		return this.resourceId;
	}

	/**
	 * @param resourceId
	 *            null.
	 */
	public void setResourceId(String resourceId)
	{
		this.resourceId = resourceId;
	}

	/** @return null. */
	@Column(name = "ACTION", length = 200)
	public String getAction()
	{
		return this.action;
	}

	/**
	 * @param action
	 *            null.
	 */
	public void setAction(String action)
	{
		this.action = action;
	}

	/** @return null. */
	@Column(name = "\"RESULT\"", length = 200)
	public String getResult()
	{
		return this.result;
	}

	/**
	 * @param result
	 *            null.
	 */
	public void setResult(String result)
	{
		this.result = result;
	}

	/** @return null. */
	@Column(name = "\"APPLICATION\"", length = 200)
	public String getApplication()
	{
		return this.application;
	}

	/**
	 * @param application
	 *            null.
	 */
	public void setApplication(String application)
	{
		this.application = application;
	}

	/** @return null. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "AUDIT_TIME", length = 26)
	public Date getAuditTime()
	{
		return this.auditTime;
	}

	/**
	 * @param auditTime
	 *            null.
	 */
	public void setAuditTime(Date auditTime)
	{
		this.auditTime = auditTime;
	}

	/** @return null. */
	@Column(name = "CLIENT", length = 200)
	public String getClient()
	{
		return this.client;
	}

	/**
	 * @param client
	 *            null.
	 */
	public void setClient(String client)
	{
		this.client = client;
	}

	/** @return null. */
	@Column(name = "SERVER", length = 200)
	public String getServer()
	{
		return this.server;
	}

	/**
	 * @param server
	 *            null.
	 */
	public void setServer(String server)
	{
		this.server = server;
	}

	/** @return null. */
	@Column(name = "DESCRIPTION", length = 200)
	public String getDescription()
	{
		return this.description;
	}

	/**
	 * @param description
	 *            null.
	 */
	public void setDescription(String description)
	{
		this.description = description;
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
