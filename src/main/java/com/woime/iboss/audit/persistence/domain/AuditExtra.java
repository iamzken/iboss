package com.woime.iboss.audit.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * AuditExtra .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "audit_extra")
public class AuditExtra implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String name;

	/** null. */
	private String value;

	/** null. */
	private Long auditBaseId;

	/** null. */
	private String tenantId;

	public AuditExtra()
	{
	}

	public AuditExtra(Long id)
	{
		this.id = id;
	}

	public AuditExtra(Long id, String name, String value, Long auditBaseId, String tenantId)
	{
		this.id = id;
		this.name = name;
		this.value = value;
		this.auditBaseId = auditBaseId;
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
	@Column(name = "\"NAME\"", length = 200)
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
	@Column(name = "VALUE_", length = 200)
	public String getValue()
	{
		return this.value;
	}

	/**
	 * @param value
	 *            null.
	 */
	public void setValue(String value)
	{
		this.value = value;
	}

	/** @return null. */
	@Column(name = "AUDIT_BASE_ID")
	public Long getAuditBaseId()
	{
		return this.auditBaseId;
	}

	/**
	 * @param auditBaseId
	 *            null.
	 */
	public void setAuditBaseId(Long auditBaseId)
	{
		this.auditBaseId = auditBaseId;
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
