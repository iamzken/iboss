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
 * PlmLog .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PLM_LOG")
public class PlmLog implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private PlmIssue plmIssue;

	/** null. */
	private String type;

	/** null. */
	private String userId;

	/** null. */
	private Date logTime;

	/** null. */
	private String content;

	public PlmLog()
	{
	}

	public PlmLog(Long id)
	{
		this.id = id;
	}

	public PlmLog(Long id, PlmIssue plmIssue, String type, String userId, Date logTime, String content)
	{
		this.id = id;
		this.plmIssue = plmIssue;
		this.type = type;
		this.userId = userId;
		this.logTime = logTime;
		this.content = content;
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
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "LOG_TIME", length = 26)
	public Date getLogTime()
	{
		return this.logTime;
	}

	/**
	 * @param logTime
	 *            null.
	 */
	public void setLogTime(Date logTime)
	{
		this.logTime = logTime;
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
}
