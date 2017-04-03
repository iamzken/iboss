package com.woime.iboss.bpm.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.bpm.persistence.domain.BpmConfUser;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class BpmConfUserManager extends HibernateEntityDao<BpmConfUser>
{
}
