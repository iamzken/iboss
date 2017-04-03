package com.woime.iboss.attendance.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.attendance.persistence.domain.AttendanceInfo;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class AttendanceInfoManager extends HibernateEntityDao<AttendanceInfo>
{
}
