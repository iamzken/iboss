package com.woime.iboss.ne.persistence.domain;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.woime.iboss.alarm.persistence.domain.AlarmConfig;
import com.woime.iboss.api.keyvalue.Record;

/**
 * 网元
 * 
 * @author 王国栋
 *
 */
@Entity
@Table(name = "network_elements")
public class NetworkElement implements Serializable
{
	private static final long serialVersionUID = 8914171216633184777L;

	private Long id;
	private Long parentId;

	private String name;
	private int orders;
	
	/**
	 * 网元类型，取值从模板里面取名字
	 */
	private String type;
	/**
	 * 网元路径
	 */
	private String path;

	private Integer leaf = 1;
	
	List<AlarmConfig> alarmConfig;

	private NetworkTemplate neTemplate;

	/**
	 * 实际存值的地方
	 */
	private Record record;

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

	@Column(name = "parent_id")
	public Long getParentId()
	{
		return parentId;
	}

	public void setParentId(Long parentId)
	{
		this.parentId = parentId;
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

	@Column(name = "orders")
	public int getOrders()
	{
		return orders;
	}

	public void setOrders(int orders)
	{
		this.orders = orders;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "ne_id")
	public List<AlarmConfig> getAlarmConfig()
	{
		return alarmConfig;
	}

	public void setAlarmConfig(List<AlarmConfig> alarmConfig)
	{
		this.alarmConfig = alarmConfig;
	}

	@ManyToOne(cascade = { CascadeType.REFRESH }, fetch = FetchType.EAGER)
	@JoinColumn(name = "ne_template")
	public NetworkTemplate getNeTemplate()
	{
		return neTemplate;
	}

	public void setNeTemplate(NetworkTemplate neTemplate)
	{
		this.neTemplate = neTemplate;
	}

	@Transient
	public Record getRecord()
	{
		return record;
	}
	public void setRecord(Record record)
	{
		this.record = record;
	}

	@Column(name = "ne_path")
	public String getPath()
	{
		return path;
	}

	public void setPath(String path)
	{
		this.path = path;
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

	@Transient
	public Integer getLeaf() {
		return leaf;
	}

	public void setLeaf(Integer leaf) {
		this.leaf = leaf;
	}
}
