package com.woime.iboss.meeting.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.meeting.persistence.domain.MeetingInfo;

@Service
public class MeetingInfoManager extends HibernateEntityDao<MeetingInfo>
{
}
