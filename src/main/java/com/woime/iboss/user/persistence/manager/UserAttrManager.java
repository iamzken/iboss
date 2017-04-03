package com.woime.iboss.user.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.user.persistence.domain.UserAttr;

@Service
public class UserAttrManager extends HibernateEntityDao<UserAttr>
{
}
