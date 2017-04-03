package com.woime.iboss.user.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * PersonInfo 个人信息.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "PERSON_INFO")
public class PersonInfo implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 唯一标识. */
	private String code;

	/** 账号. */
	private String username;

	/** 姓氏. */
	private String familyName;

	/** 名字. */
	private String givenName;

	/** 全名. */
	private String fullName;

	/** 手机. */
	private String cellphone;

	/** 座机. */
	private String telephone;

	/** 邮箱. */
	private String email;

	/** 即时通讯. */
	private String im;

	/** 国家. */
	private String country;

	/** 省. */
	private String province;

	/** 市. */
	private String city;

	/** 办公楼. */
	private String building;

	/** 楼层. */
	private String floor;

	/** 工位. */
	private String seat;

	/** 工号. */
	private String employeeNo;

	/** 员工类型. */
	private String employeeType;

	/** 工卡. */
	private String card;

	/** 公司编码. */
	private String companyCode;

	/** 公司名称. */
	private String companyName;

	/** 部门编码. */
	private String departmentCode;

	/** 部门名称. */
	private String departmentName;

	/** 职位编码. */
	private String positionCode;

	/** 职位名称. */
	private String positionName;

	/** 性别. */
	private String gender;

	/** 生日. */
	private Date birthday;

	/** 证件类型. */
	private String idCardType;

	/** 证件编号. */
	private String idCardValue;

	/** 国籍. */
	private String nationality;

	/** 星座. */
	private String star;

	/** 血型. */
	private String blood;

	/** 衣服大小. */
	private String clothSize;

	/** 租户. */
	private String tenantId;

	public PersonInfo()
	{
	}

	public PersonInfo(Long id)
	{
		this.id = id;
	}

	public PersonInfo(Long id, String code, String username, String familyName, String givenName, String fullName, String cellphone, String telephone, String email, String im, String country,
			String province, String city, String building, String floor, String seat, String employeeNo, String employeeType, String card, String companyCode, String companyName,
			String departmentCode, String departmentName, String positionCode, String positionName, String gender, Date birthday, String idCardType, String idCardValue, String nationality,
			String star, String blood, String clothSize, String tenantId)
	{
		this.id = id;
		this.code = code;
		this.username = username;
		this.familyName = familyName;
		this.givenName = givenName;
		this.fullName = fullName;
		this.cellphone = cellphone;
		this.telephone = telephone;
		this.email = email;
		this.im = im;
		this.country = country;
		this.province = province;
		this.city = city;
		this.building = building;
		this.floor = floor;
		this.seat = seat;
		this.employeeNo = employeeNo;
		this.employeeType = employeeType;
		this.card = card;
		this.companyCode = companyCode;
		this.companyName = companyName;
		this.departmentCode = departmentCode;
		this.departmentName = departmentName;
		this.positionCode = positionCode;
		this.positionName = positionName;
		this.gender = gender;
		this.birthday = birthday;
		this.idCardType = idCardType;
		this.idCardValue = idCardValue;
		this.nationality = nationality;
		this.star = star;
		this.blood = blood;
		this.clothSize = clothSize;
		this.tenantId = tenantId;
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

	/** @return 唯一标识. */
	@Column(name = "CODE", length = 200)
	public String getCode()
	{
		return this.code;
	}

	/**
	 * @param code
	 *            唯一标识.
	 */
	public void setCode(String code)
	{
		this.code = code;
	}

	/** @return 账号. */
	@Column(name = "USERNAME", length = 200)
	public String getUsername()
	{
		return this.username;
	}

	/**
	 * @param username
	 *            账号.
	 */
	public void setUsername(String username)
	{
		this.username = username;
	}

	/** @return 姓氏. */
	@Column(name = "FAMILY_NAME", length = 200)
	public String getFamilyName()
	{
		return this.familyName;
	}

	/**
	 * @param familyName
	 *            姓氏.
	 */
	public void setFamilyName(String familyName)
	{
		this.familyName = familyName;
	}

	/** @return 名字. */
	@Column(name = "GIVEN_NAME", length = 200)
	public String getGivenName()
	{
		return this.givenName;
	}

	/**
	 * @param givenName
	 *            名字.
	 */
	public void setGivenName(String givenName)
	{
		this.givenName = givenName;
	}

	/** @return 全名. */
	@Column(name = "FULL_NAME", length = 200)
	public String getFullName()
	{
		return this.fullName;
	}

	/**
	 * @param fullName
	 *            全名.
	 */
	public void setFullName(String fullName)
	{
		this.fullName = fullName;
	}

	/** @return 手机. */
	@Column(name = "CELLPHONE", length = 50)
	public String getCellphone()
	{
		return this.cellphone;
	}

	/**
	 * @param cellphone
	 *            手机.
	 */
	public void setCellphone(String cellphone)
	{
		this.cellphone = cellphone;
	}

	/** @return 座机. */
	@Column(name = "TELEPHONE", length = 200)
	public String getTelephone()
	{
		return this.telephone;
	}

	/**
	 * @param telephone
	 *            座机.
	 */
	public void setTelephone(String telephone)
	{
		this.telephone = telephone;
	}

	/** @return 邮箱. */
	@Column(name = "EMAIL", length = 200)
	public String getEmail()
	{
		return this.email;
	}

	/**
	 * @param email
	 *            邮箱.
	 */
	public void setEmail(String email)
	{
		this.email = email;
	}

	/** @return 即时通讯. */
	@Column(name = "IM", length = 200)
	public String getIm()
	{
		return this.im;
	}

	/**
	 * @param im
	 *            即时通讯.
	 */
	public void setIm(String im)
	{
		this.im = im;
	}

	/** @return 国家. */
	@Column(name = "COUNTRY", length = 200)
	public String getCountry()
	{
		return this.country;
	}

	/**
	 * @param country
	 *            国家.
	 */
	public void setCountry(String country)
	{
		this.country = country;
	}

	/** @return 省. */
	@Column(name = "PROVINCE", length = 200)
	public String getProvince()
	{
		return this.province;
	}

	/**
	 * @param province
	 *            省.
	 */
	public void setProvince(String province)
	{
		this.province = province;
	}

	/** @return 市. */
	@Column(name = "CITY", length = 200)
	public String getCity()
	{
		return this.city;
	}

	/**
	 * @param city
	 *            市.
	 */
	public void setCity(String city)
	{
		this.city = city;
	}

	/** @return 办公楼. */
	@Column(name = "BUILDING", length = 200)
	public String getBuilding()
	{
		return this.building;
	}

	/**
	 * @param building
	 *            办公楼.
	 */
	public void setBuilding(String building)
	{
		this.building = building;
	}

	/** @return 楼层. */
	@Column(name = "FLOOR", length = 200)
	public String getFloor()
	{
		return this.floor;
	}

	/**
	 * @param floor
	 *            楼层.
	 */
	public void setFloor(String floor)
	{
		this.floor = floor;
	}

	/** @return 工位. */
	@Column(name = "SEAT", length = 200)
	public String getSeat()
	{
		return this.seat;
	}

	/**
	 * @param seat
	 *            工位.
	 */
	public void setSeat(String seat)
	{
		this.seat = seat;
	}

	/** @return 工号. */
	@Column(name = "EMPLOYEE_NO", length = 50)
	public String getEmployeeNo()
	{
		return this.employeeNo;
	}

	/**
	 * @param employeeNo
	 *            工号.
	 */
	public void setEmployeeNo(String employeeNo)
	{
		this.employeeNo = employeeNo;
	}

	/** @return 员工类型. */
	@Column(name = "EMPLOYEE_TYPE", length = 50)
	public String getEmployeeType()
	{
		return this.employeeType;
	}

	/**
	 * @param employeeType
	 *            员工类型.
	 */
	public void setEmployeeType(String employeeType)
	{
		this.employeeType = employeeType;
	}

	/** @return 工卡. */
	@Column(name = "CARD", length = 200)
	public String getCard()
	{
		return this.card;
	}

	/**
	 * @param card
	 *            工卡.
	 */
	public void setCard(String card)
	{
		this.card = card;
	}

	/** @return 公司编码. */
	@Column(name = "COMPANY_CODE", length = 200)
	public String getCompanyCode()
	{
		return this.companyCode;
	}

	/**
	 * @param companyCode
	 *            公司编码.
	 */
	public void setCompanyCode(String companyCode)
	{
		this.companyCode = companyCode;
	}

	/** @return 公司名称. */
	@Column(name = "COMPANY_NAME", length = 200)
	public String getCompanyName()
	{
		return this.companyName;
	}

	/**
	 * @param companyName
	 *            公司名称.
	 */
	public void setCompanyName(String companyName)
	{
		this.companyName = companyName;
	}

	/** @return 部门编码. */
	@Column(name = "DEPARTMENT_CODE", length = 200)
	public String getDepartmentCode()
	{
		return this.departmentCode;
	}

	/**
	 * @param departmentCode
	 *            部门编码.
	 */
	public void setDepartmentCode(String departmentCode)
	{
		this.departmentCode = departmentCode;
	}

	/** @return 部门名称. */
	@Column(name = "DEPARTMENT_NAME", length = 200)
	public String getDepartmentName()
	{
		return this.departmentName;
	}

	/**
	 * @param departmentName
	 *            部门名称.
	 */
	public void setDepartmentName(String departmentName)
	{
		this.departmentName = departmentName;
	}

	/** @return 职位编码. */
	@Column(name = "POSITION_CODE", length = 200)
	public String getPositionCode()
	{
		return this.positionCode;
	}

	/**
	 * @param positionCode
	 *            职位编码.
	 */
	public void setPositionCode(String positionCode)
	{
		this.positionCode = positionCode;
	}

	/** @return 职位名称. */
	@Column(name = "POSITION_NAME", length = 200)
	public String getPositionName()
	{
		return this.positionName;
	}

	/**
	 * @param positionName
	 *            职位名称.
	 */
	public void setPositionName(String positionName)
	{
		this.positionName = positionName;
	}

	/** @return 性别. */
	@Column(name = "GENDER", length = 500)
	public String getGender()
	{
		return this.gender;
	}

	/**
	 * @param gender
	 *            性别.
	 */
	public void setGender(String gender)
	{
		this.gender = gender;
	}

	/** @return 生日. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "BIRTHDAY", length = 26)
	public Date getBirthday()
	{
		return this.birthday;
	}

	/**
	 * @param birthday
	 *            生日.
	 */
	public void setBirthday(Date birthday)
	{
		this.birthday = birthday;
	}

	/** @return 证件类型. */
	@Column(name = "ID_CARD_TYPE", length = 50)
	public String getIdCardType()
	{
		return this.idCardType;
	}

	/**
	 * @param idCardType
	 *            证件类型.
	 */
	public void setIdCardType(String idCardType)
	{
		this.idCardType = idCardType;
	}

	/** @return 证件编号. */
	@Column(name = "ID_CARD_VALUE", length = 50)
	public String getIdCardValue()
	{
		return this.idCardValue;
	}

	/**
	 * @param idCardValue
	 *            证件编号.
	 */
	public void setIdCardValue(String idCardValue)
	{
		this.idCardValue = idCardValue;
	}

	/** @return 国籍. */
	@Column(name = "NATIONALITY", length = 200)
	public String getNationality()
	{
		return this.nationality;
	}

	/**
	 * @param nationality
	 *            国籍.
	 */
	public void setNationality(String nationality)
	{
		this.nationality = nationality;
	}

	/** @return 星座. */
	@Column(name = "STAR", length = 50)
	public String getStar()
	{
		return this.star;
	}

	/**
	 * @param star
	 *            星座.
	 */
	public void setStar(String star)
	{
		this.star = star;
	}

	/** @return 血型. */
	@Column(name = "BLOOD", length = 50)
	public String getBlood()
	{
		return this.blood;
	}

	/**
	 * @param blood
	 *            血型.
	 */
	public void setBlood(String blood)
	{
		this.blood = blood;
	}

	/** @return 衣服大小. */
	@Column(name = "CLOTH_SIZE", length = 50)
	public String getClothSize()
	{
		return this.clothSize;
	}

	/**
	 * @param clothSize
	 *            衣服大小.
	 */
	public void setClothSize(String clothSize)
	{
		this.clothSize = clothSize;
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
}