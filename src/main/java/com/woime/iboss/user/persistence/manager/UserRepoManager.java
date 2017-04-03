package com.woime.iboss.user.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.user.persistence.domain.UserRepo;

@Service
public class UserRepoManager extends HibernateEntityDao<UserRepo>
{
}
