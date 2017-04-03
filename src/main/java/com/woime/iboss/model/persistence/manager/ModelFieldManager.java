package com.woime.iboss.model.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.model.persistence.domain.ModelField;

@Service
public class ModelFieldManager extends HibernateEntityDao<ModelField>
{
}
