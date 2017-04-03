package com.woime.iboss.humantask.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * TaskParticipant 任务参与者.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "TASK_PARTICIPANT")
public class TaskParticipant implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 外键，任务. */
	private TaskInfo taskInfo;

	/** 分类. */
	private String category;

	/** 类型. */
	private String type;

	/** 外部引用. */
	private String ref;

	public TaskParticipant()
	{
	}

	public TaskParticipant(Long id)
	{
		this.id = id;
	}

	public TaskParticipant(Long id, TaskInfo taskInfo, String category, String type, String ref)
	{
		this.id = id;
		this.taskInfo = taskInfo;
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

	/** @return 外键，任务. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "TASK_ID")
	public TaskInfo getTaskInfo()
	{
		return this.taskInfo;
	}

	/**
	 * @param taskInfo
	 *            外键，任务.
	 */
	public void setTaskInfo(TaskInfo taskInfo)
	{
		this.taskInfo = taskInfo;
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
