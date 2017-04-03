package com.woime.iboss.alarm.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.alarm.persistence.domain.AlarmParameter;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class AlarmParameterManager extends HibernateEntityDao<AlarmParameter> {


}
