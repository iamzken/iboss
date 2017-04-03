package com.woime.iboss.cms.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.cms.persistence.domain.CmsComment;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class CmsCommentManager extends HibernateEntityDao<CmsComment>
{
}
