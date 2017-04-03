package com.woime.iboss.workcal.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.workcal.persistence.domain.WorkcalPart;

@Service
public class WorkcalPartManager extends HibernateEntityDao<WorkcalPart>
{
}
