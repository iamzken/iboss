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
 * CmsArticle .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "CMS_ARTICLE")
public class CmsArticle implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private CmsCatalog cmsCatalog;

	/** null. */
	private String title;

	/** null. */
	private String shortTitle;

	/** null. */
	private String subTitle;

	/** null. */
	private String content;

	/** null. */
	private String summary;

	/** null. */
	private String logo;

	/** null. */
	private String keyword;

	/** null. */
	private String tags;

	/** null. */
	private String source;

	/** null. */
	private Integer allowComment;

	/** null. */
	private Integer status;

	/** null. */
	private Date publishTime;

	/** null. */
	private Date closeTime;

	/** null. */
	private Integer type;

	/** null. */
	private Integer top;

	/** null. */
	private Integer weight;

	/** null. */
	private Date createTime;

	/** null. */
	private String template;

	/** null. */
	private Integer hitCount;

	/** null. */
	private Long recommendId;

	/** null. */
	private Integer recommendStatus;

	/** null. */
	private String userId;

	/** null. */
	private Integer commentCount;

	/** null. */
	private String code;

	/** null. */
	private String tenantId;

	/** . */
	private Set<CmsAttachment> cmsAttachments = new HashSet<CmsAttachment>(0);

	/** . */
	private Set<CmsFavorite> cmsFavorites = new HashSet<CmsFavorite>(0);

	/** . */
	private Set<CmsTagArticle> cmsTagArticles = new HashSet<CmsTagArticle>(0);

	/** . */
	private Set<CmsComment> cmsComments = new HashSet<CmsComment>(0);

	/** . */
	private Set<CmsClick> cmsClicks = new HashSet<CmsClick>(0);

	/** . */
	private Set<CmsSite> cmsSites = new HashSet<CmsSite>(0);

	public CmsArticle()
	{
	}

	public CmsArticle(Long id)
	{
		this.id = id;
	}

	public CmsArticle(Long id, CmsCatalog cmsCatalog, String title, String shortTitle, String subTitle, String content, String summary, String logo, String keyword, String tags, String source,
			Integer allowComment, Integer status, Date publishTime, Date closeTime, Integer type, Integer top, Integer weight, Date createTime, String template, Integer hitCount, Long recommendId,
			Integer recommendStatus, String userId, Integer commentCount, String code, String tenantId, Set<CmsAttachment> cmsAttachments, Set<CmsFavorite> cmsFavorites,
			Set<CmsTagArticle> cmsTagArticles, Set<CmsComment> cmsComments, Set<CmsClick> cmsClicks, Set<CmsSite> cmsSites)
	{
		this.id = id;
		this.cmsCatalog = cmsCatalog;
		this.title = title;
		this.shortTitle = shortTitle;
		this.subTitle = subTitle;
		this.content = content;
		this.summary = summary;
		this.logo = logo;
		this.keyword = keyword;
		this.tags = tags;
		this.source = source;
		this.allowComment = allowComment;
		this.status = status;
		this.publishTime = publishTime;
		this.closeTime = closeTime;
		this.type = type;
		this.top = top;
		this.weight = weight;
		this.createTime = createTime;
		this.template = template;
		this.hitCount = hitCount;
		this.recommendId = recommendId;
		this.recommendStatus = recommendStatus;
		this.userId = userId;
		this.commentCount = commentCount;
		this.code = code;
		this.tenantId = tenantId;
		this.cmsAttachments = cmsAttachments;
		this.cmsFavorites = cmsFavorites;
		this.cmsTagArticles = cmsTagArticles;
		this.cmsComments = cmsComments;
		this.cmsClicks = cmsClicks;
		this.cmsSites = cmsSites;
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
	@JoinColumn(name = "CATALOG_ID")
	public CmsCatalog getCmsCatalog()
	{
		return this.cmsCatalog;
	}

	/**
	 * @param cmsCatalog
	 *            null.
	 */
	public void setCmsCatalog(CmsCatalog cmsCatalog)
	{
		this.cmsCatalog = cmsCatalog;
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
	@Column(name = "SHORT_TITLE", length = 200)
	public String getShortTitle()
	{
		return this.shortTitle;
	}

	/**
	 * @param shortTitle
	 *            null.
	 */
	public void setShortTitle(String shortTitle)
	{
		this.shortTitle = shortTitle;
	}

	/** @return null. */
	@Column(name = "SUB_TITLE", length = 200)
	public String getSubTitle()
	{
		return this.subTitle;
	}

	/**
	 * @param subTitle
	 *            null.
	 */
	public void setSubTitle(String subTitle)
	{
		this.subTitle = subTitle;
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
	@Column(name = "SUMMARY", length = 200)
	public String getSummary()
	{
		return this.summary;
	}

	/**
	 * @param summary
	 *            null.
	 */
	public void setSummary(String summary)
	{
		this.summary = summary;
	}

	/** @return null. */
	@Column(name = "LOGO", length = 200)
	public String getLogo()
	{
		return this.logo;
	}

	/**
	 * @param logo
	 *            null.
	 */
	public void setLogo(String logo)
	{
		this.logo = logo;
	}

	/** @return null. */
	@Column(name = "KEYWORD", length = 200)
	public String getKeyword()
	{
		return this.keyword;
	}

	/**
	 * @param keyword
	 *            null.
	 */
	public void setKeyword(String keyword)
	{
		this.keyword = keyword;
	}

	/** @return null. */
	@Column(name = "TAGS", length = 200)
	public String getTags()
	{
		return this.tags;
	}

	/**
	 * @param tags
	 *            null.
	 */
	public void setTags(String tags)
	{
		this.tags = tags;
	}

	/** @return null. */
	@Column(name = "SOURCE", length = 200)
	public String getSource()
	{
		return this.source;
	}

	/**
	 * @param source
	 *            null.
	 */
	public void setSource(String source)
	{
		this.source = source;
	}

	/** @return null. */
	@Column(name = "ALLOW_COMMENT")
	public Integer getAllowComment()
	{
		return this.allowComment;
	}

	/**
	 * @param allowComment
	 *            null.
	 */
	public void setAllowComment(Integer allowComment)
	{
		this.allowComment = allowComment;
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
	@Column(name = "PUBLISH_TIME", length = 26)
	public Date getPublishTime()
	{
		return this.publishTime;
	}

	/**
	 * @param publishTime
	 *            null.
	 */
	public void setPublishTime(Date publishTime)
	{
		this.publishTime = publishTime;
	}

	/** @return null. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CLOSE_TIME", length = 26)
	public Date getCloseTime()
	{
		return this.closeTime;
	}

	/**
	 * @param closeTime
	 *            null.
	 */
	public void setCloseTime(Date closeTime)
	{
		this.closeTime = closeTime;
	}

	/** @return null. */
	@Column(name = "TYPE")
	public Integer getType()
	{
		return this.type;
	}

	/**
	 * @param type
	 *            null.
	 */
	public void setType(Integer type)
	{
		this.type = type;
	}

	/** @return null. */
	@Column(name = "TOP")
	public Integer getTop()
	{
		return this.top;
	}

	/**
	 * @param top
	 *            null.
	 */
	public void setTop(Integer top)
	{
		this.top = top;
	}

	/** @return null. */
	@Column(name = "WEIGHT")
	public Integer getWeight()
	{
		return this.weight;
	}

	/**
	 * @param weight
	 *            null.
	 */
	public void setWeight(Integer weight)
	{
		this.weight = weight;
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
	@Column(name = "TEMPLATE", length = 200)
	public String getTemplate()
	{
		return this.template;
	}

	/**
	 * @param template
	 *            null.
	 */
	public void setTemplate(String template)
	{
		this.template = template;
	}

	/** @return null. */
	@Column(name = "HIT_COUNT")
	public Integer getHitCount()
	{
		return this.hitCount;
	}

	/**
	 * @param hitCount
	 *            null.
	 */
	public void setHitCount(Integer hitCount)
	{
		this.hitCount = hitCount;
	}

	/** @return null. */
	@Column(name = "RECOMMEND_ID")
	public Long getRecommendId()
	{
		return this.recommendId;
	}

	/**
	 * @param recommendId
	 *            null.
	 */
	public void setRecommendId(Long recommendId)
	{
		this.recommendId = recommendId;
	}

	/** @return null. */
	@Column(name = "RECOMMEND_STATUS")
	public Integer getRecommendStatus()
	{
		return this.recommendStatus;
	}

	/**
	 * @param recommendStatus
	 *            null.
	 */
	public void setRecommendStatus(Integer recommendStatus)
	{
		this.recommendStatus = recommendStatus;
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
	@Column(name = "COMMENT_COUNT")
	public Integer getCommentCount()
	{
		return this.commentCount;
	}

	/**
	 * @param commentCount
	 *            null.
	 */
	public void setCommentCount(Integer commentCount)
	{
		this.commentCount = commentCount;
	}

	/** @return null. */
	@Column(name = "CODE", length = 50)
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
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cmsArticle")
	public Set<CmsAttachment> getCmsAttachments()
	{
		return this.cmsAttachments;
	}

	/**
	 * @param cmsAttachments
	 *            .
	 */
	public void setCmsAttachments(Set<CmsAttachment> cmsAttachments)
	{
		this.cmsAttachments = cmsAttachments;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cmsArticle")
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
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cmsArticle")
	public Set<CmsTagArticle> getCmsTagArticles()
	{
		return this.cmsTagArticles;
	}

	/**
	 * @param cmsTagArticles
	 *            .
	 */
	public void setCmsTagArticles(Set<CmsTagArticle> cmsTagArticles)
	{
		this.cmsTagArticles = cmsTagArticles;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cmsArticle")
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cmsArticle")
	public Set<CmsClick> getCmsClicks()
	{
		return this.cmsClicks;
	}

	/**
	 * @param cmsClicks
	 *            .
	 */
	public void setCmsClicks(Set<CmsClick> cmsClicks)
	{
		this.cmsClicks = cmsClicks;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "cmsArticle")
	public Set<CmsSite> getCmsSites()
	{
		return this.cmsSites;
	}

	/**
	 * @param cmsSites
	 *            .
	 */
	public void setCmsSites(Set<CmsSite> cmsSites)
	{
		this.cmsSites = cmsSites;
	}
}
