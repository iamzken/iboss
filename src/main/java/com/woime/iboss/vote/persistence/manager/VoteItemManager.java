package com.woime.iboss.vote.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.vote.persistence.domain.VoteItem;

@Service
public class VoteItemManager extends HibernateEntityDao<VoteItem>
{
}
