package com.woime.iboss.group.persistence.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * GroupType .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "GROUP_TYPE")
public class GroupType implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String name;

	/** null. */
	private String tenantId;

	/** . */
	private Set<GroupInfo> groupInfos = new HashSet<GroupInfo>(0);

	public GroupType()
	{
	}

	public GroupType(Long id)
	{
		this.id = id;
	}

	public GroupType(Long id, String name, String tenantId, Set<GroupInfo> groupInfos)
	{
		this.id = id;
		this.name = name;
		this.tenantId = tenantId;
		this.groupInfos = groupInfos;
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "groupType")
	public Set<GroupInfo> getGroupInfos()
	{
		return this.groupInfos;
	}

	/**
	 * @param groupInfos
	 *            .
	 */
	public void setGroupInfos(Set<GroupInfo> groupInfos)
	{
		this.groupInfos = groupInfos;
	}
}
