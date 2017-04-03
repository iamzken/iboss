package com.woime.iboss.pim.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.pim.persistence.domain.PimSchedule;

@Service
public class PimScheduleManager extends HibernateEntityDao<PimSchedule>
{
}
