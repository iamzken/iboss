package com.woime.iboss.auth.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Access 资源.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "auth_access")
public class Access implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 外键，权限. */
	private Perm perm;

	/** 类型. */
	private String type;

	/** 内容. */
	private String value;

	/** 排序. */
	private Integer priority;

	/** 备注. */
	private String descn;

	/** 租户. */
	private String tenantId;

	public Access()
	{
	}

	public Access(Long id)
	{
		this.id = id;
	}

	public Access(Long id, Perm perm, String type, String value, Integer priority, String descn, String tenantId)
	{
		this.id = id;
		this.perm = perm;
		this.type = type;
		this.value = value;
		this.priority = priority;
		this.descn = descn;
		this.tenantId = tenantId;
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

	/** @return 外键，权限. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PERM_ID")
	public Perm getPerm()
	{
		return this.perm;
	}

	/**
	 * @param perm
	 *            外键，权限.
	 */
	public void setPerm(Perm perm)
	{
		this.perm = perm;
	}

	/** @return 类型. */
	@Column(name = "TYPE", length = 50)
	public String getType()
	{
		return this.type;
	}

	/**
	 * @param type
	 *            类型.
	 */
	public void setType(String type)
	{
		this.type = type;
	}

	/** @return 内容. */
	@Column(name = "VALUE", length = 200)
	public String getValue()
	{
		return this.value;
	}

	/**
	 * @param value
	 *            内容.
	 */
	public void setValue(String value)
	{
		this.value = value;
	}

	/** @return 排序. */
	@Column(name = "PRIORITY")
	public Integer getPriority()
	{
		return this.priority;
	}

	/**
	 * @param priority
	 *            排序.
	 */
	public void setPriority(Integer priority)
	{
		this.priority = priority;
	}

	/** @return 备注. */
	@Column(name = "DESCN", length = 200)
	public String getDescn()
	{
		return this.descn;
	}

	/**
	 * @param descn
	 *            备注.
	 */
	public void setDescn(String descn)
	{
		this.descn = descn;
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
}
