package com.woime.iboss.internal.template.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * TemplateField .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "TEMPLATE_FIELD")
public class TemplateField implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private TemplateInfo templateInfo;

	/** null. */
	private String name;

	/** null. */
	private String type;

	/** null. */
	private String content;

	/** null. */
	private String tenantId;

	public TemplateField()
	{
	}

	public TemplateField(Long id)
	{
		this.id = id;
	}

	public TemplateField(Long id, TemplateInfo templateInfo, String name, String type, String content, String tenantId)
	{
		this.id = id;
		this.templateInfo = templateInfo;
		this.name = name;
		this.type = type;
		this.content = content;
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
	public TemplateInfo getTemplateInfo()
	{
		return this.templateInfo;
	}

	/**
	 * @param templateInfo
	 *            null.
	 */
	public void setTemplateInfo(TemplateInfo templateInfo)
	{
		this.templateInfo = templateInfo;
	}

	/** @return null. */
	@Column(name = "NAME", length = 50)
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
	@Column(name = "TYPE", length = 50)
	public String getType()
	{
		return this.type;
	}

	/**
	 * @param type
	 *            null.
	 */
	public void setType(String type)
	{
		this.type = type;
	}

	/** @return null. */
	@Column(name = "CONTENT", length = 65535)
	public String getContent()
	{
		return this.content;
	}

	/**
	 * @param content
	 *            null.
	 */
	public void setContent(String content)
	{
		this.content = content;
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
