package com.woime.iboss.pim.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * PimRemind 提醒.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PIM_REMIND")
public class PimRemind implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 重复类型，一次，每天，每周. */
	private String type;

	/** 是否重复提醒. */
	private String repeatType;

	/** 提醒间隔. */
	private Integer repeatPeroid;

	/** 优先级. */
	private Integer priority;

	/** 提醒时间. */
	private String remindTime;

	/** 备注. */
	private String description;

	/** 创建时间. */
	private Date createTime;

	/** 状态. */
	private String status;

	/** 用户. */
	private String userId;

	/** 外部引用. */
	private String ref;

	public PimRemind()
	{
	}

	public PimRemind(Long id)
	{
		this.id = id;
	}

	public PimRemind(Long id, String type, String repeatType, Integer repeatPeroid, Integer priority, String remindTime, String description, Date createTime, String status, String userId, String ref)
	{
		this.id = id;
		this.type = type;
		this.repeatType = repeatType;
		this.repeatPeroid = repeatPeroid;
		this.priority = priority;
		this.remindTime = remindTime;
		this.description = description;
		this.createTime = createTime;
		this.status = status;
		this.userId = userId;
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

	/** @return 重复类型，一次，每天，每周. */
	@Column(name = "TYPE", length = 50)
	public String getType()
	{
		return this.type;
	}

	/**
	 * @param type
	 *            重复类型，一次，每天，每周.
	 */
	public void setType(String type)
	{
		this.type = type;
	}

	/** @return 是否重复提醒. */
	@Column(name = "REPEAT_TYPE", length = 64)
	public String getRepeatType()
	{
		return this.repeatType;
	}

	/**
	 * @param repeatType
	 *            是否重复提醒.
	 */
	public void setRepeatType(String repeatType)
	{
		this.repeatType = repeatType;
	}

	/** @return 提醒间隔. */
	@Column(name = "REPEAT_PEROID")
	public Integer getRepeatPeroid()
	{
		return this.repeatPeroid;
	}

	/**
	 * @param repeatPeroid
	 *            提醒间隔.
	 */
	public void setRepeatPeroid(Integer repeatPeroid)
	{
		this.repeatPeroid = repeatPeroid;
	}

	/** @return 优先级. */
	@Column(name = "PRIORITY")
	public Integer getPriority()
	{
		return this.priority;
	}

	/**
	 * @param priority
	 *            优先级.
	 */
	public void setPriority(Integer priority)
	{
		this.priority = priority;
	}

	/** @return 提醒时间. */
	@Column(name = "REMIND_TIME", length = 50)
	public String getRemindTime()
	{
		return this.remindTime;
	}

	/**
	 * @param remindTime
	 *            提醒时间.
	 */
	public void setRemindTime(String remindTime)
	{
		this.remindTime = remindTime;
	}

	/** @return 备注. */
	@Column(name = "DESCRIPTION", length = 200)
	public String getDescription()
	{
		return this.description;
	}

	/**
	 * @param description
	 *            备注.
	 */
	public void setDescription(String description)
	{
		this.description = description;
	}

	/** @return 创建时间. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_TIME", length = 26)
	public Date getCreateTime()
	{
		return this.createTime;
	}

	/**
	 * @param createTime
	 *            创建时间.
	 */
	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}

	/** @return 状态. */
	@Column(name = "STATUS", length = 50)
	public String getStatus()
	{
		return this.status;
	}

	/**
	 * @param status
	 *            状态.
	 */
	public void setStatus(String status)
	{
		this.status = status;
	}

	/** @return 用户. */
	@Column(name = "USER_ID", length = 64)
	public String getUserId()
	{
		return this.userId;
	}

	/**
	 * @param userId
	 *            用户.
	 */
	public void setUserId(String userId)
	{
		this.userId = userId;
	}

	/** @return 外部引用. */
	@Column(name = "REF", length = 200)
	public String getRef()
	{
		return this.ref;
	}

	/**
	 * @param ref
	 *            外部引用.
	 */
	public void setRef(String ref)
	{
		this.ref = ref;
	}
}
