package com.woime.iboss.party.persistence.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * PartyType 组织类型.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PARTY_TYPE")
public class PartyType implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 名称. */
	private String name;

	/** 租户. */
	private String tenantId;

	/** 类型. */
	private Integer type;

	/** 外部引用. */
	private String ref;

	/** . */
	private Set<PartyStructRule> parentStructRules = new HashSet<PartyStructRule>(0);

	/** . */
	private Set<PartyStructRule> childStructRules = new HashSet<PartyStructRule>(0);

	/** . */
	private Set<PartyEntity> partyEntities = new HashSet<PartyEntity>(0);

	public PartyType()
	{
	}

	public PartyType(Long id)
	{
		this.id = id;
	}

	public PartyType(Long id, String name, String tenantId, Integer type, String ref, Set<PartyStructRule> parentStructRules, Set<PartyStructRule> childStructRules, Set<PartyEntity> partyEntities)
	{
		this.id = id;
		this.name = name;
		this.tenantId = tenantId;
		this.type = type;
		this.ref = ref;
		this.parentStructRules = parentStructRules;
		this.childStructRules = childStructRules;
		this.partyEntities = partyEntities;
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

	/** @return 名称. */
	@Column(name = "NAME", length = 50)
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

	/** @return 类型. */
	@Column(name = "TYPE")
	public Integer getType()
	{
		return this.type;
	}

	/**
	 * @param type
	 *            类型.
	 */
	public void setType(Integer type)
	{
		this.type = type;
	}

	/** @return 外部引用. */
	@Column(name = "REF", length = 50)
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "childType")
	public Set<PartyStructRule> getParentStructRules()
	{
		return this.parentStructRules;
	}

	/**
	 * @param parentStructRules
	 *            .
	 */
	public void setParentStructRules(Set<PartyStructRule> parentStructRules)
	{
		this.parentStructRules = parentStructRules;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "parentType")
	public Set<PartyStructRule> getChildStructRules()
	{
		return this.childStructRules;
	}

	/**
	 * @param childStructRules
	 *            .
	 */
	public void setChildStructRules(Set<PartyStructRule> childStructRules)
	{
		this.childStructRules = childStructRules;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "partyType")
	public Set<PartyEntity> getPartyEntities()
	{
		return this.partyEntities;
	}

	/**
	 * @param partyEntities
	 *            .
	 */
	public void setPartyEntities(Set<PartyEntity> partyEntities)
	{
		this.partyEntities = partyEntities;
	}
}
