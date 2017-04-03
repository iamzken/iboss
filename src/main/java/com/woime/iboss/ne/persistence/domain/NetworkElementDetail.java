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

/**
 * 网元详细
 * 
 * @author 王国栋
 *
 */
@Entity
@Table(name = "network_elements")
public class NetworkElementDetail implements Serializable
{
	private static final long serialVersionUID = 1L;

	private Long id;
	private NetworkElement ne;
	private String name;
	private String value;
	private Long orders;

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

	@ManyToOne(cascade = { CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH }, fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "ne_id")
	public NetworkElement getNe()
	{
		return ne;
	}

	public void setNe(NetworkElement ne)
	{
		this.ne = ne;
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

	@Column(name = "value")
	public String getValue()
	{
		return value;
	}

	public void setValue(String value)
	{
		this.value = value;
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

}
