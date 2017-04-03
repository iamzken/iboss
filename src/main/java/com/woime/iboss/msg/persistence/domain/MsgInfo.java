package com.woime.iboss.msg.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * MsgInfo .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "MSG_INFO")
public class MsgInfo implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String name;

	/** null. */
	private String content;

	/** null. */
	private Integer type;

	/** null. */
	private Date createTime;

	/** null. */
	private String senderId;

	/** null. */
	private String receiverId;

	/** null. */
	private Integer status;

	/** null. */
	private String tenantId;

	/** null. */
	private String data;

	public MsgInfo()
	{
	}

	public MsgInfo(Long id)
	{
		this.id = id;
	}

	public MsgInfo(Long id, String name, String content, Integer type, Date createTime, String senderId, String receiverId, Integer status, String tenantId, String data)
	{
		this.id = id;
		this.name = name;
		this.content = content;
		this.type = type;
		this.createTime = createTime;
		this.senderId = senderId;
		this.receiverId = receiverId;
		this.status = status;
		this.tenantId = tenantId;
		this.data = data;
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
	@Column(name = "SENDER_ID", length = 64)
	public String getSenderId()
	{
		return this.senderId;
	}

	/**
	 * @param senderId
	 *            null.
	 */
	public void setSenderId(String senderId)
	{
		this.senderId = senderId;
	}

	/** @return null. */
	@Column(name = "RECEIVER_ID", length = 64)
	public String getReceiverId()
	{
		return this.receiverId;
	}

	/**
	 * @param receiverId
	 *            null.
	 */
	public void setReceiverId(String receiverId)
	{
		this.receiverId = receiverId;
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

	/** @return null. */
	@Column(name = "DATA")
	public String getData()
	{
		return this.data;
	}

	/**
	 * @param data
	 *            null.
	 */
	public void setData(String data)
	{
		this.data = data;
	}
}
