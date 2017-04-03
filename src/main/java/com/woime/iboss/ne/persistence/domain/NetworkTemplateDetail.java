package com.woime.iboss.ne.persistence.domain;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 网元模板详细
 * 
 * @author 王国栋
 *
 */
@Entity
@Table(name = "ne_template_detail")
public class NetworkTemplateDetail implements Serializable
{
	private static final long serialVersionUID = 1L;
	private Long id;

	private String name;
	private Integer type;
	private Long orders;
	@JsonIgnore
	private NetworkTemplate networkTemplate;
	
	private String code;
	@Id
	@Column(name = "id")
	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	@Column(name = "name")
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	@Column(name = "type")
	public Integer getType()
	{
		return type;
	}

	public void setType(Integer type)
	{
		this.type = type;
	}

	@Column(name = "orders")
	public Long getOrders()
	{
		return orders;
	}

	public void setOrders(Long orders)
	{
		this.orders = orders;
	}

	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH }, fetch = FetchType.LAZY)
	@JoinColumn(name = "ne_template_id")
	public NetworkTemplate getNetworkTemplate()
	{
		return networkTemplate;
	}

	public void setNetworkTemplate(NetworkTemplate networkTemplate)
	{
		this.networkTemplate = networkTemplate;
	}

	@Column(name = "code_")
	public String getCode()
	{
		return code;
	}

	public void setCode(String code)
	{
		this.code = code;
	}
}
