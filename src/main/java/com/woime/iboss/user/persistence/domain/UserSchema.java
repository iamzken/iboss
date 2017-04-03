package com.woime.iboss.user.persistence.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * UserSchema .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "USER_SCHEMA")
public class UserSchema implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private UserRepo userRepo;

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
	private String scopeId;

	/** . */
	private Set<UserAttr> userAttrs = new HashSet<UserAttr>(0);

	public UserSchema()
	{
	}

	public UserSchema(Long id)
	{
		this.id = id;
	}

	public UserSchema(Long id, UserRepo userRepo, String code, String name, String type, Integer readOnly, Integer notNull, Integer uniqueConstraint, String validator, String conversionPattern,
			Integer multiple, String enumerationKeys, String enumerationValues, String scopeId, Set<UserAttr> userAttrs)
	{
		this.id = id;
		this.userRepo = userRepo;
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
		this.scopeId = scopeId;
		this.userAttrs = userAttrs;
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
	@JoinColumn(name = "USER_REPO_ID")
	public UserRepo getUserRepo()
	{
		return this.userRepo;
	}

	/**
	 * @param userRepo
	 *            null.
	 */
	public void setUserRepo(UserRepo userRepo)
	{
		this.userRepo = userRepo;
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
	@Column(name = "SCOPE_ID", length = 50)
	public String getScopeId()
	{
		return this.scopeId;
	}

	/**
	 * @param scopeId
	 *            null.
	 */
	public void setScopeId(String scopeId)
	{
		this.scopeId = scopeId;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "userSchema")
	public Set<UserAttr> getUserAttrs()
	{
		return this.userAttrs;
	}

	/**
	 * @param userAttrs
	 *            .
	 */
	public void setUserAttrs(Set<UserAttr> userAttrs)
	{
		this.userAttrs = userAttrs;
	}
}
