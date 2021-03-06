package com.woime.iboss.org.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * OrgDepartment .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "ORG_DEPARTMENT")
public class OrgDepartment implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String code;

	/** null. */
	private String name;

	/** null. */
	private String descn;

	/** null. */
	private Integer status;

	/** null. */
	private String ref;

	/** null. */
	private String tenantId;

	public OrgDepartment()
	{
	}

	public OrgDepartment(Long id)
	{
		this.id = id;
	}

	public OrgDepartment(Long id, String code, String name, String descn, Integer status, String ref, String tenantId)
	{
		this.id = id;
		this.code = code;
		this.name = name;
		this.descn = descn;
		this.status = status;
		this.ref = ref;
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
	@Column(name = "CODE", length = 50)
	public String getCode()
	{
		return this.code;
	}

	/**
	 * @param code
	 *            null.
	 */
	public void setCode(String code)
	{
		this.code = code;
	}

	/** @return null. */
	@Column(name = "NAME", length = 200)
	public String getName()
	{
		return this.name;
	}

	/**
	 * @param name
	 *            null.
	 */
	public void setName(String name)
	{
		this.name = name;
	}

	/** @return null. */
	@Column(name = "DESCN", length = 200)
	public String getDescn()
	{
		return this.descn;
	}

	/**
	 * @param descn
	 *            null.
	 */
	public void setDescn(String descn)
	{
		this.descn = descn;
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
	@Column(name = "REF", length = 200)
	public String getRef()
	{
		return this.ref;
	}

	/**
	 * @param ref
	 *            null.
	 */
	public void setRef(String ref)
	{
		this.ref = ref;
	}

	/** @return null. */
	@Column(name = "TENANT_ID", length = 50)
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
