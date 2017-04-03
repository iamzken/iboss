package com.woime.iboss.workcal.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.workcal.persistence.domain.WorkcalRule;

@Service
public class WorkcalRuleManager extends HibernateEntityDao<WorkcalRule>
{
}
