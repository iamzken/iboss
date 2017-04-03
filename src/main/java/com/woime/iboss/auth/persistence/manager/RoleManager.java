package com.woime.iboss.auth.persistence.manager;

import com.woime.iboss.auth.persistence.domain.Role;
import com.woime.iboss.core.hibernate.HibernateEntityDao;
import org.springframework.stereotype.Service;

@Service
public class RoleManager extends HibernateEntityDao<Role> {}
