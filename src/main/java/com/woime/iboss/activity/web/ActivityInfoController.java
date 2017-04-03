package com.woime.iboss.activity.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woime.iboss.activity.persistence.domain.ActivityInfo;
import com.woime.iboss.activity.persistence.manager.ActivityInfoManager;
import com.woime.iboss.api.tenant.TenantHolder;
import com.woime.iboss.core.export.Exportor;
import com.woime.iboss.core.export.TableModel;
import com.woime.iboss.core.mapper.BeanMapper;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.core.spring.MessageHelper;

@Controller
@RequestMapping("activity")
public class ActivityInfoController
{
	private ActivityInfoManager activityInfoManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
//	private UserConnector userConnector;
	private MessageHelper messageHelper;
	private TenantHolder tenantHolder;

	@RequestMapping("activity-info-list")
	public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model)
	{
		String tenantId = tenantHolder.getTenantId();
		List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
		propertyFilters.add(new PropertyFilter("EQS_tenantId", tenantId));
		page = activityInfoManager.pagedQuery(page, propertyFilters);

		model.addAttribute("page", page);

		return "activity/activity-info-list";
	}

	@RequestMapping("activity-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id, Model model)
	{
		if (id != null)
		{
			ActivityInfo activityInfo = activityInfoManager.get(id);
			model.addAttribute("model", activityInfo);
		}

		return "activity/activity-info-input";
	}

	@RequestMapping("activity-info-save")
	public String save(@ModelAttribute ActivityInfo activityInfo, @RequestParam Map<String, Object> parameterMap, RedirectAttributes redirectAttributes)
	{
		String tenantId = tenantHolder.getTenantId();
		ActivityInfo dest = null;

		Long id = activityInfo.getId();

		if (id != null)
		{
			dest = activityInfoManager.get(id);
			beanMapper.copy(activityInfo, dest);
		}
		else
		{
			dest = activityInfo;
			dest.setTenantId(tenantId);
		}

		activityInfoManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");

		return "redirect:/activity/activity-info-list.do";
	}

	@RequestMapping("activity-info-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem, RedirectAttributes redirectAttributes)
	{
		List<ActivityInfo> activityInfos = activityInfoManager.findByIds(selectedItem);

		activityInfoManager.removeAll(activityInfos);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

		return "redirect:/activity/activity-info-list.do";
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("activity-info-export")
	public void export(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String tenantId = tenantHolder.getTenantId();
		List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
		propertyFilters.add(new PropertyFilter("EQS_tenantId", tenantId));
		page = activityInfoManager.pagedQuery(page, propertyFilters);

		List<ActivityInfo> activityInfos = (List<ActivityInfo>) page.getResult();

		TableModel tableModel = new TableModel();
		tableModel.setName("activity info");
		tableModel.addHeaders("id", "name");
		tableModel.setData(activityInfos);
		exportor.export(request, response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setActivityInfoManager(ActivityInfoManager activityInfoManager)
	{
		this.activityInfoManager = activityInfoManager;
	}

	@Resource
	public void setExportor(Exportor exportor)
	{
		this.exportor = exportor;
	}

//	@Resource
//	public void setUserConnector(UserConnector userConnector)
//	{
//		this.userConnector = userConnector;
//	}

	@Resource
	public void setMessageHelper(MessageHelper messageHelper)
	{
		this.messageHelper = messageHelper;
	}

	@Resource
	public void setTenantHolder(TenantHolder tenantHolder)
	{
		this.tenantHolder = tenantHolder;
	}
}
