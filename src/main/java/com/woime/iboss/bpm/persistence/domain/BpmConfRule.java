package com.woime.iboss.bpm.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * BpmConfRule 配置规则（暂时未用）.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "BPM_CONF_RULE")
public class BpmConfRule implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 外键，配置节点. */
	private BpmConfNode bpmConfNode;

	/** 值. */
	private String value;

	public BpmConfRule()
	{
	}

	public BpmConfRule(Long id)
	{
		this.id = id;
	}

	public BpmConfRule(Long id, BpmConfNode bpmConfNode, String value)
	{
		this.id = id;
		this.bpmConfNode = bpmConfNode;
		this.value = value;
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

	/** @return 外键，配置节点. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "NODE_ID")
	public BpmConfNode getBpmConfNode()
	{
		return this.bpmConfNode;
	}

	/**
	 * @param bpmConfNode
	 *            外键，配置节点.
	 */
	public void setBpmConfNode(BpmConfNode bpmConfNode)
	{
		this.bpmConfNode = bpmConfNode;
	}

	/** @return 值. */
	@Column(name = "VALUE", length = 200)
	public String getValue()
	{
		return this.value;
	}

	/**
	 * @param value
	 *            值.
	 */
	public void setValue(String value)
	{
		this.value = value;
	}
}
