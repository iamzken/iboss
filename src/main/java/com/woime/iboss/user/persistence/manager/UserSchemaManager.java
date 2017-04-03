package com.woime.iboss.user.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.user.persistence.domain.UserSchema;

@Service
public class UserSchemaManager extends HibernateEntityDao<UserSchema>
{
}
