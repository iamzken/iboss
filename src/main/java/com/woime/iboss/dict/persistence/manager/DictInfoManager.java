package com.woime.iboss.dict.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.dict.persistence.domain.DictInfo;

@Service
public class DictInfoManager extends HibernateEntityDao<DictInfo>
{
}
