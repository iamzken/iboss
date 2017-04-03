package com.woime.iboss.internal.sendmail.persistence.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * SendmailTemplate .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "SENDMAIL_TEMPLATE")
public class SendmailTemplate implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String name;

	/** null. */
	private String receiver;

	/** null. */
	private String sender;

	/** null. */
	private String cc;

	/** null. */
	private String bcc;

	/** null. */
	private String subject;

	/** null. */
	private String content;

	/** null. */
	private Integer manual;

	/** null. */
	private String tenantId;

	/** . */
	private Set<SendmailAttachment> sendmailAttachments = new HashSet<SendmailAttachment>(0);

	/** . */
	private Set<SendmailHistory> sendmailHistories = new HashSet<SendmailHistory>(0);

	/** . */
	private Set<SendmailQueue> sendmailQueues = new HashSet<SendmailQueue>(0);

	public SendmailTemplate()
	{
	}

	public SendmailTemplate(Long id)
	{
		this.id = id;
	}

	public SendmailTemplate(Long id, String name, String receiver, String sender, String cc, String bcc, String subject, String content, Integer manual, String tenantId,
			Set<SendmailAttachment> sendmailAttachments, Set<SendmailHistory> sendmailHistories, Set<SendmailQueue> sendmailQueues)
	{
		this.id = id;
		this.name = name;
		this.receiver = receiver;
		this.sender = sender;
		this.cc = cc;
		this.bcc = bcc;
		this.subject = subject;
		this.content = content;
		this.manual = manual;
		this.tenantId = tenantId;
		this.sendmailAttachments = sendmailAttachments;
		this.sendmailHistories = sendmailHistories;
		this.sendmailQueues = sendmailQueues;
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
	@Column(name = "RECEIVER", length = 200)
	public String getReceiver()
	{
		return this.receiver;
	}

	/**
	 * @param receiver
	 *            null.
	 */
	public void setReceiver(String receiver)
	{
		this.receiver = receiver;
	}

	/** @return null. */
	@Column(name = "SENDER", length = 200)
	public String getSender()
	{
		return this.sender;
	}

	/**
	 * @param sender
	 *            null.
	 */
	public void setSender(String sender)
	{
		this.sender = sender;
	}

	/** @return null. */
	@Column(name = "CC", length = 200)
	public String getCc()
	{
		return this.cc;
	}

	/**
	 * @param cc
	 *            null.
	 */
	public void setCc(String cc)
	{
		this.cc = cc;
	}

	/** @return null. */
	@Column(name = "BCC", length = 200)
	public String getBcc()
	{
		return this.bcc;
	}

	/**
	 * @param bcc
	 *            null.
	 */
	public void setBcc(String bcc)
	{
		this.bcc = bcc;
	}

	/** @return null. */
	@Column(name = "SUBJECT", length = 200)
	public String getSubject()
	{
		return this.subject;
	}

	/**
	 * @param subject
	 *            null.
	 */
	public void setSubject(String subject)
	{
		this.subject = subject;
	}

	/** @return null. */
	@Column(name = "CONTENT", length = 65535)
	public String getContent()
	{
		return this.content;
	}

	/**
	 * @param content
	 *            null.
	 */
	public void setContent(String content)
	{
		this.content = content;
	}

	/** @return null. */
	@Column(name = "MANUAL")
	public Integer getManual()
	{
		return this.manual;
	}

	/**
	 * @param manual
	 *            null.
	 */
	public void setManual(Integer manual)
	{
		this.manual = manual;
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sendmailTemplate")
	public Set<SendmailAttachment> getSendmailAttachments()
	{
		return this.sendmailAttachments;
	}

	/**
	 * @param sendmailAttachments
	 *            .
	 */
	public void setSendmailAttachments(Set<SendmailAttachment> sendmailAttachments)
	{
		this.sendmailAttachments = sendmailAttachments;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sendmailTemplate")
	public Set<SendmailHistory> getSendmailHistories()
	{
		return this.sendmailHistories;
	}

	/**
	 * @param sendmailHistories
	 *            .
	 */
	public void setSendmailHistories(Set<SendmailHistory> sendmailHistories)
	{
		this.sendmailHistories = sendmailHistories;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sendmailTemplate")
	public Set<SendmailQueue> getSendmailQueues()
	{
		return this.sendmailQueues;
	}

	/**
	 * @param sendmailQueues
	 *            .
	 */
	public void setSendmailQueues(Set<SendmailQueue> sendmailQueues)
	{
		this.sendmailQueues = sendmailQueues;
	}
}
