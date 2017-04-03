package com.woime.iboss.internal.sendsms.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.internal.sendsms.persistence.domain.SendsmsHistory;

@Service
public class SendsmsHistoryManager extends HibernateEntityDao<SendsmsHistory>
{
}
