package com.woime.iboss.internal.sendmail.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * SendmailAttachment .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "SENDMAIL_ATTACHMENT")
public class SendmailAttachment implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private SendmailTemplate sendmailTemplate;

	/** null. */
	private String name;

	/** null. */
	private String path;

	/** null. */
	private String tenantId;

	public SendmailAttachment()
	{
	}

	public SendmailAttachment(Long id)
	{
		this.id = id;
	}

	public SendmailAttachment(Long id, SendmailTemplate sendmailTemplate, String name, String path, String tenantId)
	{
		this.id = id;
		this.sendmailTemplate = sendmailTemplate;
		this.name = name;
		this.path = path;
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
	@JoinColumn(name = "TEMPLATE_ID")
	public SendmailTemplate getSendmailTemplate()
	{
		return this.sendmailTemplate;
	}

	/**
	 * @param sendmailTemplate
	 *            null.
	 */
	public void setSendmailTemplate(SendmailTemplate sendmailTemplate)
	{
		this.sendmailTemplate = sendmailTemplate;
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
	@Column(name = "PATH", length = 200)
	public String getPath()
	{
		return this.path;
	}

	/**
	 * @param path
	 *            null.
	 */
	public void setPath(String path)
	{
		this.path = path;
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
