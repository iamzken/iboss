package com.woime.iboss.group.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * GroupRelation .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "GROUP_RELATION")
public class GroupRelation implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private GroupInfo groupInfoByParentId;

	/** null. */
	private GroupInfo groupInfoByChildId;

	/** null. */
	private String tenantId;

	public GroupRelation()
	{
	}

	public GroupRelation(Long id)
	{
		this.id = id;
	}

	public GroupRelation(Long id, GroupInfo groupInfoByParentId, GroupInfo groupInfoByChildId, String tenantId)
	{
		this.id = id;
		this.groupInfoByParentId = groupInfoByParentId;
		this.groupInfoByChildId = groupInfoByChildId;
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
	@JoinColumn(name = "PARENT_ID")
	public GroupInfo getGroupInfoByParentId()
	{
		return this.groupInfoByParentId;
	}

	/**
	 * @param groupInfoByParentId
	 *            null.
	 */
	public void setGroupInfoByParentId(GroupInfo groupInfoByParentId)
	{
		this.groupInfoByParentId = groupInfoByParentId;
	}

	/** @return null. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "CHILD_ID")
	public GroupInfo getGroupInfoByChildId()
	{
		return this.groupInfoByChildId;
	}

	/**
	 * @param groupInfoByChildId
	 *            null.
	 */
	public void setGroupInfoByChildId(GroupInfo groupInfoByChildId)
	{
		this.groupInfoByChildId = groupInfoByChildId;
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
