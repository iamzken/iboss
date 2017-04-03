package com.woime.iboss.cms.persistence.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * CmsContent .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "CMS_CONTENT")
public class CmsContent implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String name;

	/** null. */
	private String code;

	/** null. */
	private String content;

	/** null. */
	private String tenantId;

	/** . */
	private Set<CmsVersion> cmsVersions = new HashSet<CmsVersion>(0);

	public CmsContent()
	{
	}

	public CmsContent(Long id)
	{
		this.id = id;
	}

	public CmsContent(Long id, String name, String code, String content, String tenantId, Set<CmsVersion> cmsVersions)
	{
		this.id = id;
		this.name = name;
		this.code = code;
		this.content = content;
		this.tenantId = tenantId;
		this.cmsVersions = cmsVersions;
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
	@Column(name = "CODE", length = 200)
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cmsContent")
	public Set<CmsVersion> getCmsVersions()
	{
		return this.cmsVersions;
	}

	/**
	 * @param cmsVersions
	 *            .
	 */
	public void setCmsVersions(Set<CmsVersion> cmsVersions)
	{
		this.cmsVersions = cmsVersions;
	}
}
