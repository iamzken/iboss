package com.woime.iboss.dict.persistence.domain;

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
 * DictInfo 数据字典.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "DICT_INFO")
public class DictInfo implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 唯一主键. */
	private Long id;

	/** 外键，DICT_TYPE. */
	private DictType dictType;

	/** 名称. */
	private String name;

	/** 数据. */
	private String value;

	/** 排序. */
	private Integer priority;

	/** null. */
	private String tenantId;

	/** . */
	private Set<DictData> dictDatas = new HashSet<DictData>(0);

	public DictInfo()
	{
	}

	public DictInfo(Long id)
	{
		this.id = id;
	}

	public DictInfo(Long id, DictType dictType, String name, String value, Integer priority, String tenantId, Set<DictData> dictDatas)
	{
		this.id = id;
		this.dictType = dictType;
		this.name = name;
		this.value = value;
		this.priority = priority;
		this.tenantId = tenantId;
		this.dictDatas = dictDatas;
	}

	/** @return 唯一主键. */
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Long getId()
	{
		return this.id;
	}

	/**
	 * @param id
	 *            唯一主键.
	 */
	public void setId(Long id)
	{
		this.id = id;
	}

	/** @return 外键，DICT_TYPE. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "TYPE_ID")
	public DictType getDictType()
	{
		return this.dictType;
	}

	/**
	 * @param dictType
	 *            外键，DICT_TYPE.
	 */
	public void setDictType(DictType dictType)
	{
		this.dictType = dictType;
	}

	/** @return 名称. */
	@Column(name = "NAME", length = 200)
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

	/** @return 数据. */
	@Column(name = "VALUE", length = 200)
	public String getValue()
	{
		return this.value;
	}

	/**
	 * @param value
	 *            数据.
	 */
	public void setValue(String value)
	{
		this.value = value;
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
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "dictInfo")
	public Set<DictData> getDictDatas()
	{
		return this.dictDatas;
	}

	/**
	 * @param dictDatas
	 *            .
	 */
	public void setDictDatas(Set<DictData> dictDatas)
	{
		this.dictDatas = dictDatas;
	}
}
