package com.woime.iboss.party.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.party.persistence.domain.PartyEntity;

@Service
public class PartyEntityManager extends HibernateEntityDao<PartyEntity>
{
}
