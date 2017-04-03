package com.woime.iboss.visitor.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.visitor.persistence.domain.VisitorInfo;

@Service
public class VisitorInfoManager extends HibernateEntityDao<VisitorInfo>
{
}
