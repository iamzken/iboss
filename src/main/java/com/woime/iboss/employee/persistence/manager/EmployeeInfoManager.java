package com.woime.iboss.employee.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.employee.persistence.domain.EmployeeInfo;

@Service
public class EmployeeInfoManager extends HibernateEntityDao<EmployeeInfo>
{
}
