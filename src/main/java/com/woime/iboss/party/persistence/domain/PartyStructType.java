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
 * PartyStructType 组织关系类型.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PARTY_STRUCT_TYPE")
public class PartyStructType implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 名称. */
	private String name;

	/** 外部引用. */
	private String ref;

	/** 租户. */
	private String tenantId;

	/** 排序. */
	private Integer priority;

	/** . */
	private Set<PartyStructRule> partyStructRules = new HashSet<PartyStructRule>(0);

	/** . */
	private Set<PartyStruct> partyStructs = new HashSet<PartyStruct>(0);

	public PartyStructType()
	{
	}

	public PartyStructType(Long id)
	{
		this.id = id;
	}

	public PartyStructType(Long id, String name, String ref, String tenantId, Integer priority, Set<PartyStructRule> partyStructRules, Set<PartyStruct> partyStructs)
	{
		this.id = id;
		this.name = name;
		this.ref = ref;
		this.tenantId = tenantId;
		this.priority = priority;
		this.partyStructRules = partyStructRules;
		this.partyStructs = partyStructs;
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

	/** @return 排序. */
	@Column(name = "PRIORITY")
	public Integer getPriority()
	{
		return this.priority;
	}

	/**
	 * @param priority
	 *            排序.
	 */
	public void setPriority(Integer priority)
	{
		this.priority = priority;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "partyStructType")
	public Set<PartyStructRule> getPartyStructRules()
	{
		return this.partyStructRules;
	}

	/**
	 * @param partyStructRules
	 *            .
	 */
	public void setPartyStructRules(Set<PartyStructRule> partyStructRules)
	{
		this.partyStructRules = partyStructRules;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "partyStructType")
	public Set<PartyStruct> getPartyStructs()
	{
		return this.partyStructs;
	}

	/**
	 * @param partyStructs
	 *            .
	 */
	public void setPartyStructs(Set<PartyStruct> partyStructs)
	{
		this.partyStructs = partyStructs;
	}
}
