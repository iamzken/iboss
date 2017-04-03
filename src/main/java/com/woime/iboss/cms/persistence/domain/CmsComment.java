package com.woime.iboss.cms.persistence.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * CmsComment .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "CMS_COMMENT")
public class CmsComment implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private CmsComment cmsComment;

	/** null. */
	private CmsArticle cmsArticle;

	/** null. */
	private String title;

	/** null. */
	private String content;

	/** null. */
	private Integer status;

	/** null. */
	private Date createTime;

	/** null. */
	private String userId;

	/** null. */
	private String tenantId;

	/** . */
	private Set<CmsFavorite> cmsFavorites = new HashSet<CmsFavorite>(0);

	/** . */
	private Set<CmsComment> cmsComments = new HashSet<CmsComment>(0);

	public CmsComment()
	{
	}

	public CmsComment(Long id)
	{
		this.id = id;
	}

	public CmsComment(Long id, CmsComment cmsComment, CmsArticle cmsArticle, String title, String content, Integer status, Date createTime, String userId, String tenantId,
			Set<CmsFavorite> cmsFavorites, Set<CmsComment> cmsComments)
	{
		this.id = id;
		this.cmsComment = cmsComment;
		this.cmsArticle = cmsArticle;
		this.title = title;
		this.content = content;
		this.status = status;
		this.createTime = createTime;
		this.userId = userId;
		this.tenantId = tenantId;
		this.cmsFavorites = cmsFavorites;
		this.cmsComments = cmsComments;
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
	@JoinColumn(name = "PARENT_ID")
	public CmsComment getCmsComment()
	{
		return this.cmsComment;
	}

	/**
	 * @param cmsComment
	 *            null.
	 */
	public void setCmsComment(CmsComment cmsComment)
	{
		this.cmsComment = cmsComment;
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
	@Column(name = "TITLE", length = 200)
	public String getTitle()
	{
		return this.title;
	}

	/**
	 * @param title
	 *            null.
	 */
	public void setTitle(String title)
	{
		this.title = title;
	}

	/** @return null. */
	@Column(name = "CONTENT", length = 200)
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
	@Column(name = "USER_ID", length = 200)
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cmsComment")
	public Set<CmsFavorite> getCmsFavorites()
	{
		return this.cmsFavorites;
	}

	/**
	 * @param cmsFavorites
	 *            .
	 */
	public void setCmsFavorites(Set<CmsFavorite> cmsFavorites)
	{
		this.cmsFavorites = cmsFavorites;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cmsComment")
	public Set<CmsComment> getCmsComments()
	{
		return this.cmsComments;
	}

	/**
	 * @param cmsComments
	 *            .
	 */
	public void setCmsComments(Set<CmsComment> cmsComments)
	{
		this.cmsComments = cmsComments;
	}
}
