package com.woime.iboss.disk.persistence.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * DiskAcl .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "DISK_ACL")
public class DiskAcl implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private DiskShare diskShare;

	/** null. */
	private String type;

	/** null. */
	private String ref;

	public DiskAcl()
	{
	}

	public DiskAcl(Long id)
	{
		this.id = id;
	}

	public DiskAcl(Long id, DiskShare diskShare, String type, String ref)
	{
		this.id = id;
		this.diskShare = diskShare;
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
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "SHARE_ID")
	public DiskShare getDiskShare()
	{
		return this.diskShare;
	}

	/**
	 * @param diskShare
	 *            null.
	 */
	public void setDiskShare(DiskShare diskShare)
	{
		this.diskShare = diskShare;
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
