package com.woime.iboss.portal.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.portal.persistence.domain.PortalInfo;

@Service
public class PortalInfoManager extends HibernateEntityDao<PortalInfo>
{
}
