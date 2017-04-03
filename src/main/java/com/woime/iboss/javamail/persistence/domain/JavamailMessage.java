package com.woime.iboss.javamail.persistence.domain;

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * JavamailMessage .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "JAVAMAIL_MESSAGE")
public class JavamailMessage implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private JavamailConfig javamailConfig;

	/** null. */
	private String sender;

	/** null. */
	private String receiver;

	/** null. */
	private String cc;

	/** null. */
	private String bcc;

	/** null. */
	private String subject;

	/** null. */
	private String content;

	/** null. */
	private Date sendTime;

	/** null. */
	private Date receiveTime;

	/** null. */
	private String status;

	/** null. */
	private String folder;

	/** null. */
	private String messageId;

	/** null. */
	private Integer messageNumber;

	/** . */
	private Set<JavamailAttachment> javamailAttachments = new HashSet<JavamailAttachment>(0);

	public JavamailMessage()
	{
	}

	public JavamailMessage(Long id)
	{
		this.id = id;
	}

	public JavamailMessage(Long id, JavamailConfig javamailConfig, String sender, String receiver, String cc, String bcc, String subject, String content, Date sendTime, Date receiveTime,
			String status, String folder, String messageId, Integer messageNumber, Set<JavamailAttachment> javamailAttachments)
	{
		this.id = id;
		this.javamailConfig = javamailConfig;
		this.sender = sender;
		this.receiver = receiver;
		this.cc = cc;
		this.bcc = bcc;
		this.subject = subject;
		this.content = content;
		this.sendTime = sendTime;
		this.receiveTime = receiveTime;
		this.status = status;
		this.folder = folder;
		this.messageId = messageId;
		this.messageNumber = messageNumber;
		this.javamailAttachments = javamailAttachments;
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
	@JoinColumn(name = "CONFIG_ID")
	public JavamailConfig getJavamailConfig()
	{
		return this.javamailConfig;
	}

	/**
	 * @param javamailConfig
	 *            null.
	 */
	public void setJavamailConfig(JavamailConfig javamailConfig)
	{
		this.javamailConfig = javamailConfig;
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
	@Column(name = "SUBJECT", length = 65535)
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
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "SEND_TIME", length = 26)
	public Date getSendTime()
	{
		return this.sendTime;
	}

	/**
	 * @param sendTime
	 *            null.
	 */
	public void setSendTime(Date sendTime)
	{
		this.sendTime = sendTime;
	}

	/** @return null. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "RECEIVE_TIME", length = 26)
	public Date getReceiveTime()
	{
		return this.receiveTime;
	}

	/**
	 * @param receiveTime
	 *            null.
	 */
	public void setReceiveTime(Date receiveTime)
	{
		this.receiveTime = receiveTime;
	}

	/** @return null. */
	@Column(name = "STATUS", length = 50)
	public String getStatus()
	{
		return this.status;
	}

	/**
	 * @param status
	 *            null.
	 */
	public void setStatus(String status)
	{
		this.status = status;
	}

	/** @return null. */
	@Column(name = "FOLDER", length = 200)
	public String getFolder()
	{
		return this.folder;
	}

	/**
	 * @param folder
	 *            null.
	 */
	public void setFolder(String folder)
	{
		this.folder = folder;
	}

	/** @return null. */
	@Column(name = "MESSAGE_ID", length = 200)
	public String getMessageId()
	{
		return this.messageId;
	}

	/**
	 * @param messageId
	 *            null.
	 */
	public void setMessageId(String messageId)
	{
		this.messageId = messageId;
	}

	/** @return null. */
	@Column(name = "MESSAGE_NUMBER")
	public Integer getMessageNumber()
	{
		return this.messageNumber;
	}

	/**
	 * @param messageNumber
	 *            null.
	 */
	public void setMessageNumber(Integer messageNumber)
	{
		this.messageNumber = messageNumber;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "javamailMessage")
	public Set<JavamailAttachment> getJavamailAttachments()
	{
		return this.javamailAttachments;
	}

	/**
	 * @param javamailAttachments
	 *            .
	 */
	public void setJavamailAttachments(Set<JavamailAttachment> javamailAttachments)
	{
		this.javamailAttachments = javamailAttachments;
	}
}
