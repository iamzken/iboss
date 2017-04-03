package com.woime.iboss.cms.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.cms.persistence.domain.CmsVersion;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class CmsVersionManager extends HibernateEntityDao<CmsVersion>
{
}
