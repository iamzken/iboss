package com.woime.iboss.contract.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * ContractInfo .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "CONTRACT_INFO")
public class ContractInfo implements java.io.Serializable
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
	private String company;

	/** null. */
	private String code;

	/** null. */
	private String type;

	/** null. */
	private Date startTime;

	/** null. */
	private Date endTime;

	/** null. */
	private String tenantId;

	public ContractInfo()
	{
	}

	public ContractInfo(Long id)
	{
		this.id = id;
	}

	public ContractInfo(Long id, String name, Date createTime, String status, String company, String code, String type, Date startTime, Date endTime, String tenantId)
	{
		this.id = id;
		this.name = name;
		this.createTime = createTime;
		this.status = status;
		this.company = company;
		this.code = code;
		this.type = type;
		this.startTime = startTime;
		this.endTime = endTime;
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
	@Column(name = "CODE", length = 50)
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
