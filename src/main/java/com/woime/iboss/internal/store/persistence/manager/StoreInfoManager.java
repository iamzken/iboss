package com.woime.iboss.internal.store.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.internal.store.persistence.domain.StoreInfo;

@Service
public class StoreInfoManager extends HibernateEntityDao<StoreInfo>
{
}
