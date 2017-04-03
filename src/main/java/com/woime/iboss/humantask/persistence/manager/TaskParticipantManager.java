package com.woime.iboss.humantask.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.humantask.persistence.domain.TaskParticipant;

@Service
public class TaskParticipantManager extends HibernateEntityDao<TaskParticipant>
{
}
