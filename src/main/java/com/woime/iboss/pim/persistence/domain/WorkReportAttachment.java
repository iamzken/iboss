package com.woime.iboss.pim.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * WorkReportAttachment .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "WORK_REPORT_ATTACHMENT")
public class WorkReportAttachment implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private WorkReportInfo workReportInfo;

	/** null. */
	private String name;

	/** null. */
	private Long fileSize;

	/** null. */
	private String ref;

	/** null. */
	private String tenantId;

	public WorkReportAttachment()
	{
	}

	public WorkReportAttachment(Long id)
	{
		this.id = id;
	}

	public WorkReportAttachment(Long id, WorkReportInfo workReportInfo, String name, Long fileSize, String ref, String tenantId)
	{
		this.id = id;
		this.workReportInfo = workReportInfo;
		this.name = name;
		this.fileSize = fileSize;
		this.ref = ref;
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
	public WorkReportInfo getWorkReportInfo()
	{
		return this.workReportInfo;
	}

	/**
	 * @param workReportInfo
	 *            null.
	 */
	public void setWorkReportInfo(WorkReportInfo workReportInfo)
	{
		this.workReportInfo = workReportInfo;
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
	@Column(name = "FILE_SIZE")
	public Long getFileSize()
	{
		return this.fileSize;
	}

	/**
	 * @param fileSize
	 *            null.
	 */
	public void setFileSize(Long fileSize)
	{
		this.fileSize = fileSize;
	}

	/** @return null. */
	@Column(name = "REF", length = 200)
	public String getRef()
	{
		return this.ref;
	}

	/**
	 * @param ref
	 *            null.
	 */
	public void setRef(String ref)
	{
		this.ref = ref;
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
