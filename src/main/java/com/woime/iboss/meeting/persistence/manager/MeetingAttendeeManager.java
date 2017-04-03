package com.woime.iboss.meeting.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.meeting.persistence.domain.MeetingAttendee;

@Service
public class MeetingAttendeeManager extends HibernateEntityDao<MeetingAttendee>
{
}
