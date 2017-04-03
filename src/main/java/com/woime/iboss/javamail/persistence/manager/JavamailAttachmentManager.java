package com.woime.iboss.javamail.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.javamail.persistence.domain.JavamailAttachment;

@Service
public class JavamailAttachmentManager extends HibernateEntityDao<JavamailAttachment>
{
}
