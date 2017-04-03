package com.woime.iboss.form.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * FormSchema .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "FORM_SCHEMA")
public class FormSchema implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private FormTemplate formTemplate;

	/** null. */
	private String code;

	/** null. */
	private String name;

	/** null. */
	private String type;

	/** null. */
	private Integer readOnly;

	/** null. */
	private Integer notNull;

	/** null. */
	private Integer uniqueConstraint;

	/** null. */
	private String validator;

	/** null. */
	private String conversionPattern;

	/** null. */
	private Integer multiple;

	/** null. */
	private String enumerationKeys;

	/** null. */
	private String enumerationValues;

	/** null. */
	private String tenantId;

	public FormSchema()
	{
	}

	public FormSchema(Long id)
	{
		this.id = id;
	}

	public FormSchema(Long id, FormTemplate formTemplate, String code, String name, String type, Integer readOnly, Integer notNull, Integer uniqueConstraint, String validator,
			String conversionPattern, Integer multiple, String enumerationKeys, String enumerationValues, String tenantId)
	{
		this.id = id;
		this.formTemplate = formTemplate;
		this.code = code;
		this.name = name;
		this.type = type;
		this.readOnly = readOnly;
		this.notNull = notNull;
		this.uniqueConstraint = uniqueConstraint;
		this.validator = validator;
		this.conversionPattern = conversionPattern;
		this.multiple = multiple;
		this.enumerationKeys = enumerationKeys;
		this.enumerationValues = enumerationValues;
		this.tenantId = tenantId;
	}

	/** @return null. */
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public Long getId()
	{
		return this.id;
	}

	/**
	 * @param id
	 *            null.
	 */
	public void setId(Long id)
	{
		this.id = id;
	}

	/** @return null. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "FORM_TEMPLATE_ID")
	public FormTemplate getFormTemplate()
	{
		return this.formTemplate;
	}

	/**
	 * @param formTemplate
	 *            null.
	 */
	public void setFormTemplate(FormTemplate formTemplate)
	{
		this.formTemplate = formTemplate;
	}

	/** @return null. */
	@Column(name = "CODE", length = 50)
	public String getCode()
	{
		return this.code;
	}

	/**
	 * @param code
	 *            null.
	 */
	public void setCode(String code)
	{
		this.code = code;
	}

	/** @return null. */
	@Column(name = "NAME", length = 50)
	public String getName()
	{
		return this.name;
	}

	/**
	 * @param name
	 *            null.
	 */
	public void setName(String name)
	{
		this.name = name;
	}

	/** @return null. */
	@Column(name = "TYPE", length = 200)
	public String getType()
	{
		return this.type;
	}

	/**
	 * @param type
	 *            null.
	 */
	public void setType(String type)
	{
		this.type = type;
	}

	/** @return null. */
	@Column(name = "READ_ONLY")
	public Integer getReadOnly()
	{
		return this.readOnly;
	}

	/**
	 * @param readOnly
	 *            null.
	 */
	public void setReadOnly(Integer readOnly)
	{
		this.readOnly = readOnly;
	}

	/** @return null. */
	@Column(name = "NOT_NULL")
	public Integer getNotNull()
	{
		return this.notNull;
	}

	/**
	 * @param notNull
	 *            null.
	 */
	public void setNotNull(Integer notNull)
	{
		this.notNull = notNull;
	}

	/** @return null. */
	@Column(name = "UNIQUE_CONSTRAINT")
	public Integer getUniqueConstraint()
	{
		return this.uniqueConstraint;
	}

	/**
	 * @param uniqueConstraint
	 *            null.
	 */
	public void setUniqueConstraint(Integer uniqueConstraint)
	{
		this.uniqueConstraint = uniqueConstraint;
	}

	/** @return null. */
	@Column(name = "VALIDATOR", length = 200)
	public String getValidator()
	{
		return this.validator;
	}

	/**
	 * @param validator
	 *            null.
	 */
	public void setValidator(String validator)
	{
		this.validator = validator;
	}

	/** @return null. */
	@Column(name = "CONVERSION_PATTERN", length = 200)
	public String getConversionPattern()
	{
		return this.conversionPattern;
	}

	/**
	 * @param conversionPattern
	 *            null.
	 */
	public void setConversionPattern(String conversionPattern)
	{
		this.conversionPattern = conversionPattern;
	}

	/** @return null. */
	@Column(name = "MULTIPLE")
	public Integer getMultiple()
	{
		return this.multiple;
	}

	/**
	 * @param multiple
	 *            null.
	 */
	public void setMultiple(Integer multiple)
	{
		this.multiple = multiple;
	}

	/** @return null. */
	@Column(name = "ENUMERATION_KEYS", length = 200)
	public String getEnumerationKeys()
	{
		return this.enumerationKeys;
	}

	/**
	 * @param enumerationKeys
	 *            null.
	 */
	public void setEnumerationKeys(String enumerationKeys)
	{
		this.enumerationKeys = enumerationKeys;
	}

	/** @return null. */
	@Column(name = "ENUMERATION_VALUES", length = 200)
	public String getEnumerationValues()
	{
		return this.enumerationValues;
	}

	/**
	 * @param enumerationValues
	 *            null.
	 */
	public void setEnumerationValues(String enumerationValues)
	{
		this.enumerationValues = enumerationValues;
	}

	/** @return null. */
	@Column(name = "TENANT_ID", length = 50)
	public String getTenantId()
	{
		return this.tenantId;
	}

	/**
	 * @param tenantId
	 *            null.
	 */
	public void setTenantId(String tenantId)
	{
		this.tenantId = tenantId;
	}
}
