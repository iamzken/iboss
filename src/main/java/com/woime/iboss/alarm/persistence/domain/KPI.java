package com.woime.iboss.alarm.persistence.domain;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.woime.iboss.ne.persistence.domain.NetworkElement;

/**
 * 绩效指标项
 * 
 * @author 王国栋
 *
 */
@Entity
@Table(name = "kpi")
public class KPI implements Serializable
{
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	private Long id;
	@Column(name = "name")
	private String name;
	@Column(name = "comments")
	private String comments;
	/**
	 * 硬件、软件、业务
	 */
	@Column(name = "type")
	private Integer kpiType;
	/**
	 * 当前绩效的适用范围，如果为null就是不限定使用范围
	 */
	private NetworkElement ne;

	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getComments()
	{
		return comments;
	}

	public void setComments(String comments)
	{
		this.comments = comments;
	}

	public Integer getKpiType()
	{
		return kpiType;
	}

	public void setKpiType(Integer kpiType)
	{
		this.kpiType = kpiType;
	}

	@ManyToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.EAGER)
	@JoinColumn(name = "ne_id")
	public NetworkElement getNe()
	{
		return ne;
	}

	public void setNe(NetworkElement ne)
	{
		this.ne = ne;
	}
}
