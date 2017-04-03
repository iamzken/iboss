package com.woime.iboss.plm.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.plm.persistence.domain.PlmConfig;

@Service
public class PlmConfigManager extends HibernateEntityDao<PlmConfig>
{
}
