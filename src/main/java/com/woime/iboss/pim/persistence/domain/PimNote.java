package com.woime.iboss.pim.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * PimNote .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PIM_NOTE")
public class PimNote implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String title;

	/** null. */
	private String content;

	/** null. */
	private Date createTime;

	/** null. */
	private String userId;

	/** null. */
	private Integer clientX;

	/** null. */
	private Integer clientY;

	/** null. */
	private String status;

	public PimNote()
	{
	}

	public PimNote(Long id)
	{
		this.id = id;
	}

	public PimNote(Long id, String title, String content, Date createTime, String userId, Integer clientX, Integer clientY, String status)
	{
		this.id = id;
		this.title = title;
		this.content = content;
		this.createTime = createTime;
		this.userId = userId;
		this.clientX = clientX;
		this.clientY = clientY;
		this.status = status;
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
	@Column(name = "TITLE", length = 100)
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
	@Column(name = "CLIENT_X")
	public Integer getClientX()
	{
		return this.clientX;
	}

	/**
	 * @param clientX
	 *            null.
	 */
	public void setClientX(Integer clientX)
	{
		this.clientX = clientX;
	}

	/** @return null. */
	@Column(name = "CLIENT_Y")
	public Integer getClientY()
	{
		return this.clientY;
	}

	/**
	 * @param clientY
	 *            null.
	 */
	public void setClientY(Integer clientY)
	{
		this.clientY = clientY;
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
}
