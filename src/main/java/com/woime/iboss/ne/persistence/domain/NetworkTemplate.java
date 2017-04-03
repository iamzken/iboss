package com.woime.iboss.ne.persistence.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * 网元模板
 * 
 * @author 王国栋
 *
 */
@Entity
@Table(name = "ne_template")
public class NetworkTemplate implements Serializable
{
	private static final long serialVersionUID = 1L;

	private Long id;
	private String name;
	private Long parentId;
	private Integer type;

	List<NetworkTemplateDetail> details;

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

	@Column(name = "parent_id")
	public Long getParentId()
	{
		return parentId;
	}

	public void setParentId(Long parentId)
	{
		this.parentId = parentId;
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

	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.ALL }, mappedBy = "networkTemplate")
	public List<NetworkTemplateDetail> getDetails()
	{
		return details;
	}

	public void setDetails(List<NetworkTemplateDetail> details)
	{
		this.details = details;
	}
}
