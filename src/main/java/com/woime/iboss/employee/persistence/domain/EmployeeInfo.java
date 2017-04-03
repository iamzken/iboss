package com.woime.iboss.employee.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * EmployeeInfo .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "EMPLOYEE_INFO")
public class EmployeeInfo implements java.io.Serializable
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
	private String department;

	/** null. */
	private String company;

	/** null. */
	private String position;

	/** null. */
	private String tenantId;

	public EmployeeInfo()
	{
	}

	public EmployeeInfo(Long id)
	{
		this.id = id;
	}

	public EmployeeInfo(Long id, String name, Date createTime, String status, String department, String company, String position, String tenantId)
	{
		this.id = id;
		this.name = name;
		this.createTime = createTime;
		this.status = status;
		this.department = department;
		this.company = company;
		this.position = position;
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
	@Column(name = "DEPARTMENT", length = 50)
	public String getDepartment()
	{
		return this.department;
	}

	/**
	 * @param department
	 *            null.
	 */
	public void setDepartment(String department)
	{
		this.department = department;
	}

	/** @return null. */
	@Column(name = "COMPANY", length = 50)
	public String getCompany()
	{
		return this.company;
	}

	/**
	 * @param company
	 *            null.
	 */
	public void setCompany(String company)
	{
		this.company = company;
	}

	/** @return null. */
	@Column(name = "POSITION", length = 50)
	public String getPosition()
	{
		return this.position;
	}

	/**
	 * @param position
	 *            null.
	 */
	public void setPosition(String position)
	{
		this.position = position;
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
