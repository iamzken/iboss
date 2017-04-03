package com.woime.iboss.form.persistence.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * FormTemplate 表单模板.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "FORM_TEMPLATE")
public class FormTemplate implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 分类. */
	private Integer type;

	/** 名称. */
	private String name;

	/** 内容. */
	private String content;

	/** 编码. */
	private String code;

	/** 租户. */
	private String tenantId;

	/** 用户. */
	private String userId;

	/** 创建时间. */
	private Date createTime;

	/** . */
	private Set<FormSchema> formSchemas = new HashSet<FormSchema>(0);

	public FormTemplate()
	{
	}

	public FormTemplate(Long id)
	{
		this.id = id;
	}

	public FormTemplate(Long id, Integer type, String name, String content, String code, String tenantId, String userId, Date createTime, Set<FormSchema> formSchemas)
	{
		this.id = id;
		this.type = type;
		this.name = name;
		this.content = content;
		this.code = code;
		this.tenantId = tenantId;
		this.userId = userId;
		this.createTime = createTime;
		this.formSchemas = formSchemas;
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

	/** @return 分类. */
	@Column(name = "TYPE")
	public Integer getType()
	{
		return this.type;
	}

	/**
	 * @param type
	 *            分类.
	 */
	public void setType(Integer type)
	{
		this.type = type;
	}

	/** @return 名称. */
	@Column(name = "NAME", length = 200)
	public String getName()
	{
		return this.name;
	}

	/**
	 * @param name
	 *            名称.
	 */
	public void setName(String name)
	{
		this.name = name;
	}

	/** @return 内容. */
	@Column(name = "CONTENT", length = 65535)
	public String getContent()
	{
		return this.content;
	}

	/**
	 * @param content
	 *            内容.
	 */
	public void setContent(String content)
	{
		this.content = content;
	}

	/** @return 编码. */
	@Column(name = "CODE", length = 50)
	public String getCode()
	{
		return this.code;
	}

	/**
	 * @param code
	 *            编码.
	 */
	public void setCode(String code)
	{
		this.code = code;
	}

	/** @return 租户. */
	@Column(name = "TENANT_ID", length = 64)
	public String getTenantId()
	{
		return this.tenantId;
	}

	/**
	 * @param tenantId
	 *            租户.
	 */
	public void setTenantId(String tenantId)
	{
		this.tenantId = tenantId;
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "formTemplate")
	public Set<FormSchema> getFormSchemas()
	{
		return this.formSchemas;
	}

	/**
	 * @param formSchemas
	 *            .
	 */
	public void setFormSchemas(Set<FormSchema> formSchemas)
	{
		this.formSchemas = formSchemas;
	}
}
