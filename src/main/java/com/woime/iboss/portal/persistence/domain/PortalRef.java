package com.woime.iboss.portal.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * PortalRef .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PORTAL_REF")
public class PortalRef implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private PortalInfo portalInfo;

	/** null. */
	private String userId;

	/** null. */
	private String tenantId;

	public PortalRef()
	{
	}

	public PortalRef(Long id)
	{
		this.id = id;
	}

	public PortalRef(Long id, PortalInfo portalInfo, String userId, String tenantId)
	{
		this.id = id;
		this.portalInfo = portalInfo;
		this.userId = userId;
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
	@JoinColumn(name = "INFO_ID")
	public PortalInfo getPortalInfo()
	{
		return this.portalInfo;
	}

	/**
	 * @param portalInfo
	 *            null.
	 */
	public void setPortalInfo(PortalInfo portalInfo)
	{
		this.portalInfo = portalInfo;
	}

	/** @return null. */
	@Column(name = "USER_ID", length = 64)
	public String getUserId()
	{
		return this.userId;
	}

	/**
	 * @param userId
	 *            null.
	 */
	public void setUserId(String userId)
	{
		this.userId = userId;
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
