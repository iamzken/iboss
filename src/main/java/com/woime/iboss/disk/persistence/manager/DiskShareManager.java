package com.woime.iboss.disk.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.disk.persistence.domain.DiskShare;

@Service
public class DiskShareManager extends HibernateEntityDao<DiskShare>
{
}
