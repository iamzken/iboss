package com.woime.iboss.javamail.persistence.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * JavamailConfig .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "JAVAMAIL_CONFIG")
public class JavamailConfig implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String username;

	/** null. */
	private String password;

	/** null. */
	private String receiveType;

	/** null. */
	private String receiveHost;

	/** null. */
	private String receivePort;

	/** null. */
	private String receiveSecure;

	/** null. */
	private String sendType;

	/** null. */
	private String sendHost;

	/** null. */
	private String sendPort;

	/** null. */
	private String sendSecure;

	/** null. */
	private Integer priority;

	/** null. */
	private String userId;

	/** . */
	private Set<JavamailMessage> javamailMessages = new HashSet<JavamailMessage>(0);

	public JavamailConfig()
	{
	}

	public JavamailConfig(Long id)
	{
		this.id = id;
	}

	public JavamailConfig(Long id, String username, String password, String receiveType, String receiveHost, String receivePort, String receiveSecure, String sendType, String sendHost,
			String sendPort, String sendSecure, Integer priority, String userId, Set<JavamailMessage> javamailMessages)
	{
		this.id = id;
		this.username = username;
		this.password = password;
		this.receiveType = receiveType;
		this.receiveHost = receiveHost;
		this.receivePort = receivePort;
		this.receiveSecure = receiveSecure;
		this.sendType = sendType;
		this.sendHost = sendHost;
		this.sendPort = sendPort;
		this.sendSecure = sendSecure;
		this.priority = priority;
		this.userId = userId;
		this.javamailMessages = javamailMessages;
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
	@Column(name = "USERNAME", length = 200)
	public String getUsername()
	{
		return this.username;
	}

	/**
	 * @param username
	 *            null.
	 */
	public void setUsername(String username)
	{
		this.username = username;
	}

	/** @return null. */
	@Column(name = "PASSWORD", length = 200)
	public String getPassword()
	{
		return this.password;
	}

	/**
	 * @param password
	 *            null.
	 */
	public void setPassword(String password)
	{
		this.password = password;
	}

	/** @return null. */
	@Column(name = "RECEIVE_TYPE", length = 50)
	public String getReceiveType()
	{
		return this.receiveType;
	}

	/**
	 * @param receiveType
	 *            null.
	 */
	public void setReceiveType(String receiveType)
	{
		this.receiveType = receiveType;
	}

	/** @return null. */
	@Column(name = "RECEIVE_HOST", length = 200)
	public String getReceiveHost()
	{
		return this.receiveHost;
	}

	/**
	 * @param receiveHost
	 *            null.
	 */
	public void setReceiveHost(String receiveHost)
	{
		this.receiveHost = receiveHost;
	}

	/** @return null. */
	@Column(name = "RECEIVE_PORT", length = 10)
	public String getReceivePort()
	{
		return this.receivePort;
	}

	/**
	 * @param receivePort
	 *            null.
	 */
	public void setReceivePort(String receivePort)
	{
		this.receivePort = receivePort;
	}

	/** @return null. */
	@Column(name = "RECEIVE_SECURE", length = 50)
	public String getReceiveSecure()
	{
		return this.receiveSecure;
	}

	/**
	 * @param receiveSecure
	 *            null.
	 */
	public void setReceiveSecure(String receiveSecure)
	{
		this.receiveSecure = receiveSecure;
	}

	/** @return null. */
	@Column(name = "SEND_TYPE", length = 50)
	public String getSendType()
	{
		return this.sendType;
	}

	/**
	 * @param sendType
	 *            null.
	 */
	public void setSendType(String sendType)
	{
		this.sendType = sendType;
	}

	/** @return null. */
	@Column(name = "SEND_HOST", length = 50)
	public String getSendHost()
	{
		return this.sendHost;
	}

	/**
	 * @param sendHost
	 *            null.
	 */
	public void setSendHost(String sendHost)
	{
		this.sendHost = sendHost;
	}

	/** @return null. */
	@Column(name = "SEND_PORT", length = 10)
	public String getSendPort()
	{
		return this.sendPort;
	}

	/**
	 * @param sendPort
	 *            null.
	 */
	public void setSendPort(String sendPort)
	{
		this.sendPort = sendPort;
	}

	/** @return null. */
	@Column(name = "SEND_SECURE", length = 50)
	public String getSendSecure()
	{
		return this.sendSecure;
	}

	/**
	 * @param sendSecure
	 *            null.
	 */
	public void setSendSecure(String sendSecure)
	{
		this.sendSecure = sendSecure;
	}

	/** @return null. */
	@Column(name = "PRIORITY")
	public Integer getPriority()
	{
		return this.priority;
	}

	/**
	 * @param priority
	 *            null.
	 */
	public void setPriority(Integer priority)
	{
		this.priority = priority;
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "javamailConfig")
	public Set<JavamailMessage> getJavamailMessages()
	{
		return this.javamailMessages;
	}

	/**
	 * @param javamailMessages
	 *            .
	 */
	public void setJavamailMessages(Set<JavamailMessage> javamailMessages)
	{
		this.javamailMessages = javamailMessages;
	}
}