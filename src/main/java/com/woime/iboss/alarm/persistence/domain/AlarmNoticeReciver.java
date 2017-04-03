package com.woime.iboss.alarm.persistence.domain;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.woime.iboss.user.persistence.domain.UserBase;

/**
 * 警告通知接收人
 * 
 * @author 王国栋
 *
 */
@Entity
@Table(name = "alarm_notice_recivers")
public class AlarmNoticeReciver implements Serializable
{
	private static final long serialVersionUID = 1L;

	private Long id;
	private String type;
	private UserBase user;
	private long configId;

	public AlarmNoticeReciver(){}

	public AlarmNoticeReciver(String type, long userId, long configId) {
		this.type = type;
		this.user = new UserBase(userId);
		this.configId = configId;
	}

	@Id
	@Column(name = "id", unique = true, nullable = false)
	public Long getId()
	{
		return id;
	}

	public void setId(Long id)
	{
		this.id = id;
	}

	@Column(name = "type")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	/**
	 * 通知接收人对象
	 *
	 * @return
	 */
	@ManyToOne(cascade={CascadeType.MERGE,CascadeType.REFRESH},optional=false)
	@JoinColumn(name = "user_id")
	public UserBase getUser() {
		return user;
	}

	public void setUser(UserBase user) {
		this.user = user;
	}

	@Column(name = "alarm_config_id")
	public long getConfigId() {
		return configId;
	}

	public void setConfigId(long configId) {
		this.configId = configId;
	}
}
