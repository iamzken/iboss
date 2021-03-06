package com.woime.iboss.plm.persistence.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * PlmCategory .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PLM_CATEGORY")
public class PlmCategory implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String name;

	/** null. */
	private Integer priority;

	/** null. */
	private String status;

	/** null. */
	private Date createTime;

	/** null. */
	private String userId;

	/** . */
	private Set<PlmProject> plmProjects = new HashSet<PlmProject>(0);

	public PlmCategory()
	{
	}

	public PlmCategory(Long id)
	{
		this.id = id;
	}

	public PlmCategory(Long id, String name, Integer priority, String status, Date createTime, String userId, Set<PlmProject> plmProjects)
	{
		this.id = id;
		this.name = name;
		this.priority = priority;
		this.status = status;
		this.createTime = createTime;
		this.userId = userId;
		this.plmProjects = plmProjects;
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "plmCategory")
	public Set<PlmProject> getPlmProjects()
	{
		return this.plmProjects;
	}

	/**
	 * @param plmProjects
	 *            .
	 */
	public void setPlmProjects(Set<PlmProject> plmProjects)
	{
		this.plmProjects = plmProjects;
	}
}
