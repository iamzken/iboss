package com.woime.iboss.workcal.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.workcal.persistence.domain.WorkcalType;

@Service
public class WorkcalTypeManager extends HibernateEntityDao<WorkcalType>
{
}
