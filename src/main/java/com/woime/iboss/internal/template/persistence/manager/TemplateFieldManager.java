package com.woime.iboss.internal.template.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.internal.template.persistence.domain.TemplateField;

@Service
public class TemplateFieldManager extends HibernateEntityDao<TemplateField>
{
}
