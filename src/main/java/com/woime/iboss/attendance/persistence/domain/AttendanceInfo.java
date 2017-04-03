package com.woime.iboss.attendance.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * AttendanceInfo .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "attendance_info")
public class AttendanceInfo implements java.io.Serializable
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
	private String catalog;

	/** null. */
	private String employeeId;

	/** null. */
	private String tenantId;

	public AttendanceInfo()
	{
	}

	public AttendanceInfo(Long id)
	{
		this.id = id;
	}

	public AttendanceInfo(Long id, String name, Date createTime, String status, String type, String catalog, String employeeId, String tenantId)
	{
		this.id = id;
		this.name = name;
		this.createTime = createTime;
		this.status = status;
		this.type = type;
		this.catalog = catalog;
		this.employeeId = employeeId;
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
	@Column(name = "CATALOG", length = 100)
	public String getCatalog()
	{
		return this.catalog;
	}

	/**
	 * @param catalog
	 *            null.
	 */
	public void setCatalog(String catalog)
	{
		this.catalog = catalog;
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
