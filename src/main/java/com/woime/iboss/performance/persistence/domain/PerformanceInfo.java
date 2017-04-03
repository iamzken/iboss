package com.woime.iboss.performance.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * PerformanceInfo .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PERFORMANCE_INFO")
public class PerformanceInfo implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String name;

	/** null. */
	private Date createTime;

	/** null. */
	private String status;

	/** null. */
	private String type;

	/** null. */
	private Date startTime;

	/** null. */
	private Date endTime;

	/** null. */
	private String employeeId;

	/** null. */
	private String superiourId;

	/** null. */
	private String score;

	/** null. */
	private String tenantId;

	public PerformanceInfo()
	{
	}

	public PerformanceInfo(Long id)
	{
		this.id = id;
	}

	public PerformanceInfo(Long id, String name, Date createTime, String status, String type, Date startTime, Date endTime, String employeeId, String superiourId, String score, String tenantId)
	{
		this.id = id;
		this.name = name;
		this.createTime = createTime;
		this.status = status;
		this.type = type;
		this.startTime = startTime;
		this.endTime = endTime;
		this.employeeId = employeeId;
		this.superiourId = superiourId;
		this.score = score;
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
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "START_TIME", length = 26)
	public Date getStartTime()
	{
		return this.startTime;
	}

	/**
	 * @param startTime
	 *            null.
	 */
	public void setStartTime(Date startTime)
	{
		this.startTime = startTime;
	}

	/** @return null. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "END_TIME", length = 26)
	public Date getEndTime()
	{
		return this.endTime;
	}

	/**
	 * @param endTime
	 *            null.
	 */
	public void setEndTime(Date endTime)
	{
		this.endTime = endTime;
	}

	/** @return null. */
	@Column(name = "EMPLOYEE_ID", length = 64)
	public String getEmployeeId()
	{
		return this.employeeId;
	}

	/**
	 * @param employeeId
	 *            null.
	 */
	public void setEmployeeId(String employeeId)
	{
		this.employeeId = employeeId;
	}

	/** @return null. */
	@Column(name = "SUPERIOUR_ID", length = 64)
	public String getSuperiourId()
	{
		return this.superiourId;
	}

	/**
	 * @param superiourId
	 *            null.
	 */
	public void setSuperiourId(String superiourId)
	{
		this.superiourId = superiourId;
	}

	/** @return null. */
	@Column(name = "SCORE", length = 50)
	public String getScore()
	{
		return this.score;
	}

	/**
	 * @param score
	 *            null.
	 */
	public void setScore(String score)
	{
		this.score = score;
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
