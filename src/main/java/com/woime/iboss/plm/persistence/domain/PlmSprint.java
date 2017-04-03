package com.woime.iboss.plm.persistence.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * PlmSprint .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PLM_SPRINT")
public class PlmSprint implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private PlmProject plmProject;

	/** null. */
	private PlmConfig plmConfig;

	/** null. */
	private String code;

	/** null. */
	private String name;

	/** null. */
	private Integer priority;

	/** null. */
	private Date startTime;

	/** null. */
	private Date endTime;

	/** null. */
	private String status;

	/** . */
	private Set<PlmIssue> plmIssues = new HashSet<PlmIssue>(0);

	public PlmSprint()
	{
	}

	public PlmSprint(Long id)
	{
		this.id = id;
	}

	public PlmSprint(Long id, PlmProject plmProject, PlmConfig plmConfig, String code, String name, Integer priority, Date startTime, Date endTime, String status, Set<PlmIssue> plmIssues)
	{
		this.id = id;
		this.plmProject = plmProject;
		this.plmConfig = plmConfig;
		this.code = code;
		this.name = name;
		this.priority = priority;
		this.startTime = startTime;
		this.endTime = endTime;
		this.status = status;
		this.plmIssues = plmIssues;
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
	@JoinColumn(name = "PROJECT_ID")
	public PlmProject getPlmProject()
	{
		return this.plmProject;
	}

	/**
	 * @param plmProject
	 *            null.
	 */
	public void setPlmProject(PlmProject plmProject)
	{
		this.plmProject = plmProject;
	}

	/** @return null. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CONFIG_ID")
	public PlmConfig getPlmConfig()
	{
		return this.plmConfig;
	}

	/**
	 * @param plmConfig
	 *            null.
	 */
	public void setPlmConfig(PlmConfig plmConfig)
	{
		this.plmConfig = plmConfig;
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "plmSprint")
	public Set<PlmIssue> getPlmIssues()
	{
		return this.plmIssues;
	}

	/**
	 * @param plmIssues
	 *            .
	 */
	public void setPlmIssues(Set<PlmIssue> plmIssues)
	{
		this.plmIssues = plmIssues;
	}
}
