package com.woime.iboss.internal.sendsms.persistence.domain;

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
 * SendsmsHistory .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "SENDSMS_HISTORY")
public class SendsmsHistory implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private SendsmsConfig sendsmsConfig;

	/** null. */
	private String mobile;

	/** null. */
	private String message;

	/** null. */
	private Date createTime;

	/** null. */
	private String status;

	/** null. */
	private String info;

	/** null. */
	private String tenantId;

	public SendsmsHistory()
	{
	}

	public SendsmsHistory(Long id)
	{
		this.id = id;
	}

	public SendsmsHistory(Long id, SendsmsConfig sendsmsConfig, String mobile, String message, Date createTime, String status, String info, String tenantId)
	{
		this.id = id;
		this.sendsmsConfig = sendsmsConfig;
		this.mobile = mobile;
		this.message = message;
		this.createTime = createTime;
		this.status = status;
		this.info = info;
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
	@JoinColumn(name = "CONFIG_ID")
	public SendsmsConfig getSendsmsConfig()
	{
		return this.sendsmsConfig;
	}

	/**
	 * @param sendsmsConfig
	 *            null.
	 */
	public void setSendsmsConfig(SendsmsConfig sendsmsConfig)
	{
		this.sendsmsConfig = sendsmsConfig;
	}

	/** @return null. */
	@Column(name = "MOBILE", length = 50)
	public String getMobile()
	{
		return this.mobile;
	}

	/**
	 * @param mobile
	 *            null.
	 */
	public void setMobile(String mobile)
	{
		this.mobile = mobile;
	}

	/** @return null. */
	@Column(name = "MESSAGE", length = 200)
	public String getMessage()
	{
		return this.message;
	}

	/**
	 * @param message
	 *            null.
	 */
	public void setMessage(String message)
	{
		this.message = message;
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
	@Column(name = "INFO", length = 200)
	public String getInfo()
	{
		return this.info;
	}

	/**
	 * @param info
	 *            null.
	 */
	public void setInfo(String info)
	{
		this.info = info;
	}

	/** @return null. */
	@Column(name = "TENANT_ID", length = 50)
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
