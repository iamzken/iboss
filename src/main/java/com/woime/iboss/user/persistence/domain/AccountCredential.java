package com.woime.iboss.user.persistence.domain;

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
 * AccountCredential 账号密码.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "ACCOUNT_CREDENTIAL")
public class AccountCredential implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 外键，账号信息. */
	private AccountInfo accountInfo;

	/** 密码. */
	private String password;

	/** 修改时间. */
	private Date modifyTime;

	/** 过期时间. */
	private Date expireTime;

	/** 过期状态. */
	private String expireStatus;

	/** 是否必须填写密码. */
	private String required;

	/** 是否可以修改. */
	private String couldModify;

	/** 类型，低级别密码，otp，ssh之类的类型. */
	private String type;

	/** 分类，默认密码，专用密码. */
	private String catalog;

	/** 额外信息. */
	private String data;

	/** 状态，启用，禁用. */
	private String status;

	/** 租户. */
	private String tenantId;

	/** . */
	private Set<AccountHistoryCredential> accountHistoryCredentials = new HashSet<AccountHistoryCredential>(0);

	public AccountCredential()
	{
	}

	public AccountCredential(Long id)
	{
		this.id = id;
	}

	public AccountCredential(Long id, AccountInfo accountInfo, String password, Date modifyTime, Date expireTime, String expireStatus, String required, String couldModify, String type, String catalog,
			String data, String status, String tenantId, Set<AccountHistoryCredential> accountHistoryCredentials)
	{
		this.id = id;
		this.accountInfo = accountInfo;
		this.password = password;
		this.modifyTime = modifyTime;
		this.expireTime = expireTime;
		this.expireStatus = expireStatus;
		this.required = required;
		this.couldModify = couldModify;
		this.type = type;
		this.catalog = catalog;
		this.data = data;
		this.status = status;
		this.tenantId = tenantId;
		this.accountHistoryCredentials = accountHistoryCredentials;
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

	/** @return 外键，账号信息. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ACCOUNT_ID")
	public AccountInfo getAccountInfo()
	{
		return this.accountInfo;
	}

	/**
	 * @param accountInfo
	 *            外键，账号信息.
	 */
	public void setAccountInfo(AccountInfo accountInfo)
	{
		this.accountInfo = accountInfo;
	}

	/** @return 密码. */
	@Column(name = "PASSWORD", length = 50)
	public String getPassword()
	{
		return this.password;
	}

	/**
	 * @param password
	 *            密码.
	 */
	public void setPassword(String password)
	{
		this.password = password;
	}

	/** @return 修改时间. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "MODIFY_TIME", length = 26)
	public Date getModifyTime()
	{
		return this.modifyTime;
	}

	/**
	 * @param modifyTime
	 *            修改时间.
	 */
	public void setModifyTime(Date modifyTime)
	{
		this.modifyTime = modifyTime;
	}

	/** @return 过期时间. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "EXPIRE_TIME", length = 26)
	public Date getExpireTime()
	{
		return this.expireTime;
	}

	/**
	 * @param expireTime
	 *            过期时间.
	 */
	public void setExpireTime(Date expireTime)
	{
		this.expireTime = expireTime;
	}

	/** @return 过期状态. */
	@Column(name = "EXPIRE_STATUS", length = 50)
	public String getExpireStatus()
	{
		return this.expireStatus;
	}

	/**
	 * @param expireStatus
	 *            过期状态.
	 */
	public void setExpireStatus(String expireStatus)
	{
		this.expireStatus = expireStatus;
	}

	/** @return 是否必须填写密码. */
	@Column(name = "REQUIRED", length = 50)
	public String getRequired()
	{
		return this.required;
	}

	/**
	 * @param required
	 *            是否必须填写密码.
	 */
	public void setRequired(String required)
	{
		this.required = required;
	}

	/** @return 是否可以修改. */
	@Column(name = "COULD_MODIFY", length = 50)
	public String getCouldModify()
	{
		return this.couldModify;
	}

	/**
	 * @param couldModify
	 *            是否可以修改.
	 */
	public void setCouldModify(String couldModify)
	{
		this.couldModify = couldModify;
	}

	/** @return 类型，低级别密码，otp，ssh之类的类型. */
	@Column(name = "TYPE", length = 50)
	public String getType()
	{
		return this.type;
	}

	/**
	 * @param type
	 *            类型，低级别密码，otp，ssh之类的类型.
	 */
	public void setType(String type)
	{
		this.type = type;
	}

	/** @return 分类，默认密码，专用密码. */
	@Column(name = "CATALOG", length = 50)
	public String getCatalog()
	{
		return this.catalog;
	}

	/**
	 * @param catalog
	 *            分类，默认密码，专用密码.
	 */
	public void setCatalog(String catalog)
	{
		this.catalog = catalog;
	}

	/** @return 额外信息. */
	@Column(name = "DATA", length = 200)
	public String getData()
	{
		return this.data;
	}

	/**
	 * @param data
	 *            额外信息.
	 */
	public void setData(String data)
	{
		this.data = data;
	}

	/** @return 状态，启用，禁用. */
	@Column(name = "STATUS", length = 50)
	public String getStatus()
	{
		return this.status;
	}

	/**
	 * @param status
	 *            状态，启用，禁用.
	 */
	public void setStatus(String status)
	{
		this.status = status;
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "accountCredential")
	public Set<AccountHistoryCredential> getAccountHistoryCredentials()
	{
		return this.accountHistoryCredentials;
	}

	/**
	 * @param accountHistoryCredentials
	 *            .
	 */
	public void setAccountHistoryCredentials(Set<AccountHistoryCredential> accountHistoryCredentials)
	{
		this.accountHistoryCredentials = accountHistoryCredentials;
	}
}
