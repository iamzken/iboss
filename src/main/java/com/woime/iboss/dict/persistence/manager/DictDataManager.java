package com.woime.iboss.dict.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.dict.persistence.domain.DictData;

@Service
public class DictDataManager extends HibernateEntityDao<DictData>
{
}
