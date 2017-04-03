package com.woime.iboss.org.web;

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

import com.woime.iboss.api.tenant.TenantHolder;
import com.woime.iboss.core.export.Exportor;
import com.woime.iboss.core.export.TableModel;
import com.woime.iboss.core.mapper.BeanMapper;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.core.spring.MessageHelper;
import com.woime.iboss.org.persistence.domain.OrgCompany;
import com.woime.iboss.org.persistence.manager.OrgCompanyManager;
import com.woime.iboss.party.service.PartyService;

@Controller
@RequestMapping("org")
public class OrgCompanyController
{
	private OrgCompanyManager orgCompanyManager;
	private MessageHelper messageHelper;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private PartyService partyService;
	private TenantHolder tenantHolder;

	@RequestMapping("org-company-list")
	public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model)
	{
		String tenantId = tenantHolder.getTenantId();
		List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
		propertyFilters.add(new PropertyFilter("EQS_tenantId", tenantId));
		page = orgCompanyManager.pagedQuery(page, propertyFilters);
		model.addAttribute("page", page);

		return "org/org-company-list";
	}

	@RequestMapping("org-company-input")
	public String input(@RequestParam(value = "id", required = false) Long id, Model model)
	{
		if (id != null)
		{
			OrgCompany orgCompany = orgCompanyManager.get(id);
			model.addAttribute("model", orgCompany);
		}

		return "org/org-company-input";
	}

	@RequestMapping("org-company-save")
	public String save(@ModelAttribute OrgCompany orgCompany, @RequestParam Map<String, Object> parameterMap, RedirectAttributes redirectAttributes)
	{
		String tenantId = tenantHolder.getTenantId();
		OrgCompany dest = null;
		Long id = orgCompany.getId();

		if (id != null)
		{
			dest = orgCompanyManager.get(id);
			beanMapper.copy(orgCompany, dest);
		}
		else
		{
			dest = orgCompany;
			dest.setTenantId(tenantId);
		}

		orgCompanyManager.save(dest);

		if (id == null)
		{
			// TODO: sync party
            // TODO: 报错，所以注释掉了
			//partyService.insertPartyEntity(Long.toString(dest.getId()), "company", dest.getName());
		}
		else
		{
			// TODO: sync party
            // TODO: 报错，所以注释掉了
			//partyService.updatePartyEntity(Long.toString(dest.getId()), "company", dest.getName());
		}

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");

		return "redirect:/org/org-company-list.do#config&org";
	}

	@RequestMapping("org-company-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem, RedirectAttributes redirectAttributes)
	{
		List<OrgCompany> orgCompanies = orgCompanyManager.findByIds(selectedItem);

		for (OrgCompany orgCompany : orgCompanies)
		{
			orgCompanyManager.remove(orgCompany);
			// TODO: 报错，所以注释掉了
			//partyService.removePartyEntity(Long.toString(orgCompany.getId()), "company");
		}

		messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

		return "redirect:/org/org-company-list.do#config&org";
	}

	@RequestMapping("org-company-export")
	public void export(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		String tenantId = tenantHolder.getTenantId();
		List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
		propertyFilters.add(new PropertyFilter("EQS_tenantId", tenantId));
		page = orgCompanyManager.pagedQuery(page, propertyFilters);

		List<OrgCompany> orgCompanies = (List<OrgCompany>) page.getResult();

		TableModel tableModel = new TableModel();
		tableModel.setName("org");
		tableModel.addHeaders("id", "name", "status", "description");
		tableModel.setData(orgCompanies);
		exportor.export(request, response, tableModel);
	}

	// ~ ======================================================================
	@Resource
	public void setOrgCompanyManager(OrgCompanyManager orgCompanyManager)
	{
		this.orgCompanyManager = orgCompanyManager;
	}

	@Resource
	public void setMessageHelper(MessageHelper messageHelper)
	{
		this.messageHelper = messageHelper;
	}

	@Resource
	public void setExportor(Exportor exportor)
	{
		this.exportor = exportor;
	}

	@Resource
	public void setPartyService(PartyService partyService)
	{
		this.partyService = partyService;
	}

	@Resource
	public void setTenantHolder(TenantHolder tenantHolder)
	{
		this.tenantHolder = tenantHolder;
	}
}
