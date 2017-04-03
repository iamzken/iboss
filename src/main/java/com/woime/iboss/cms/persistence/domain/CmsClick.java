package com.woime.iboss.cms.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * CmsClick .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "CMS_CLICK")
public class CmsClick implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private CmsArticle cmsArticle;

	/** null. */
	private String type;

	/** null. */
	private String userId;

	/** null. */
	private Date createTime;

	/** null. */
	private Integer priority;

	/** null. */
	private String tenantId;

	public CmsClick()
	{
	}

	public CmsClick(Long id)
	{
		this.id = id;
	}

	public CmsClick(Long id, CmsArticle cmsArticle, String type, String userId, Date createTime, Integer priority, String tenantId)
	{
		this.id = id;
		this.cmsArticle = cmsArticle;
		this.type = type;
		this.userId = userId;
		this.createTime = createTime;
		this.priority = priority;
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
	@Column(name = "USER_ID", length = 50)
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
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_TIME", length = 26)
	public Date getCreateTime()
	{
		return this.createTime;
	}

	/**
	 * @param createTime
	 *            null.
	 */
	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}

	/** @return null. */
	@Column(name = "PRIORITY")
	public Integer getPriority()
	{
		return this.priority;
	}

	/**
	 * @param priority
	 *            null.
	 */
	public void setPriority(Integer priority)
	{
		this.priority = priority;
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
