package com.woime.iboss.org.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.org.persistence.domain.JobGrade;

@Service
public class JobGradeManager extends HibernateEntityDao<JobGrade>
{
}
