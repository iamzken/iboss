package com.woime.iboss.work.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.work.persistence.domain.WorkOrder;
import com.woime.iboss.work.persistence.manager.WorkOrderManager;

/**
 * @author Chen Yujian on 2017/2/26 14:44.
 */
@Service
@Transactional(readOnly = true)
public class WorkOrderService {

    @Autowired
    private WorkOrderManager workOrderManager;

    public Page page(Page page, List<PropertyFilter> propertyFilters) {
        return workOrderManager.pagedQuery(page, propertyFilters);
    }

    @Transactional(readOnly = false)
    public void add(WorkOrder workOrder) {
        workOrderManager.save(workOrder);
    }

    @Transactional(readOnly = false)
    public void changeStatus(Long id, Integer status) {
        WorkOrder workOrder = workOrderManager.get(id);
        workOrder.setStatus(status);
        workOrderManager.save(workOrder);
    }

}
