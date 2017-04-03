package com.woime.iboss.internal.template.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.internal.template.persistence.domain.TemplateInfo;

@Service
public class TemplateInfoManager extends HibernateEntityDao<TemplateInfo>
{
}
