package com.woime.iboss.activity.persistence.domain;

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
 * ActivityUser .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "activity_user")
public class ActivityUser implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private ActivityInfo activityInfo;

	/** null. */
	private Integer priority;

	/** null. */
	private Date createTime;

	/** null. */
	private String userId;

	/** null. */
	private String tenantId;

	public ActivityUser()
	{
	}

	public ActivityUser(Long id)
	{
		this.id = id;
	}

	public ActivityUser(Long id, ActivityInfo activityInfo, Integer priority, Date createTime, String userId, String tenantId)
	{
		this.id = id;
		this.activityInfo = activityInfo;
		this.priority = priority;
		this.createTime = createTime;
		this.userId = userId;
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
	@JoinColumn(name = "INFO_ID")
	public ActivityInfo getActivityInfo()
	{
		return this.activityInfo;
	}

	/**
	 * @param activityInfo
	 *            null.
	 */
	public void setActivityInfo(ActivityInfo activityInfo)
	{
		this.activityInfo = activityInfo;
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
}
