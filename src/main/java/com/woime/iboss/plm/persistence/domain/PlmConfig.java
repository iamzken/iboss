package com.woime.iboss.plm.persistence.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * PlmConfig .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PLM_CONFIG")
public class PlmConfig implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String code;

	/** null. */
	private String name;

	/** . */
	private Set<PlmSprint> plmSprints = new HashSet<PlmSprint>(0);

	/** . */
	private Set<PlmStep> plmSteps = new HashSet<PlmStep>(0);

	public PlmConfig()
	{
	}

	public PlmConfig(Long id)
	{
		this.id = id;
	}

	public PlmConfig(Long id, String code, String name, Set<PlmSprint> plmSprints, Set<PlmStep> plmSteps)
	{
		this.id = id;
		this.code = code;
		this.name = name;
		this.plmSprints = plmSprints;
		this.plmSteps = plmSteps;
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "plmConfig")
	public Set<PlmSprint> getPlmSprints()
	{
		return this.plmSprints;
	}

	/**
	 * @param plmSprints
	 *            .
	 */
	public void setPlmSprints(Set<PlmSprint> plmSprints)
	{
		this.plmSprints = plmSprints;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "plmConfig")
	public Set<PlmStep> getPlmSteps()
	{
		return this.plmSteps;
	}

	/**
	 * @param plmSteps
	 *            .
	 */
	public void setPlmSteps(Set<PlmStep> plmSteps)
	{
		this.plmSteps = plmSteps;
	}
}
