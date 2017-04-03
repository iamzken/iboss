package com.woime.iboss.cms.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * CmsTagArticle .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "CMS_TAG_ARTICLE")
public class CmsTagArticle implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private CmsTag cmsTag;

	/** null. */
	private CmsArticle cmsArticle;

	/** null. */
	private String type;

	/** null. */
	private String tenantId;

	public CmsTagArticle()
	{
	}

	public CmsTagArticle(Long id)
	{
		this.id = id;
	}

	public CmsTagArticle(Long id, CmsTag cmsTag, CmsArticle cmsArticle, String type, String tenantId)
	{
		this.id = id;
		this.cmsTag = cmsTag;
		this.cmsArticle = cmsArticle;
		this.type = type;
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
	@JoinColumn(name = "TAG_ID")
	public CmsTag getCmsTag()
	{
		return this.cmsTag;
	}

	/**
	 * @param cmsTag
	 *            null.
	 */
	public void setCmsTag(CmsTag cmsTag)
	{
		this.cmsTag = cmsTag;
	}

	/** @return null. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ARTICLE_ID")
	public CmsArticle getCmsArticle()
	{
		return this.cmsArticle;
	}

	/**
	 * @param cmsArticle
	 *            null.
	 */
	public void setCmsArticle(CmsArticle cmsArticle)
	{
		this.cmsArticle = cmsArticle;
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
