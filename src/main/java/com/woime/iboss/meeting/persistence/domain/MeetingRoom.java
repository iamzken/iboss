package com.woime.iboss.meeting.persistence.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * MeetingRoom .
 * 
 * @author devaeye
 */
@Entity
@Table(name = "MEETING_ROOM")
public class MeetingRoom implements java.io.Serializable
{
	private static final long serialVersionUID = 0L;

	/** null. */
	private Long id;

	/** null. */
	private String name;

	/** null. */
	private String mapRef;

	/** null. */
	private Integer num;

	/** null. */
	private String projector;

	/** null. */
	private String type;

	/** null. */
	private Date startTime;

	/** null. */
	private Date endTime;

	/** null. */
	private String building;

	/** null. */
	private String floor;

	/** null. */
	private String tenantId;

	/** . */
	private Set<MeetingInfo> meetingInfos = new HashSet<MeetingInfo>(0);

	public MeetingRoom()
	{
	}

	public MeetingRoom(Long id)
	{
		this.id = id;
	}

	public MeetingRoom(Long id, String name, String mapRef, Integer num, String projector, String type, Date startTime, Date endTime, String building, String floor, String tenantId,
			Set<MeetingInfo> meetingInfos)
	{
		this.id = id;
		this.name = name;
		this.mapRef = mapRef;
		this.num = num;
		this.projector = projector;
		this.type = type;
		this.startTime = startTime;
		this.endTime = endTime;
		this.building = building;
		this.floor = floor;
		this.tenantId = tenantId;
		this.meetingInfos = meetingInfos;
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
	@Column(name = "MAP_REF", length = 200)
	public String getMapRef()
	{
		return this.mapRef;
	}

	/**
	 * @param mapRef
	 *            null.
	 */
	public void setMapRef(String mapRef)
	{
		this.mapRef = mapRef;
	}

	/** @return null. */
	@Column(name = "NUM")
	public Integer getNum()
	{
		return this.num;
	}

	/**
	 * @param num
	 *            null.
	 */
	public void setNum(Integer num)
	{
		this.num = num;
	}

	/** @return null. */
	@Column(name = "PROJECTOR", length = 50)
	public String getProjector()
	{
		return this.projector;
	}

	/**
	 * @param projector
	 *            null.
	 */
	public void setProjector(String projector)
	{
		this.projector = projector;
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
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "START_TIME", length = 26)
	public Date getStartTime()
	{
		return this.startTime;
	}

	/**
	 * @param startTime
	 *            null.
	 */
	public void setStartTime(Date startTime)
	{
		this.startTime = startTime;
	}

	/** @return null. */
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "END_TIME", length = 26)
	public Date getEndTime()
	{
		return this.endTime;
	}

	/**
	 * @param endTime
	 *            null.
	 */
	public void setEndTime(Date endTime)
	{
		this.endTime = endTime;
	}

	/** @return null. */
	@Column(name = "BUILDING", length = 200)
	public String getBuilding()
	{
		return this.building;
	}

	/**
	 * @param building
	 *            null.
	 */
	public void setBuilding(String building)
	{
		this.building = building;
	}

	/** @return null. */
	@Column(name = "FLOOR", length = 50)
	public String getFloor()
	{
		return this.floor;
	}

	/**
	 * @param floor
	 *            null.
	 */
	public void setFloor(String floor)
	{
		this.floor = floor;
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

	/** @return . */
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "meetingRoom")
	public Set<MeetingInfo> getMeetingInfos()
	{
		return this.meetingInfos;
	}

	/**
	 * @param meetingInfos
	 *            .
	 */
	public void setMeetingInfos(Set<MeetingInfo> meetingInfos)
	{
		this.meetingInfos = meetingInfos;
	}
}
