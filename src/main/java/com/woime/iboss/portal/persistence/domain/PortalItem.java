package com.woime.iboss.portal.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * PortalItem .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PORTAL_ITEM")
public class PortalItem implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private PortalInfo portalInfo;

	/** null. */
	private PortalWidget portalWidget;

	/** null. */
	private String name;

	/** null. */
	private Integer columnIndex;

	/** null. */
	private Integer rowIndex;

	/** null. */
	private String data;

	/** null. */
	private String tenantId;

	public PortalItem()
	{
	}

	public PortalItem(Long id)
	{
		this.id = id;
	}

	public PortalItem(Long id, PortalInfo portalInfo, PortalWidget portalWidget, String name, Integer columnIndex, Integer rowIndex, String data, String tenantId)
	{
		this.id = id;
		this.portalInfo = portalInfo;
		this.portalWidget = portalWidget;
		this.name = name;
		this.columnIndex = columnIndex;
		this.rowIndex = rowIndex;
		this.data = data;
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
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "WIDGET_ID")
	public PortalWidget getPortalWidget()
	{
		return this.portalWidget;
	}

	/**
	 * @param portalWidget
	 *            null.
	 */
	public void setPortalWidget(PortalWidget portalWidget)
	{
		this.portalWidget = portalWidget;
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
	@Column(name = "COLUMN_INDEX")
	public Integer getColumnIndex()
	{
		return this.columnIndex;
	}

	/**
	 * @param columnIndex
	 *            null.
	 */
	public void setColumnIndex(Integer columnIndex)
	{
		this.columnIndex = columnIndex;
	}

	/** @return null. */
	@Column(name = "ROW_INDEX")
	public Integer getRowIndex()
	{
		return this.rowIndex;
	}

	/**
	 * @param rowIndex
	 *            null.
	 */
	public void setRowIndex(Integer rowIndex)
	{
		this.rowIndex = rowIndex;
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
}
