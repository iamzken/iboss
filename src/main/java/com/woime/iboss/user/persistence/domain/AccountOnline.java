package com.woime.iboss.user.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * AccountOnline .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "ACCOUNT_ONLINE")
public class AccountOnline implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String account;

	/** null. */
	private String sessionId;

	/** null. */
	private Date loginTime;

	/** 租户. */
	private String tenantId;

	public AccountOnline()
	{
	}

	public AccountOnline(Long id)
	{
		this.id = id;
	}

	public AccountOnline(Long id, String account, String sessionId, Date loginTime, String tenantId)
	{
		this.id = id;
		this.account = account;
		this.sessionId = sessionId;
		this.loginTime = loginTime;
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
	@Column(name = "ACCOUNT", length = 200)
	public String getAccount()
	{
		return this.account;
	}

	/**
	 * @param account
	 *            null.
	 */
	public void setAccount(String account)
	{
		this.account = account;
	}

	/** @return null. */
	@Column(name = "SESSION_ID", length = 200)
	public String getSessionId()
	{
		return this.sessionId;
	}

	/**
	 * @param sessionId
	 *            null.
	 */
	public void setSessionId(String sessionId)
	{
		this.sessionId = sessionId;
	}

	/** @return null. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "LOGIN_TIME", length = 26)
	public Date getLoginTime()
	{
		return this.loginTime;
	}

	/**
	 * @param loginTime
	 *            null.
	 */
	public void setLoginTime(Date loginTime)
	{
		this.loginTime = loginTime;
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
