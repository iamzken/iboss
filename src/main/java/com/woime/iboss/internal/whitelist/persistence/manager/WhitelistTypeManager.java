package com.woime.iboss.internal.whitelist.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.internal.whitelist.persistence.domain.WhitelistType;

@Service
public class WhitelistTypeManager extends HibernateEntityDao<WhitelistType>
{
}
