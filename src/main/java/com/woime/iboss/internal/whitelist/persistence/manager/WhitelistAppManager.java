package com.woime.iboss.internal.whitelist.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.internal.whitelist.persistence.domain.WhitelistApp;

@Service
public class WhitelistAppManager extends HibernateEntityDao<WhitelistApp>
{
}
