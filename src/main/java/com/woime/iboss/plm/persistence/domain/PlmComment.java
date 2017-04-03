package com.woime.iboss.plm.persistence.domain;

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
 * PlmComment .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PLM_COMMENT")
public class PlmComment implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private PlmIssue plmIssue;

	/** null. */
	private String content;

	/** null. */
	private Date createTime;

	/** null. */
	private String userId;

	/** null. */
	private Integer priority;

	public PlmComment()
	{
	}

	public PlmComment(Long id)
	{
		this.id = id;
	}

	public PlmComment(Long id, PlmIssue plmIssue, String content, Date createTime, String userId, Integer priority)
	{
		this.id = id;
		this.plmIssue = plmIssue;
		this.content = content;
		this.createTime = createTime;
		this.userId = userId;
		this.priority = priority;
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
	@JoinColumn(name = "ISSUE_ID")
	public PlmIssue getPlmIssue()
	{
		return this.plmIssue;
	}

	/**
	 * @param plmIssue
	 *            null.
	 */
	public void setPlmIssue(PlmIssue plmIssue)
	{
		this.plmIssue = plmIssue;
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
}
