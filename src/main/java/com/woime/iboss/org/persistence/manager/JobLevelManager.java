package com.woime.iboss.org.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.org.persistence.domain.JobLevel;

@Service
public class JobLevelManager extends HibernateEntityDao<JobLevel>
{
}
