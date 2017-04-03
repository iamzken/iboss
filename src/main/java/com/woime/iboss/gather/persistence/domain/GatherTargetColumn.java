package com.woime.iboss.gather.persistence.domain;

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
import com.woime.iboss.core.util.StringUtils;

/**
 * 采集目标对应的列描述
 * 
 * @author 王国栋
 *
 */
@Entity
@Table(name = "gather_target_column")
public class GatherTargetColumn implements Serializable
{
	private static final long serialVersionUID = 1L;

	private Long id;
	private String name;
	private String type;
	private Integer key;
	private Integer nill;

	private String len;
//	private String sql;

	private GatherTarget target;

	private Integer orders;
	
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
		if(StringUtils.isNotBlank(name)) {
			return name.toUpperCase();
		}
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	@Column(name = "type")
	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}

	@Column(name = "key_")
	public Integer getKey()
	{
		return key;
	}

	public void setKey(Integer key)
	{
		this.key = key;
	}

	@Column(name = "nill")
	public Integer getNill()
	{
		return nill;
	}

	public void setNill(Integer nill)
	{
		this.nill = nill;
	}

//	@Column(name = "sql")
//	public String getSql()
//	{
//		return sql;
//	}
//
//	public void setSql(String sql)
//	{
//		this.sql = sql;
//	}
	
	@ManyToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "gather_target_id")
	@JsonIgnore
	public GatherTarget getTarget()
	{
		return target;
	}

	public void setTarget(GatherTarget target)
	{
		this.target = target;
	}

	@Column(name = "orders")
	public Integer getOrders()
	{
		return orders;
	}

	public void setOrders(Integer orders)
	{
		this.orders = orders;
	}

	@Column(name = "len")
	public String getLen() {
		return len;
	}

	public void setLen(String len) {
		this.len = len;
	}
}
