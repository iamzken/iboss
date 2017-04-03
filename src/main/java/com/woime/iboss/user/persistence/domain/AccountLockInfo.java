package com.woime.iboss.user.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * AccountLockInfo .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "ACCOUNT_LOCK_INFO")
public class AccountLockInfo implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String type;

	/** null. */
	private String username;

	/** null. */
	private Date lockTime;

	/** null. */
	private Date releaseTime;

	/** 租户. */
	private String tenantId;

	public AccountLockInfo()
	{
	}

	public AccountLockInfo(Long id)
	{
		this.id = id;
	}

	public AccountLockInfo(Long id, String type, String username, Date lockTime, Date releaseTime, String tenantId)
	{
		this.id = id;
		this.type = type;
		this.username = username;
		this.lockTime = lockTime;
		this.releaseTime = releaseTime;
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
	@Column(name = "TYPE", length = 200)
	public String getType()
	{
		return this.type;
	}

	/**
	 * @param type
	 *            null.
	 */
	public void setType(String type)
	{
		this.type = type;
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
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "LOCK_TIME", length = 26)
	public Date getLockTime()
	{
		return this.lockTime;
	}

	/**
	 * @param lockTime
	 *            null.
	 */
	public void setLockTime(Date lockTime)
	{
		this.lockTime = lockTime;
	}

	/** @return null. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "RELEASE_TIME", length = 26)
	public Date getReleaseTime()
	{
		return this.releaseTime;
	}

	/**
	 * @param releaseTime
	 *            null.
	 */
	public void setReleaseTime(Date releaseTime)
	{
		this.releaseTime = releaseTime;
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
