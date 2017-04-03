package com.woime.iboss.contract.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.contract.persistence.domain.ContractInfo;
import com.woime.iboss.core.hibernate.HibernateEntityDao;

@Service
public class ContractInfoManager extends HibernateEntityDao<ContractInfo>
{
}
