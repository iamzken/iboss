package com.woime.iboss.auth.persistence.domain;

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
 * Menu 菜单.
 * 
 * @author devaeye
 */
@Entity
@Table(name = "auth_menu")
public class Menu implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** 主键. */
	private Long id;

	/** 外键，上级菜单. */
	private Menu menu;

	/** 外键，权限. */
	private Perm perm;

	/** 分类. */
	private String type;

	/** 编码. */
	private String code;

	/** 标题. */
	private String title;

	/** 链接. */
	private String url;

	/** 排序. */
	private Integer priority;

	/** 备注. */
	private String descn;

	/** 租户. */
	private String tenantId;

	/** null. */
	private String display;

	/** . */
	private Set<Menu> menus = new HashSet<Menu>(0);

	public Menu()
	{
	}

	public Menu(Long id)
	{
		this.id = id;
	}

	public Menu(Long id, Menu menu, Perm perm, String type, String code, String title, String url, Integer priority, String descn, String tenantId, String display, Set<Menu> menus)
	{
		this.id = id;
		this.menu = menu;
		this.perm = perm;
		this.type = type;
		this.code = code;
		this.title = title;
		this.url = url;
		this.priority = priority;
		this.descn = descn;
		this.tenantId = tenantId;
		this.display = display;
		this.menus = menus;
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

	/** @return 外键，上级菜单. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PARENT_ID")
	public Menu getMenu()
	{
		return this.menu;
	}

	/**
	 * @param menu
	 *            外键，上级菜单.
	 */
	public void setMenu(Menu menu)
	{
		this.menu = menu;
	}

	/** @return 外键，权限. */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "PERM_ID")
	public Perm getPerm()
	{
		return this.perm;
	}

	/**
	 * @param perm
	 *            外键，权限.
	 */
	public void setPerm(Perm perm)
	{
		this.perm = perm;
	}

	/** @return 分类. */
	@Column(name = "TYPE", length = 50)
	public String getType()
	{
		return this.type;
	}

	/**
	 * @param type
	 *            分类.
	 */
	public void setType(String type)
	{
		this.type = type;
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

	/** @return 标题. */
	@Column(name = "TITLE", length = 50)
	public String getTitle()
	{
		return this.title;
	}

	/**
	 * @param title
	 *            标题.
	 */
	public void setTitle(String title)
	{
		this.title = title;
	}

	/** @return 链接. */
	@Column(name = "URL", length = 200)
	public String getUrl()
	{
		return this.url;
	}

	/**
	 * @param url
	 *            链接.
	 */
	public void setUrl(String url)
	{
		this.url = url;
	}

	/** @return 排序. */
	@Column(name = "PRIORITY")
	public Integer getPriority()
	{
		return this.priority;
	}

	/**
	 * @param priority
	 *            排序.
	 */
	public void setPriority(Integer priority)
	{
		this.priority = priority;
	}

	/** @return 备注. */
	@Column(name = "DESCN", length = 200)
	public String getDescn()
	{
		return this.descn;
	}

	/**
	 * @param descn
	 *            备注.
	 */
	public void setDescn(String descn)
	{
		this.descn = descn;
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

	/** @return null. */
	@Column(name = "DISPLAY", length = 50)
	public String getDisplay()
	{
		return this.display;
	}

	/**
	 * @param display
	 *            null.
	 */
	public void setDisplay(String display)
	{
		this.display = display;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "menu")
	public Set<Menu> getMenus()
	{
		return this.menus;
	}

	/**
	 * @param menus
	 *            .
	 */
	public void setMenus(Set<Menu> menus)
	{
		this.menus = menus;
	}
}
