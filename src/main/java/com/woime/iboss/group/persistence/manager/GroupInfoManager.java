package com.woime.iboss.group.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.group.persistence.domain.GroupInfo;

@Service
public class GroupInfoManager extends HibernateEntityDao<GroupInfo>
{
}
