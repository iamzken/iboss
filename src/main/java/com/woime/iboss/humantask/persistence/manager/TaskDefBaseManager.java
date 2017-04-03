package com.woime.iboss.humantask.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.humantask.persistence.domain.TaskDefBase;

@Service
public class TaskDefBaseManager extends HibernateEntityDao<TaskDefBase>
{
}
