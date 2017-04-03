package com.woime.iboss.alarm.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.alarm.persistence.domain.AlarmCondition;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class AlarmConditionManager  extends HibernateEntityDao<AlarmCondition>  {

}
