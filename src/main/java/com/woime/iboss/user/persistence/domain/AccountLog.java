package com.woime.iboss.user.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * AccountLog .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "ACCOUNT_LOG")
public class AccountLog implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String username;

	/** null. */
	private String result;

	/** null. */
	private String reason;

	/** null. */
	private String application;

	/** null. */
	private Date logTime;

	/** null. */
	private String client;

	/** null. */
	private String server;

	/** null. */
	private String description;

	/** 租户. */
	private String tenantId;

	public AccountLog()
	{
	}

	public AccountLog(Long id)
	{
		this.id = id;
	}

	public AccountLog(Long id, String username, String result, String reason, String application, Date logTime, String client, String server, String description, String tenantId)
	{
		this.id = id;
		this.username = username;
		this.result = result;
		this.reason = reason;
		this.application = application;
		this.logTime = logTime;
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
	@Column(name = "USERNAME", length = 64)
	public String getUsername()
	{
		return this.username;
	}

	/**
	 * @param username
	 *            null.
	 */
	public void setUsername(String username)
	{
		this.username = username;
	}

	/** @return null. */
	@Column(name = "RESULT", length = 64)
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
	@Column(name = "REASON", length = 200)
	public String getReason()
	{
		return this.reason;
	}

	/**
	 * @param reason
	 *            null.
	 */
	public void setReason(String reason)
	{
		this.reason = reason;
	}

	/** @return null. */
	@Column(name = "APPLICATION", length = 200)
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
	@Column(name = "LOG_TIME", length = 26)
	public Date getLogTime()
	{
		return this.logTime;
	}

	/**
	 * @param logTime
	 *            null.
	 */
	public void setLogTime(Date logTime)
	{
		this.logTime = logTime;
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

	/** @return 租户. */
	@Column(name = "TENANT_ID", length = 64)
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
}
