package com.woime.iboss.auth.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.auth.persistence.domain.UserStatus;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class UserStatusManager extends HibernateEntityDao<UserStatus>
{
}
