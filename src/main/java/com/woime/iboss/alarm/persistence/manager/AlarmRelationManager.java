package com.woime.iboss.alarm.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.alarm.persistence.domain.AlarmTableRelation;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class AlarmRelationManager  extends HibernateEntityDao<AlarmTableRelation>  {

}
