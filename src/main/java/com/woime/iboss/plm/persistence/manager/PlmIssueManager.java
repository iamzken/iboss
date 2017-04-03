package com.woime.iboss.plm.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.plm.persistence.domain.PlmIssue;

@Service
public class PlmIssueManager extends HibernateEntityDao<PlmIssue>
{
}
