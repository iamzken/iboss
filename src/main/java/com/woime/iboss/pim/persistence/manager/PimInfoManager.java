package com.woime.iboss.pim.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.pim.persistence.domain.PimInfo;

@Service
public class PimInfoManager extends HibernateEntityDao<PimInfo>
{
}
