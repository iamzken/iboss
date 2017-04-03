package com.woime.iboss.internal.delegate.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.internal.delegate.persistence.domain.DelegateInfo;

@Service
public class DelegateInfoManager extends HibernateEntityDao<DelegateInfo>
{
}
