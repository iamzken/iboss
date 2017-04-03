package com.woime.iboss.internal.sendmail.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.internal.sendmail.persistence.domain.SendmailAttachment;

@Service
public class SendmailAttachmentManager extends HibernateEntityDao<SendmailAttachment>
{
}
