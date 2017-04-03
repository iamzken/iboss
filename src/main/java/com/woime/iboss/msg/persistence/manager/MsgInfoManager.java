package com.woime.iboss.msg.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.msg.persistence.domain.MsgInfo;

@Service
public class MsgInfoManager extends HibernateEntityDao<MsgInfo>
{
}
