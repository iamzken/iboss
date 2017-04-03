package com.woime.iboss.auth.persistence.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * UserStatus 账号.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "auth_user_status")
public class UserStatus implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 账号. */
	private String username;

	/** 遗留字段. */
	private String password;

	/** 状态. */
	private Integer status;

	/** 外部引用. */
	private String ref;

	/** 账号体系引用，暂时没用. */
	private String userRepoRef;

	/** 租户. */
	private String tenantId;

	/** . */
	private Set<Role> roles = new HashSet<Role>(0);

	public UserStatus()
	{
	}

	public UserStatus(Long id)
	{
		this.id = id;
	}

	public UserStatus(Long id, String username, String password, Integer status, String ref, String userRepoRef, String tenantId, Set<Role> roles)
	{
		this.id = id;
		this.username = username;
		this.password = password;
		this.status = status;
		this.ref = ref;
		this.userRepoRef = userRepoRef;
		this.tenantId = tenantId;
		this.roles = roles;
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

	/** @return 账号. */
	@Column(name = "USERNAME", length = 50)
	public String getUsername()
	{
		return this.username;
	}

	/**
	 * @param username
	 *            账号.
	 */
	public void setUsername(String username)
	{
		this.username = username;
	}

	/** @return 遗留字段. */
	@Column(name = "PASSWORD", length = 50)
	public String getPassword()
	{
		return this.password;
	}

	/**
	 * @param password
	 *            遗留字段.
	 */
	public void setPassword(String password)
	{
		this.password = password;
	}

	/** @return 状态. */
	@Column(name = "STATUS")
	public Integer getStatus()
	{
		return this.status;
	}

	/**
	 * @param status
	 *            状态.
	 */
	public void setStatus(Integer status)
	{
		this.status = status;
	}

	/** @return 外部引用. */
	@Column(name = "REF", length = 200)
	public String getRef()
	{
		return this.ref;
	}

	/**
	 * @param ref
	 *            外部引用.
	 */
	public void setRef(String ref)
	{
		this.ref = ref;
	}

	/** @return 账号体系引用，暂时没用. */
	@Column(name = "USER_REPO_REF", length = 50)
	public String getUserRepoRef()
	{
		return this.userRepoRef;
	}

	/**
	 * @param userRepoRef
	 *            账号体系引用，暂时没用.
	 */
	public void setUserRepoRef(String userRepoRef)
	{
		this.userRepoRef = userRepoRef;
	}

	/** @return 租户. */
	@Column(name = "TENANT_ID", length = 50)
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
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "AUTH_USER_ROLE", joinColumns = { @JoinColumn(name = "USER_STATUS_ID", nullable = false, updatable = false) }, inverseJoinColumns = {
			@JoinColumn(name = "ROLE_ID", nullable = false, updatable = false) })
	public Set<Role> getRoles()
	{
		return this.roles;
	}

	/**
	 * @param roles
	 *            .
	 */
	public void setRoles(Set<Role> roles)
	{
		this.roles = roles;
	}
}
