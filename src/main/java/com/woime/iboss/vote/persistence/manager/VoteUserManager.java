package com.woime.iboss.vote.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.vote.persistence.domain.VoteUser;

@Service
public class VoteUserManager extends HibernateEntityDao<VoteUser>
{
}
