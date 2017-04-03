package com.woime.iboss.activity.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.activity.persistence.domain.ActivityUser;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class ActivityUserManager extends HibernateEntityDao<ActivityUser>
{
}
