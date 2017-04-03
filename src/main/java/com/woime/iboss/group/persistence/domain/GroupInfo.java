package com.woime.iboss.group.persistence.domain;

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
 * GroupInfo .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "GROUP_INFO")
public class GroupInfo implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private GroupType groupType;

	/** null. */
	private String code;

	/** null. */
	private String name;

	/** null. */
	private String ref;

	/** null. */
	private String descn;

	/** null. */
	private Integer memberCount;

	/** null. */
	private String status;

	/** null. */
	private String tenantId;

	/** . */
	private Set<GroupRelation> groupRelationsForChildId = new HashSet<GroupRelation>(0);

	/** . */
	private Set<GroupMember> groupMembers = new HashSet<GroupMember>(0);

	/** . */
	private Set<GroupAlias> groupAliases = new HashSet<GroupAlias>(0);

	/** . */
	private Set<GroupAdmin> groupAdmins = new HashSet<GroupAdmin>(0);

	/** . */
	private Set<GroupRelation> groupRelationsForParentId = new HashSet<GroupRelation>(0);

	public GroupInfo()
	{
	}

	public GroupInfo(Long id)
	{
		this.id = id;
	}

	public GroupInfo(Long id, GroupType groupType, String code, String name, String ref, String descn, Integer memberCount, String status, String tenantId, Set<GroupRelation> groupRelationsForChildId,
			Set<GroupMember> groupMembers, Set<GroupAlias> groupAliases, Set<GroupAdmin> groupAdmins, Set<GroupRelation> groupRelationsForParentId)
	{
		this.id = id;
		this.groupType = groupType;
		this.code = code;
		this.name = name;
		this.ref = ref;
		this.descn = descn;
		this.memberCount = memberCount;
		this.status = status;
		this.tenantId = tenantId;
		this.groupRelationsForChildId = groupRelationsForChildId;
		this.groupMembers = groupMembers;
		this.groupAliases = groupAliases;
		this.groupAdmins = groupAdmins;
		this.groupRelationsForParentId = groupRelationsForParentId;
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
	public GroupType getGroupType()
	{
		return this.groupType;
	}

	/**
	 * @param groupType
	 *            null.
	 */
	public void setGroupType(GroupType groupType)
	{
		this.groupType = groupType;
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
	@Column(name = "DESCN", length = 200)
	public String getDescn()
	{
		return this.descn;
	}

	/**
	 * @param descn
	 *            null.
	 */
	public void setDescn(String descn)
	{
		this.descn = descn;
	}

	/** @return null. */
	@Column(name = "MEMBER_COUNT")
	public Integer getMemberCount()
	{
		return this.memberCount;
	}

	/**
	 * @param memberCount
	 *            null.
	 */
	public void setMemberCount(Integer memberCount)
	{
		this.memberCount = memberCount;
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
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "groupInfoByChildId")
	public Set<GroupRelation> getGroupRelationsForChildId()
	{
		return this.groupRelationsForChildId;
	}

	/**
	 * @param groupRelationsForChildId
	 *            .
	 */
	public void setGroupRelationsForChildId(Set<GroupRelation> groupRelationsForChildId)
	{
		this.groupRelationsForChildId = groupRelationsForChildId;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "groupInfo")
	public Set<GroupMember> getGroupMembers()
	{
		return this.groupMembers;
	}

	/**
	 * @param groupMembers
	 *            .
	 */
	public void setGroupMembers(Set<GroupMember> groupMembers)
	{
		this.groupMembers = groupMembers;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "groupInfo")
	public Set<GroupAlias> getGroupAliases()
	{
		return this.groupAliases;
	}

	/**
	 * @param groupAliases
	 *            .
	 */
	public void setGroupAliases(Set<GroupAlias> groupAliases)
	{
		this.groupAliases = groupAliases;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "groupInfo")
	public Set<GroupAdmin> getGroupAdmins()
	{
		return this.groupAdmins;
	}

	/**
	 * @param groupAdmins
	 *            .
	 */
	public void setGroupAdmins(Set<GroupAdmin> groupAdmins)
	{
		this.groupAdmins = groupAdmins;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "groupInfoByParentId")
	public Set<GroupRelation> getGroupRelationsForParentId()
	{
		return this.groupRelationsForParentId;
	}

	/**
	 * @param groupRelationsForParentId
	 *            .
	 */
	public void setGroupRelationsForParentId(Set<GroupRelation> groupRelationsForParentId)
	{
		this.groupRelationsForParentId = groupRelationsForParentId;
	}
}
