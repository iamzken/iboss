package com.woime.iboss.alarm.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woime.iboss.alarm.persistence.domain.KPI;
import com.woime.iboss.alarm.persistence.manager.KPIManager;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;

/**
 * 绩效目标
 * 
 * @author 王国栋
 *
 */
@Transactional(readOnly = true)
@Service
public class KPIService
{
	@Autowired
	private KPIManager kpiManager;

	public Page paged(Page page, List<PropertyFilter> pfs)
	{
		if (pfs == null)
		{
			pfs = Collections.emptyList();
		}
		return kpiManager.pagedQuery(page, pfs);
	}

	public void add(KPI kpi)
	{
		if (kpi != null)
		{
			kpiManager.save(kpi);
		}
	}

	public void remove(Long id)
	{
		if (id != null)
		{
			kpiManager.removeById(id);
		}
	}

	public void update(KPI kpi)
	{
		if (kpi != null && kpi.getId() != null)
		{
			kpiManager.update(kpi);
		}
	}

	public KPIManager getKpiManager()
	{
		return kpiManager;
	}

	public void setKpiManager(KPIManager kpiManager)
	{
		this.kpiManager = kpiManager;
	}

}
