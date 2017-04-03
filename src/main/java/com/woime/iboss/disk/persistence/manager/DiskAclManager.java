package com.woime.iboss.disk.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.disk.persistence.domain.DiskAcl;

@Service
public class DiskAclManager extends HibernateEntityDao<DiskAcl>
{
}
