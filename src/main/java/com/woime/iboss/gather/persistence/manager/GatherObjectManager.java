package com.woime.iboss.gather.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.gather.persistence.domain.GatherObject;

@Service
public class GatherObjectManager extends HibernateEntityDao<GatherObject> {

}