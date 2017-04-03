package com.woime.iboss.plm.persistence.domain;

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
 * PlmProject .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PLM_PROJECT")
public class PlmProject implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private PlmCategory plmCategory;

	/** null. */
	private String code;

	/** null. */
	private String name;

	/** null. */
	private String logo;

	/** null. */
	private String summary;

	/** null. */
	private String wikiUrl;

	/** null. */
	private String sourceUrl;

	/** null. */
	private String url;

	/** null. */
	private String leaderId;

	/** null. */
	private Integer priority;

	/** null. */
	private String status;

	/** null. */
	private Date createTime;

	/** null. */
	private String userId;

	/** . */
	private Set<PlmVersion> plmVersions = new HashSet<PlmVersion>(0);

	/** . */
	private Set<PlmComponent> plmComponents = new HashSet<PlmComponent>(0);

	/** . */
	private Set<PlmIssue> plmIssues = new HashSet<PlmIssue>(0);

	/** . */
	private Set<PlmSprint> plmSprints = new HashSet<PlmSprint>(0);

	public PlmProject()
	{
	}

	public PlmProject(Long id)
	{
		this.id = id;
	}

	public PlmProject(Long id, PlmCategory plmCategory, String code, String name, String logo, String summary, String wikiUrl, String sourceUrl, String url, String leaderId, Integer priority,
			String status, Date createTime, String userId, Set<PlmVersion> plmVersions, Set<PlmComponent> plmComponents, Set<PlmIssue> plmIssues, Set<PlmSprint> plmSprints)
	{
		this.id = id;
		this.plmCategory = plmCategory;
		this.code = code;
		this.name = name;
		this.logo = logo;
		this.summary = summary;
		this.wikiUrl = wikiUrl;
		this.sourceUrl = sourceUrl;
		this.url = url;
		this.leaderId = leaderId;
		this.priority = priority;
		this.status = status;
		this.createTime = createTime;
		this.userId = userId;
		this.plmVersions = plmVersions;
		this.plmComponents = plmComponents;
		this.plmIssues = plmIssues;
		this.plmSprints = plmSprints;
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
	@JoinColumn(name = "CATEGORY_ID")
	public PlmCategory getPlmCategory()
	{
		return this.plmCategory;
	}

	/**
	 * @param plmCategory
	 *            null.
	 */
	public void setPlmCategory(PlmCategory plmCategory)
	{
		this.plmCategory = plmCategory;
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
	@Column(name = "SUMMARY", length = 65535)
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
	@Column(name = "WIKI_URL", length = 200)
	public String getWikiUrl()
	{
		return this.wikiUrl;
	}

	/**
	 * @param wikiUrl
	 *            null.
	 */
	public void setWikiUrl(String wikiUrl)
	{
		this.wikiUrl = wikiUrl;
	}

	/** @return null. */
	@Column(name = "SOURCE_URL", length = 200)
	public String getSourceUrl()
	{
		return this.sourceUrl;
	}

	/**
	 * @param sourceUrl
	 *            null.
	 */
	public void setSourceUrl(String sourceUrl)
	{
		this.sourceUrl = sourceUrl;
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
	@Column(name = "LEADER_ID", length = 64)
	public String getLeaderId()
	{
		return this.leaderId;
	}

	/**
	 * @param leaderId
	 *            null.
	 */
	public void setLeaderId(String leaderId)
	{
		this.leaderId = leaderId;
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
	@Column(name = "STATUS", length = 50)
	public String getStatus()
	{
		return this.status;
	}

	/**
	 * @param status
	 *            null.
	 */
	public void setStatus(String status)
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "plmProject")
	public Set<PlmVersion> getPlmVersions()
	{
		return this.plmVersions;
	}

	/**
	 * @param plmVersions
	 *            .
	 */
	public void setPlmVersions(Set<PlmVersion> plmVersions)
	{
		this.plmVersions = plmVersions;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "plmProject")
	public Set<PlmComponent> getPlmComponents()
	{
		return this.plmComponents;
	}

	/**
	 * @param plmComponents
	 *            .
	 */
	public void setPlmComponents(Set<PlmComponent> plmComponents)
	{
		this.plmComponents = plmComponents;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "plmProject")
	public Set<PlmIssue> getPlmIssues()
	{
		return this.plmIssues;
	}

	/**
	 * @param plmIssues
	 *            .
	 */
	public void setPlmIssues(Set<PlmIssue> plmIssues)
	{
		this.plmIssues = plmIssues;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "plmProject")
	public Set<PlmSprint> getPlmSprints()
	{
		return this.plmSprints;
	}

	/**
	 * @param plmSprints
	 *            .
	 */
	public void setPlmSprints(Set<PlmSprint> plmSprints)
	{
		this.plmSprints = plmSprints;
	}
}
