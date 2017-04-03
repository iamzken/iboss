package com.woime.iboss.audit.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.audit.persistence.domain.AuditBase;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class AuditBaseManager extends HibernateEntityDao<AuditBase>
{
}
