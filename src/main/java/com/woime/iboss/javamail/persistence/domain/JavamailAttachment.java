package com.woime.iboss.javamail.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * JavamailAttachment .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "JAVAMAIL_ATTACHMENT")
public class JavamailAttachment implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private JavamailMessage javamailMessage;

	/** null. */
	private String name;

	/** null. */
	private String ref;

	/** null. */
	private String type;

	public JavamailAttachment()
	{
	}

	public JavamailAttachment(Long id)
	{
		this.id = id;
	}

	public JavamailAttachment(Long id, JavamailMessage javamailMessage, String name, String ref, String type)
	{
		this.id = id;
		this.javamailMessage = javamailMessage;
		this.name = name;
		this.ref = ref;
		this.type = type;
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
	@JoinColumn(name = "MESSAGE_ID")
	public JavamailMessage getJavamailMessage()
	{
		return this.javamailMessage;
	}

	/**
	 * @param javamailMessage
	 *            null.
	 */
	public void setJavamailMessage(JavamailMessage javamailMessage)
	{
		this.javamailMessage = javamailMessage;
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
	@Column(name = "REF", length = 200)
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
}
