package com.woime.iboss.alarm.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.alarm.persistence.domain.AlarmTarget;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class AlarmTargetManager extends HibernateEntityDao<AlarmTarget>
{

}
