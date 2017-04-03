package com.woime.iboss.internal.sendsms.web;

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
import com.woime.iboss.internal.sendsms.persistence.domain.SendsmsHistory;
import com.woime.iboss.internal.sendsms.persistence.domain.SendsmsQueue;
import com.woime.iboss.internal.sendsms.persistence.manager.SendsmsHistoryManager;
import com.woime.iboss.internal.sendsms.persistence.manager.SendsmsQueueManager;

@Controller
@RequestMapping("/sendsms")
public class SendsmsHistoryController
{
	private SendsmsHistoryManager sendsmsHistoryManager;
	private SendsmsQueueManager sendsmsQueueManager;
	private MessageHelper messageHelper;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();

	@RequestMapping("sendsms-history-list")
	public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model)
	{
		page.setDefaultOrder("createTime", Page.DESC);

		List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
		page = sendsmsHistoryManager.pagedQuery(page, propertyFilters);
		model.addAttribute("page", page);

		return "sendsms/sendsms-history-list";
	}

	@RequestMapping("sendsms-history-input")
	public String input(@RequestParam(value = "id", required = false) Long id, Model model)
	{
		if (id != null)
		{
			SendsmsHistory sendsmsHistory = sendsmsHistoryManager.get(id);
			model.addAttribute("model", sendsmsHistory);
		}

		return "sendsms/sendsms-history-input";
	}

	@RequestMapping("sendsms-history-save")
	public String save(@ModelAttribute SendsmsHistory sendsmsHistory, RedirectAttributes redirectAttributes)
	{
		Long id = sendsmsHistory.getId();
		SendsmsHistory dest = null;

		if (id != null)
		{
			dest = sendsmsHistoryManager.get(id);
			beanMapper.copy(sendsmsHistory, dest);
		}
		else
		{
			dest = sendsmsHistory;
		}

		sendsmsHistoryManager.save(dest);
		messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");

		return "redirect:/sendsms/sendsms-history-list.do";
	}

	@RequestMapping("sendsms-history-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem, RedirectAttributes redirectAttributes)
	{
		List<SendsmsHistory> sendsmsHistorys = sendsmsHistoryManager.findByIds(selectedItem);
		sendsmsHistoryManager.removeAll(sendsmsHistorys);
		messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

		return "redirect:/sendsms/sendsms-history-list.do";
	}

	@RequestMapping("sendsms-history-export")
	public void export(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		List<PropertyFilter> propertyFilters = PropertyFilter.buildFromMap(parameterMap);
		page = sendsmsHistoryManager.pagedQuery(page, propertyFilters);

		List<SendsmsHistory> sendsmsHistories = (List<SendsmsHistory>) page.getResult();

		TableModel tableModel = new TableModel();
		tableModel.setName("sendsms history");
		tableModel.addHeaders("id", "name");
		tableModel.setData(sendsmsHistories);
		exportor.export(request, response, tableModel);
	}

	@RequestMapping("sendsms-history-view")
	public String view(@RequestParam("id") Long id, Model model)
	{
		model.addAttribute("sendsmsHistory", sendsmsHistoryManager.get(id));

		return "sendsms/sendsms-history-view";
	}

	@RequestMapping("sendsms-history-send")
	public String send(@RequestParam("id") Long id)
	{
		SendsmsHistory sendsmsHistory = sendsmsHistoryManager.get(id);
		SendsmsQueue sendsmsQueue = new SendsmsQueue();
		beanMapper.copy(sendsmsHistory, sendsmsQueue);
		sendsmsQueue.setId(null);
		sendsmsQueueManager.save(sendsmsQueue);

		return "redirect:/sendsms/sendsms-queue-list.do";
	}

	// ~ ======================================================================
	@Resource
	public void setSendsmsHistoryManager(SendsmsHistoryManager sendsmsHistoryManager)
	{
		this.sendsmsHistoryManager = sendsmsHistoryManager;
	}

	@Resource
	public void setSendsmsQueueManager(SendsmsQueueManager sendsmsQueueManager)
	{
		this.sendsmsQueueManager = sendsmsQueueManager;
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
