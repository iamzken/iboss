package com.woime.iboss.work.web;

import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import com.woime.iboss.work.persistence.manager.WorkOrderManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.work.constant.WorkOrderPriority;
import com.woime.iboss.work.constant.WorkOrderSource;
import com.woime.iboss.work.constant.WorkOrderStatus;
import com.woime.iboss.work.constant.WorkOrderSystem;
import com.woime.iboss.work.constant.WorkOrderType;
import com.woime.iboss.work.persistence.domain.WorkOrder;
import com.woime.iboss.work.service.WorkOrderService;

@Controller
@RequestMapping("work")
public class WorkOrderController
{
	private static Logger logger = LoggerFactory.getLogger(WorkOrderController.class);

	@Autowired
	private WorkOrderService workOrderService;

	@Resource
	private WorkOrderManager workOrderManager;

	@RequestMapping("order")
	public String index(Model model) {
		model.addAttribute("priorities", getAllPriorities());
		model.addAttribute("sources", getAllSources());
		model.addAttribute("statuses", getAllStatus());
		model.addAttribute("systems", getAllSystems());
		model.addAttribute("types", getAllTypes());
		return "work/order";
	}

	@RequestMapping("order/page")
	@ResponseBody
	public Object page(Page page) {
		return workOrderService.page(page, PropertyFilter.buildFromMap(page.getFilters()));
	}

	@RequestMapping("order/add")
	@ResponseBody
	public Object add(WorkOrder workOrder) {
		Map<String, Object> result = Maps.newHashMap();

		try {
			workOrderService.add(workOrder);
			result.put("result", true);
			result.put("message", "添加工单成功！");
		} catch (Exception e) {
			result.put("result", false);
			result.put("message", e.getMessage());
		}
		return result;
	}

	@RequestMapping("order/status/change")
	@ResponseBody
	public Object changeStatus(Long id, Integer status) {
		Map<String, Object> result = Maps.newHashMap();
		try {
			workOrderService.changeStatus(id, status);
			result.put("result", true);
			result.put("message", "操作成功！");
		} catch (Exception e) {
			result.put("result", false);
			result.put("message", e.getMessage());
		}
		return result;
	}

	@RequestMapping("order/get")
	@ResponseBody
	public Object get(Long id) {
		return workOrderManager.get(id);
	}

	@RequestMapping("order/status/all")
	@ResponseBody
	public Object getAllStatus() {
		WorkOrderStatus[] array = WorkOrderStatus.values();
		Map<Integer, Object> result = Maps.newHashMap();
		for(WorkOrderStatus s : array) {
			result.put(s.getCode(), s.getDesc());
		}
		return result;
	}

	@RequestMapping("order/type/all")
	@ResponseBody
	public Object getAllTypes() {
		WorkOrderType[] array = WorkOrderType.values();
		Map<Integer, Object> result = Maps.newHashMap();
		for(WorkOrderType t : array) {
			result.put(t.getCode(), t.getDesc());
		}
		return result;
	}

	@RequestMapping("order/priority/all")
	@ResponseBody
	public Object getAllPriorities() {
		WorkOrderPriority[] array = WorkOrderPriority.values();
		Map<Integer, Object> result = Maps.newHashMap();
		for(WorkOrderPriority t : array) {
			result.put(t.getCode(), t.getDesc());
		}
		return result;
	}

	@RequestMapping("order/source/all")
	@ResponseBody
	public Object getAllSources() {
		WorkOrderSource[] array = WorkOrderSource.values();
		Map<Integer, Object> result = Maps.newHashMap();
		for(WorkOrderSource t : array) {
			result.put(t.getCode(), t.getDesc());
		}
		return result;
	}

	@RequestMapping("order/system/all")
	@ResponseBody
	public Object getAllSystems() {
		WorkOrderSystem[] array = WorkOrderSystem.values();
		Map<Integer, Object> result = Maps.newHashMap();
		for(WorkOrderSystem t : array) {
			result.put(t.getCode(), t.getDesc());
		}
		return result;
	}
}
