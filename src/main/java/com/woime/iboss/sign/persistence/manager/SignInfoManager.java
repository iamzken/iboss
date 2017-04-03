package com.woime.iboss.sign.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.sign.persistence.domain.SignInfo;

@Service
public class SignInfoManager extends HibernateEntityDao<SignInfo>
{
}
