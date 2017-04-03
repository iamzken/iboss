package com.woime.iboss.party.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.party.persistence.domain.PartyType;

@Service
public class PartyTypeManager extends HibernateEntityDao<PartyType>
{
}
