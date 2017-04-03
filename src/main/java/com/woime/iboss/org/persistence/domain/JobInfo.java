package com.woime.iboss.org.persistence.domain;

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

/**
 * JobInfo .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "JOB_INFO")
public class JobInfo implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private JobType jobType;

	/** null. */
	private JobLevel jobLevel;

	/** null. */
	private JobTitle jobTitle;

	/** null. */
	private String name;

	/** null. */
	private String tenantId;

	/** . */
	private Set<JobUser> jobUsers = new HashSet<JobUser>(0);

	public JobInfo()
	{
	}

	public JobInfo(Long id)
	{
		this.id = id;
	}

	public JobInfo(Long id, JobType jobType, JobLevel jobLevel, JobTitle jobTitle, String name, String tenantId, Set<JobUser> jobUsers)
	{
		this.id = id;
		this.jobType = jobType;
		this.jobLevel = jobLevel;
		this.jobTitle = jobTitle;
		this.name = name;
		this.tenantId = tenantId;
		this.jobUsers = jobUsers;
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
	@JoinColumn(name = "TYPE_ID")
	public JobType getJobType()
	{
		return this.jobType;
	}

	/**
	 * @param jobType
	 *            null.
	 */
	public void setJobType(JobType jobType)
	{
		this.jobType = jobType;
	}

	/** @return null. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "LEVEL_ID")
	public JobLevel getJobLevel()
	{
		return this.jobLevel;
	}

	/**
	 * @param jobLevel
	 *            null.
	 */
	public void setJobLevel(JobLevel jobLevel)
	{
		this.jobLevel = jobLevel;
	}

	/** @return null. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "TITLE_ID")
	public JobTitle getJobTitle()
	{
		return this.jobTitle;
	}

	/**
	 * @param jobTitle
	 *            null.
	 */
	public void setJobTitle(JobTitle jobTitle)
	{
		this.jobTitle = jobTitle;
	}

	/** @return null. */
	@Column(name = "NAME", length = 50)
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "jobInfo")
	public Set<JobUser> getJobUsers()
	{
		return this.jobUsers;
	}

	/**
	 * @param jobUsers
	 *            .
	 */
	public void setJobUsers(Set<JobUser> jobUsers)
	{
		this.jobUsers = jobUsers;
	}
}
