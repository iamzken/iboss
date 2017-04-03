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
 * SendmailConfig .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "SENDMAIL_CONFIG")
public class SendmailConfig implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String name;

	/** null. */
	private String host;

	/** null. */
	private String username;

	/** null. */
	private String password;

	/** null. */
	private Integer smtpAuth;

	/** null. */
	private Integer smtpStarttls;

	/** null. */
	private String status;

	/** null. */
	private String defaultFrom;

	/** null. */
	private String testMail;

	/** null. */
	private String tenantId;

	/** null. */
	private Integer port;

	/** null. */
	private Integer smtpSsl;

	/** . */
	private Set<SendmailQueue> sendmailQueues = new HashSet<SendmailQueue>(0);

	/** . */
	private Set<SendmailHistory> sendmailHistories = new HashSet<SendmailHistory>(0);

	public SendmailConfig()
	{
	}

	public SendmailConfig(Long id)
	{
		this.id = id;
	}

	public SendmailConfig(Long id, String name, String host, String username, String password, Integer smtpAuth, Integer smtpStarttls, String status, String defaultFrom, String testMail,
			String tenantId, Integer port, Integer smtpSsl, Set<SendmailQueue> sendmailQueues, Set<SendmailHistory> sendmailHistories)
	{
		this.id = id;
		this.name = name;
		this.host = host;
		this.username = username;
		this.password = password;
		this.smtpAuth = smtpAuth;
		this.smtpStarttls = smtpStarttls;
		this.status = status;
		this.defaultFrom = defaultFrom;
		this.testMail = testMail;
		this.tenantId = tenantId;
		this.port = port;
		this.smtpSsl = smtpSsl;
		this.sendmailQueues = sendmailQueues;
		this.sendmailHistories = sendmailHistories;
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
	@Column(name = "HOST", length = 200)
	public String getHost()
	{
		return this.host;
	}

	/**
	 * @param host
	 *            null.
	 */
	public void setHost(String host)
	{
		this.host = host;
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
	@Column(name = "SMTP_AUTH")
	public Integer getSmtpAuth()
	{
		return this.smtpAuth;
	}

	/**
	 * @param smtpAuth
	 *            null.
	 */
	public void setSmtpAuth(Integer smtpAuth)
	{
		this.smtpAuth = smtpAuth;
	}

	/** @return null. */
	@Column(name = "SMTP_STARTTLS")
	public Integer getSmtpStarttls()
	{
		return this.smtpStarttls;
	}

	/**
	 * @param smtpStarttls
	 *            null.
	 */
	public void setSmtpStarttls(Integer smtpStarttls)
	{
		this.smtpStarttls = smtpStarttls;
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
	@Column(name = "DEFAULT_FROM", length = 200)
	public String getDefaultFrom()
	{
		return this.defaultFrom;
	}

	/**
	 * @param defaultFrom
	 *            null.
	 */
	public void setDefaultFrom(String defaultFrom)
	{
		this.defaultFrom = defaultFrom;
	}

	/** @return null. */
	@Column(name = "TEST_MAIL", length = 200)
	public String getTestMail()
	{
		return this.testMail;
	}

	/**
	 * @param testMail
	 *            null.
	 */
	public void setTestMail(String testMail)
	{
		this.testMail = testMail;
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
	@Column(name = "PORT")
	public Integer getPort()
	{
		return this.port;
	}

	/**
	 * @param port
	 *            null.
	 */
	public void setPort(Integer port)
	{
		this.port = port;
	}

	/** @return null. */
	@Column(name = "SMTP_SSL")
	public Integer getSmtpSsl()
	{
		return this.smtpSsl;
	}

	/**
	 * @param smtpSsl
	 *            null.
	 */
	public void setSmtpSsl(Integer smtpSsl)
	{
		this.smtpSsl = smtpSsl;
	}

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sendmailConfig")
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "sendmailConfig")
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
}
