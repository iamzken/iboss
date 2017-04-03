package com.woime.iboss.vote.persistence.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * VoteUser .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "VOTE_USER")
public class VoteUser implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private VoteItem voteItem;

	/** null. */
	private String userId;

	/** null. */
	private Date createTime;

	/** null. */
	private String tenantId;

	public VoteUser()
	{
	}

	public VoteUser(Long id)
	{
		this.id = id;
	}

	public VoteUser(Long id, VoteItem voteItem, String userId, Date createTime, String tenantId)
	{
		this.id = id;
		this.voteItem = voteItem;
		this.userId = userId;
		this.createTime = createTime;
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
	@JoinColumn(name = "ITEM_ID")
	public VoteItem getVoteItem()
	{
		return this.voteItem;
	}

	/**
	 * @param voteItem
	 *            null.
	 */
	public void setVoteItem(VoteItem voteItem)
	{
		this.voteItem = voteItem;
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
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATE_TIME", length = 26)
	public Date getCreateTime()
	{
		return this.createTime;
	}

	/**
	 * @param createTime
	 *            null.
	 */
	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}

	/** @return null. */
	@Column(name = "TENANT_ID", length = 64)
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
