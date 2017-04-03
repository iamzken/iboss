package com.woime.iboss.party.persistence.domain;

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
 * PartyEntity 组织实体.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PARTY_ENTITY")
public class PartyEntity implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 外键，组织类型. */
	private PartyType partyType;

	/** 名称. */
	private String name;

	/** 外部引用. */
	private String ref;

	/** 租户. */
	private String tenantId;

	/** 级别. */
	private Integer level;

	/** . */
	private Set<PartyStruct> parentStructs = new HashSet<PartyStruct>(0);

	/** . */
	private Set<PartyStruct> childStructs = new HashSet<PartyStruct>(0);

	public PartyEntity()
	{
	}

	public PartyEntity(Long id)
	{
		this.id = id;
	}

	public PartyEntity(Long id, PartyType partyType, String name, String ref, String tenantId, Integer level, Set<PartyStruct> parentStructs, Set<PartyStruct> childStructs)
	{
		this.id = id;
		this.partyType = partyType;
		this.name = name;
		this.ref = ref;
		this.tenantId = tenantId;
		this.level = level;
		this.parentStructs = parentStructs;
		this.childStructs = childStructs;
	}

	/** @return 主键. */
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Long getId()
	{
		return this.id;
	}

	/**
	 * @param id
	 *            主键.
	 */
	public void setId(Long id)
	{
		this.id = id;
	}

	/** @return 外键，组织类型. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "TYPE_ID")
	public PartyType getPartyType()
	{
		return this.partyType;
	}

	/**
	 * @param partyType
	 *            外键，组织类型.
	 */
	public void setPartyType(PartyType partyType)
	{
		this.partyType = partyType;
	}

	/** @return 名称. */
	@Column(name = "NAME", length = 100)
	public String getName()
	{
		return this.name;
	}

	/**
	 * @param name
	 *            名称.
	 */
	public void setName(String name)
	{
		this.name = name;
	}

	/** @return 外部引用. */
	@Column(name = "REF", length = 100)
	public String getRef()
	{
		return this.ref;
	}

	/**
	 * @param ref
	 *            外部引用.
	 */
	public void setRef(String ref)
	{
		this.ref = ref;
	}

	/** @return 租户. */
	@Column(name = "TENANT_ID", length = 50)
	public String getTenantId()
	{
		return this.tenantId;
	}

	/**
	 * @param tenantId
	 *            租户.
	 */
	public void setTenantId(String tenantId)
	{
		this.tenantId = tenantId;
	}

	/** @return 级别. */
	@Column(name = "LEVEL")
	public Integer getLevel()
	{
		return this.level;
	}

	/**
	 * @param level
	 *            级别.
	 */
	public void setLevel(Integer level)
	{
		this.level = level;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "childEntity")
	public Set<PartyStruct> getParentStructs()
	{
		return this.parentStructs;
	}

	/**
	 * @param parentStructs
	 *            .
	 */
	public void setParentStructs(Set<PartyStruct> parentStructs)
	{
		this.parentStructs = parentStructs;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "parentEntity")
	public Set<PartyStruct> getChildStructs()
	{
		return this.childStructs;
	}

	/**
	 * @param childStructs
	 *            .
	 */
	public void setChildStructs(Set<PartyStruct> childStructs)
	{
		this.childStructs = childStructs;
	}
}
