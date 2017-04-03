package com.woime.iboss.pim.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * PimDevice .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PIM_DEVICE")
public class PimDevice implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String code;

	/** null. */
	private String name;

	/** null. */
	private String type;

	/** null. */
	private String sessionId;

	/** null. */
	private Date createTime;

	/** null. */
	private String status;

	/** null. */
	private String userId;

	public PimDevice()
	{
	}

	public PimDevice(Long id)
	{
		this.id = id;
	}

	public PimDevice(Long id, String code, String name, String type, String sessionId, Date createTime, String status, String userId)
	{
		this.id = id;
		this.code = code;
		this.name = name;
		this.type = type;
		this.sessionId = sessionId;
		this.createTime = createTime;
		this.status = status;
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
	@Column(name = "CODE", length = 64)
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
	@Column(name = "NAME", length = 64)
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
	@Column(name = "TYPE", length = 64)
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
	@Column(name = "SESSION_ID", length = 64)
	public String getSessionId()
	{
		return this.sessionId;
	}

	/**
	 * @param sessionId
	 *            null.
	 */
	public void setSessionId(String sessionId)
	{
		this.sessionId = sessionId;
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
}
