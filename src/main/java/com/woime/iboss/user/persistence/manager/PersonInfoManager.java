package com.woime.iboss.user.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.user.persistence.domain.PersonInfo;

@Service
public class PersonInfoManager extends HibernateEntityDao<PersonInfo>
{
}
