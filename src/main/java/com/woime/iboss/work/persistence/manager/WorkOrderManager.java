package com.woime.iboss.work.persistence.manager;

import org.springframework.stereotype.Service;

import com.woime.iboss.core.hibernate.HibernateEntityDao;
import com.woime.iboss.work.persistence.domain.WorkOrder;

@Service
public class WorkOrderManager extends HibernateEntityDao<WorkOrder> {
}