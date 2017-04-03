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
 * CmsFavorite .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "CMS_FAVORITE")
public class CmsFavorite implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private CmsComment cmsComment;

	/** null. */
	private CmsArticle cmsArticle;

	/** null. */
	private String subject;

	/** null. */
	private Date createTime;

	/** null. */
	private String userId;

	public CmsFavorite()
	{
	}

	public CmsFavorite(Long id)
	{
		this.id = id;
	}

	public CmsFavorite(Long id, CmsComment cmsComment, CmsArticle cmsArticle, String subject, Date createTime, String userId)
	{
		this.id = id;
		this.cmsComment = cmsComment;
		this.cmsArticle = cmsArticle;
		this.subject = subject;
		this.createTime = createTime;
		this.userId = userId;
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
	@JoinColumn(name = "COMMENT_ID")
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
	@Column(name = "SUBJECT", length = 200)
	public String getSubject()
	{
		return this.subject;
	}

	/**
	 * @param subject
	 *            null.
	 */
	public void setSubject(String subject)
	{
		this.subject = subject;
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
}
