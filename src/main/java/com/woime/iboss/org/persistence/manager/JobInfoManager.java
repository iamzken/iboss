package com.woime.iboss.org.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.org.persistence.domain.JobInfo;

@Service
public class JobInfoManager extends HibernateEntityDao<JobInfo>
{
}
