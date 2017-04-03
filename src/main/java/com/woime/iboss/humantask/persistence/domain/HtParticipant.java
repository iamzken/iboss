package com.woime.iboss.humantask.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * HtParticipant keyvalue存储.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "HT_PARTICIPANT")
public class HtParticipant implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 外键，humantaskId. */
	private HtHumantask htHumantask;

	/** 分类. */
	private String category;

	/** 类型. */
	private String type;

	/** 引用. */
	private String ref;

	public HtParticipant()
	{
	}

	public HtParticipant(Long id)
	{
		this.id = id;
	}

	public HtParticipant(Long id, HtHumantask htHumantask, String category, String type, String ref)
	{
		this.id = id;
		this.htHumantask = htHumantask;
		this.category = category;
		this.type = type;
		this.ref = ref;
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

	/** @return 外键，humantaskId. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "HUMANTASK_ID")
	public HtHumantask getHtHumantask()
	{
		return this.htHumantask;
	}

	/**
	 * @param htHumantask
	 *            外键，humantaskId.
	 */
	public void setHtHumantask(HtHumantask htHumantask)
	{
		this.htHumantask = htHumantask;
	}

	/** @return 分类. */
	@Column(name = "CATEGORY", length = 200)
	public String getCategory()
	{
		return this.category;
	}

	/**
	 * @param category
	 *            分类.
	 */
	public void setCategory(String category)
	{
		this.category = category;
	}

	/** @return 类型. */
	@Column(name = "TYPE", length = 200)
	public String getType()
	{
		return this.type;
	}

	/**
	 * @param type
	 *            类型.
	 */
	public void setType(String type)
	{
		this.type = type;
	}

	/** @return 引用. */
	@Column(name = "REF", length = 200)
	public String getRef()
	{
		return this.ref;
	}

	/**
	 * @param ref
	 *            引用.
	 */
	public void setRef(String ref)
	{
		this.ref = ref;
	}
}
