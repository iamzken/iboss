package com.woime.iboss.visitor.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * VisitorInfo .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "VISITOR_INFO")
public class VisitorInfo implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String name;

	/** null. */
	private String mobile;

	/** null. */
	private String companyName;

	/** null. */
	private String description;

	/** null. */
	private Date createTime;

	/** null. */
	private Date visitTime;

	/** null. */
	private Date leaveTime;

	/** null. */
	private Date enterTime;

	/** null. */
	private Integer status;

	/** null. */
	private String userId;

	/** null. */
	private String tenantId;

	public VisitorInfo()
	{
	}

	public VisitorInfo(Long id)
	{
		this.id = id;
	}

	public VisitorInfo(Long id, String name, String mobile, String companyName, String description, Date createTime, Date visitTime, Date leaveTime, Date enterTime, Integer status, String userId,
			String tenantId)
	{
		this.id = id;
		this.name = name;
		this.mobile = mobile;
		this.companyName = companyName;
		this.description = description;
		this.createTime = createTime;
		this.visitTime = visitTime;
		this.leaveTime = leaveTime;
		this.enterTime = enterTime;
		this.status = status;
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
	@Column(name = "COMPANY_NAME", length = 200)
	public String getCompanyName()
	{
		return this.companyName;
	}

	/**
	 * @param companyName
	 *            null.
	 */
	public void setCompanyName(String companyName)
	{
		this.companyName = companyName;
	}

	/** @return null. */
	@Column(name = "DESCRIPTION", length = 200)
	public String getDescription()
	{
		return this.description;
	}

	/**
	 * @param description
	 *            null.
	 */
	public void setDescription(String description)
	{
		this.description = description;
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
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "VISIT_TIME", length = 26)
	public Date getVisitTime()
	{
		return this.visitTime;
	}

	/**
	 * @param visitTime
	 *            null.
	 */
	public void setVisitTime(Date visitTime)
	{
		this.visitTime = visitTime;
	}

	/** @return null. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "LEAVE_TIME", length = 26)
	public Date getLeaveTime()
	{
		return this.leaveTime;
	}

	/**
	 * @param leaveTime
	 *            null.
	 */
	public void setLeaveTime(Date leaveTime)
	{
		this.leaveTime = leaveTime;
	}

	/** @return null. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "ENTER_TIME", length = 26)
	public Date getEnterTime()
	{
		return this.enterTime;
	}

	/**
	 * @param enterTime
	 *            null.
	 */
	public void setEnterTime(Date enterTime)
	{
		this.enterTime = enterTime;
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
