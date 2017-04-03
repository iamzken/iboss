package com.woime.iboss.portal.persistence.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * PortalWidget .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PORTAL_WIDGET")
public class PortalWidget implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String name;

	/** null. */
	private String url;

	/** null. */
	private String data;

	/** null. */
	private String tenantId;

	/** . */
	private Set<PortalItem> portalItems = new HashSet<PortalItem>(0);

	public PortalWidget()
	{
	}

	public PortalWidget(Long id)
	{
		this.id = id;
	}

	public PortalWidget(Long id, String name, String url, String data, String tenantId, Set<PortalItem> portalItems)
	{
		this.id = id;
		this.name = name;
		this.url = url;
		this.data = data;
		this.tenantId = tenantId;
		this.portalItems = portalItems;
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
	@Column(name = "URL", length = 200)
	public String getUrl()
	{
		return this.url;
	}

	/**
	 * @param url
	 *            null.
	 */
	public void setUrl(String url)
	{
		this.url = url;
	}

	/** @return null. */
	@Column(name = "DATA", length = 200)
	public String getData()
	{
		return this.data;
	}

	/**
	 * @param data
	 *            null.
	 */
	public void setData(String data)
	{
		this.data = data;
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "portalWidget")
	public Set<PortalItem> getPortalItems()
	{
		return this.portalItems;
	}

	/**
	 * @param portalItems
	 *            .
	 */
	public void setPortalItems(Set<PortalItem> portalItems)
	{
		this.portalItems = portalItems;
	}
}
