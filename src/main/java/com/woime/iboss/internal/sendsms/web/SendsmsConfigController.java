package com.woime.iboss.internal.sendsms.web;

import java.io.PrintWriter;
import java.io.StringWriter;
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

import com.woime.iboss.core.export.Exportor;
import com.woime.iboss.core.export.TableModel;
import com.woime.iboss.core.mapper.BeanMapper;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.core.spring.MessageHelper;
import com.woime.iboss.internal.sendsms.persistence.domain.SendsmsConfig;
import com.woime.iboss.internal.sendsms.persistence.manager.SendsmsConfigManager;
import com.woime.iboss.internal.sendsms.support.SmsConnector;
import com.woime.iboss.internal.sendsms.support.SmsDTO;
import com.woime.iboss.internal.sendsms.support.SmsServerInfo;

@Controller
@RequestMapping("/sendsms")
public class SendsmsConfigController
{
	private SendsmsConfigManager sendsmsConfigManager;
	private SmsConnector smsConnector;
	private MessageHelper messageHelper;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();

	@RequestMapping("sendsms-config-list")
	public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model)
	{
		List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
		page = sendsmsConfigManager.pagedQuery(page, propertyFilters);
		model.addAttribute("page", page);

		return "sendsms/sendsms-config-list";
	}

	@RequestMapping("sendsms-config-input")
	public String input(@RequestParam(value = "id", required = false) Long id, Model model)
	{
		if (id != null)
		{
			SendsmsConfig sendsmsConfig = sendsmsConfigManager.get(id);
			model.addAttribute("model", sendsmsConfig);
		}

		return "sendsms/sendsms-config-input";
	}

	@RequestMapping("sendsms-config-save")
	public String save(@ModelAttribute SendsmsConfig sendsmsConfig, RedirectAttributes redirectAttributes)
	{
		Long id = sendsmsConfig.getId();
		SendsmsConfig dest = null;

		if (id != null)
		{
			dest = sendsmsConfigManager.get(id);
			beanMapper.copy(sendsmsConfig, dest);
		}
		else
		{
			dest = sendsmsConfig;
		}

		sendsmsConfigManager.save(dest);
		messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");

		return "redirect:/sendsms/sendsms-config-list.do";
	}

	@RequestMapping("sendsms-config-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem, RedirectAttributes redirectAttributes)
	{
		List<SendsmsConfig> sendsmsConfigs = sendsmsConfigManager.findByIds(selectedItem);
		sendsmsConfigManager.removeAll(sendsmsConfigs);
		messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

		return "redirect:/sendsms/sendsms-config-list.do";
	}

	@RequestMapping("sendsms-config-export")
	public void export(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
		page = sendsmsConfigManager.pagedQuery(page, propertyFilters);

		List<SendsmsConfig> sendsmsConfigs = (List<SendsmsConfig>) page.getResult();

		TableModel tableModel = new TableModel();
		tableModel.setName("sendsms config");
		tableModel.addHeaders("id", "name");
		tableModel.setData(sendsmsConfigs);
		exportor.export(request, response, tableModel);
	}

	@RequestMapping("sendsms-config-test")
	public String test(@RequestParam("id") Long id)
	{
		return "sendsms/sendsms-config-test";
	}

	@RequestMapping("sendsms-config-send")
	public String send(@RequestParam("id") Long id, @RequestParam("mobile") String mobile, @RequestParam("message") String message, Model model)
	{
		SendsmsConfig sendsmsConfig = sendsmsConfigManager.get(id);
		SmsServerInfo smsServerInfo = new SmsServerInfo();
		smsServerInfo.setHost(sendsmsConfig.getHost());
		smsServerInfo.setUsername(sendsmsConfig.getUsername());
		smsServerInfo.setPassword(sendsmsConfig.getPassword());
		smsServerInfo.setAppId(sendsmsConfig.getAppId());

		SmsDTO smsDto = new SmsDTO();
		smsDto.setMobile(mobile);
		smsDto.setMessage(message);

		SmsDTO resultSmsDto = smsConnector.send(smsDto, smsServerInfo);
		model.addAttribute("smsDto", smsDto);

		if (!resultSmsDto.isSuccess())
		{
			StringWriter writer = new StringWriter();
			resultSmsDto.getThrowable().printStackTrace(new PrintWriter(writer));
			model.addAttribute("exception", writer.toString());
		}

		return "sendsms/sendsms-config-send";
	}

	// ~ ======================================================================
	@Resource
	public void setSendsmsConfigManager(SendsmsConfigManager sendsmsConfigManager)
	{
		this.sendsmsConfigManager = sendsmsConfigManager;
	}

	@Resource
	public void setSmsConnector(SmsConnector smsConnector)
	{
		this.smsConnector = smsConnector;
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
}
