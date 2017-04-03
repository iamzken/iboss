package com.woime.iboss.form.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.form.persistence.domain.FormTemplate;

@Service
public class FormTemplateManager extends HibernateEntityDao<FormTemplate>
{
}
