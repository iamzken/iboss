package com.woime.iboss.user.persistence.domain;

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
 * AccountHistoryCredential .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "ACCOUNT_HISTORY_CREDENTIAL")
public class AccountHistoryCredential implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private AccountCredential accountCredential;

	/** null. */
	private Date modifyTime;

	/** null. */
	private String password;

	/** 租户. */
	private String tenantId;

	public AccountHistoryCredential()
	{
	}

	public AccountHistoryCredential(Long id)
	{
		this.id = id;
	}

	public AccountHistoryCredential(Long id, AccountCredential accountCredential, Date modifyTime, String password, String tenantId)
	{
		this.id = id;
		this.accountCredential = accountCredential;
		this.modifyTime = modifyTime;
		this.password = password;
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
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CREDENTIAL_ID")
	public AccountCredential getAccountCredential()
	{
		return this.accountCredential;
	}

	/**
	 * @param accountCredential
	 *            null.
	 */
	public void setAccountCredential(AccountCredential accountCredential)
	{
		this.accountCredential = accountCredential;
	}

	/** @return null. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "MODIFY_TIME", length = 26)
	public Date getModifyTime()
	{
		return this.modifyTime;
	}

	/**
	 * @param modifyTime
	 *            null.
	 */
	public void setModifyTime(Date modifyTime)
	{
		this.modifyTime = modifyTime;
	}

	/** @return null. */
	@Column(name = "PASSWORD", length = 100)
	public String getPassword()
	{
		return this.password;
	}

	/**
	 * @param password
	 *            null.
	 */
	public void setPassword(String password)
	{
		this.password = password;
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
