package com.woime.iboss.javamail.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.javamail.persistence.domain.JavamailMessage;

@Service
public class JavamailMessageManager extends HibernateEntityDao<JavamailMessage>
{
}
