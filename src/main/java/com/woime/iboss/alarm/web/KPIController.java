package com.woime.iboss.alarm.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.woime.iboss.alarm.persistence.domain.KPI;
import com.woime.iboss.alarm.service.KPIService;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;

/**
 * 绩效目标
 * 
 * @author 王国栋
 *
 */
@Controller
@RequestMapping("kpi")
public class KPIController
{
	@Autowired
	private KPIService kpiService;

	/**
	 * 分页查询绩效页面的列表
	 * 
	 * @param page
	 * @param pfs
	 * @return
	 */
	@RequestMapping("page")
	public @ResponseBody Page page(Page page, List<PropertyFilter> pfs)
	{
		return kpiService.paged(page, pfs);
	}

	/**
	 * 添加kpi
	 * 
	 * @param kpi
	 * @return
	 */
	@RequestMapping("add")
	public @ResponseBody Map<String, Object> add(KPI kpi)
	{
		kpiService.add(kpi);
		Map<String, Object> result = Maps.newHashMap();
		result.put("result", true);
		result.put("message", "添加绩效目标成功！");
		return result;
	}

	/**
	 * 移除kpi
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("remove")
	public Map<String, Object> remove(Long id)
	{
		kpiService.remove(id);
		Map<String, Object> result = Maps.newHashMap();
		result.put("result", true);
		result.put("message", "移除绩效目标成功！");
		return result;
	}
	
	/**
	 * 移除kpi
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("update")
	public Map<String, Object> update(KPI kpi)
	{
		kpiService.update(kpi);
		Map<String, Object> result = Maps.newHashMap();
		result.put("result", true);
		result.put("message", "更新绩效目标成功！");
		return result;
	}
}
