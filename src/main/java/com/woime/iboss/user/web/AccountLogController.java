package com.woime.iboss.user.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.woime.iboss.core.export.Exportor;
import com.woime.iboss.core.mapper.BeanMapper;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.core.spring.MessageHelper;
import com.woime.iboss.user.persistence.manager.AccountLogManager;

@Controller
@RequestMapping("user")
public class AccountLogController
{
	private AccountLogManager accountLogManager;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private MessageHelper messageHelper;

	@RequestMapping("account-log-list")
	public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model)
	{
		page.setDefaultOrder("logTime", "DESC");

		List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
		page = accountLogManager.pagedQuery(page, propertyFilters);

		model.addAttribute("page", page);

		return "user/account-log-list";
	}

	// ~ ======================================================================
	@Resource
	public void setAccountLogManager(AccountLogManager accountLogManager)
	{
		this.accountLogManager = accountLogManager;
	}

	@Resource
	public void setExportor(Exportor exportor)
	{
		this.exportor = exportor;
	}

	@Resource
	public void setMessageHelper(MessageHelper messageHelper)
	{
		this.messageHelper = messageHelper;
	}
}
