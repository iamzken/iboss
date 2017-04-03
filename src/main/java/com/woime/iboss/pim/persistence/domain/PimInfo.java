package com.woime.iboss.pim.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * PimInfo .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PIM_INFO")
public class PimInfo implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String name;

	/** null. */
	private String photo;

	/** null. */
	private Date birthday;

	/** null. */
	private String address;

	/** null. */
	private String tel;

	/** null. */
	private String email;

	/** null. */
	private String org;

	/** null. */
	private String title;

	/** null. */
	private String tenantId;

	/** null. */
	private String userId;

	/** null. */
	private String department;

	/** null. */
	private String impp;

	/** null. */
	private String type;

	/** null. */
	private String ref;

	public PimInfo()
	{
	}

	public PimInfo(Long id)
	{
		this.id = id;
	}

	public PimInfo(Long id, String name, String photo, Date birthday, String address, String tel, String email, String org, String title, String tenantId, String userId, String department,
			String impp, String type, String ref)
	{
		this.id = id;
		this.name = name;
		this.photo = photo;
		this.birthday = birthday;
		this.address = address;
		this.tel = tel;
		this.email = email;
		this.org = org;
		this.title = title;
		this.tenantId = tenantId;
		this.userId = userId;
		this.department = department;
		this.impp = impp;
		this.type = type;
		this.ref = ref;
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
	@Column(name = "NAME", length = 200)
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
	@Column(name = "PHOTO", length = 200)
	public String getPhoto()
	{
		return this.photo;
	}

	/**
	 * @param photo
	 *            null.
	 */
	public void setPhoto(String photo)
	{
		this.photo = photo;
	}

	/** @return null. */
	@Temporal(TemporalType.DATE)
	@Column(name = "BIRTHDAY", length = 10)
	public Date getBirthday()
	{
		return this.birthday;
	}

	/**
	 * @param birthday
	 *            null.
	 */
	public void setBirthday(Date birthday)
	{
		this.birthday = birthday;
	}

	/** @return null. */
	@Column(name = "ADDRESS", length = 200)
	public String getAddress()
	{
		return this.address;
	}

	/**
	 * @param address
	 *            null.
	 */
	public void setAddress(String address)
	{
		this.address = address;
	}

	/** @return null. */
	@Column(name = "TEL", length = 200)
	public String getTel()
	{
		return this.tel;
	}

	/**
	 * @param tel
	 *            null.
	 */
	public void setTel(String tel)
	{
		this.tel = tel;
	}

	/** @return null. */
	@Column(name = "EMAIL", length = 200)
	public String getEmail()
	{
		return this.email;
	}

	/**
	 * @param email
	 *            null.
	 */
	public void setEmail(String email)
	{
		this.email = email;
	}

	/** @return null. */
	@Column(name = "ORG", length = 200)
	public String getOrg()
	{
		return this.org;
	}

	/**
	 * @param org
	 *            null.
	 */
	public void setOrg(String org)
	{
		this.org = org;
	}

	/** @return null. */
	@Column(name = "TITLE", length = 200)
	public String getTitle()
	{
		return this.title;
	}

	/**
	 * @param title
	 *            null.
	 */
	public void setTitle(String title)
	{
		this.title = title;
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

	/** @return null. */
	@Column(name = "USER_ID", length = 64)
	public String getUserId()
	{
		return this.userId;
	}

	/**
	 * @param userId
	 *            null.
	 */
	public void setUserId(String userId)
	{
		this.userId = userId;
	}

	/** @return null. */
	@Column(name = "DEPARTMENT", length = 100)
	public String getDepartment()
	{
		return this.department;
	}

	/**
	 * @param department
	 *            null.
	 */
	public void setDepartment(String department)
	{
		this.department = department;
	}

	/** @return null. */
	@Column(name = "IMPP", length = 100)
	public String getImpp()
	{
		return this.impp;
	}

	/**
	 * @param impp
	 *            null.
	 */
	public void setImpp(String impp)
	{
		this.impp = impp;
	}

	/** @return null. */
	@Column(name = "TYPE", length = 50)
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
	@Column(name = "REF", length = 64)
	public String getRef()
	{
		return this.ref;
	}

	/**
	 * @param ref
	 *            null.
	 */
	public void setRef(String ref)
	{
		this.ref = ref;
	}
}
