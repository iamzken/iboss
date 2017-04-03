package com.woime.iboss.performance.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.performance.persistence.domain.PerformanceInfo;

@Service
public class PerformanceInfoManager extends HibernateEntityDao<PerformanceInfo>
{
}
