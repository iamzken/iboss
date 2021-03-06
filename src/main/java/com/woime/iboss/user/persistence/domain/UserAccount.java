package com.woime.iboss.user.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * UserAccount .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "USER_ACCOUNT")
public class UserAccount implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private UserAccountType userAccountType;

	/** null. */
	private UserBase userBase;

	/** null. */
	private String username;

	/** null. */
	private String password;

	/** null. */
	private String scopeId;

	public UserAccount()
	{
	}

	public UserAccount(Long id)
	{
		this.id = id;
	}

	public UserAccount(Long id, UserAccountType userAccountType, UserBase userBase, String username, String password, String scopeId)
	{
		this.id = id;
		this.userAccountType = userAccountType;
		this.userBase = userBase;
		this.username = username;
		this.password = password;
		this.scopeId = scopeId;
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
	@JoinColumn(name = "TYPE_ID")
	public UserAccountType getUserAccountType()
	{
		return this.userAccountType;
	}

	/**
	 * @param userAccountType
	 *            null.
	 */
	public void setUserAccountType(UserAccountType userAccountType)
	{
		this.userAccountType = userAccountType;
	}

	/** @return null. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "USER_BASE_ID")
	public UserBase getUserBase()
	{
		return this.userBase;
	}

	/**
	 * @param userBase
	 *            null.
	 */
	public void setUserBase(UserBase userBase)
	{
		this.userBase = userBase;
	}

	/** @return null. */
	@Column(name = "USERNAME", length = 50)
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
	@Column(name = "PASSWORD", length = 50)
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

	/** @return null. */
	@Column(name = "SCOPE_ID", length = 50)
	public String getScopeId()
	{
		return this.scopeId;
	}

	/**
	 * @param scopeId
	 *            null.
	 */
	public void setScopeId(String scopeId)
	{
		this.scopeId = scopeId;
	}
}
