package com.woime.iboss.leave.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.leave.persistence.domain.LeaveInfo;

@Service
public class LeaveInfoManager extends HibernateEntityDao<LeaveInfo>
{
}
