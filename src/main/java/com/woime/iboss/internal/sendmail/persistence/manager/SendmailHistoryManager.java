package com.woime.iboss.internal.sendmail.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.internal.sendmail.persistence.domain.SendmailHistory;

@Service
public class SendmailHistoryManager extends HibernateEntityDao<SendmailHistory>
{
}
