package com.woime.iboss.internal.sendmail.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.internal.sendmail.persistence.domain.SendmailQueue;

@Service
public class SendmailQueueManager extends HibernateEntityDao<SendmailQueue>
{
}
