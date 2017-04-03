package com.woime.iboss.internal.sendmail.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.woime.iboss.api.tenant.TenantHolder;
import com.woime.iboss.internal.sendmail.service.SendmailDataService;

@Controller
@RequestMapping("sendmail")
public class SendmailController
{
	private SendmailDataService sendmailDataService;
	private String from;
	private String to;
	private String subject;
	private String content;
	private TenantHolder tenantHolder;

	@RequestMapping("mail-input")
	public String input()
	{
		return "mail/mail-input";
	}

	@RequestMapping("sendmail-send")
	public String send(@RequestParam("from") String from, @RequestParam("to") String to, @RequestParam("subject") String subject, @RequestParam("content") String content)
	{
		String tenantId = tenantHolder.getTenantId();

		for (String line : to.split("\n"))
		{
			sendmailDataService.saveSendmailQueue(from, line, subject, content, tenantId);
		}

		return "redirect:/sendmail/sendmail-input.do";
	}

	@Resource
	public void setSendmailDataService(SendmailDataService sendmailDataService)
	{
		this.sendmailDataService = sendmailDataService;
	}

	@Resource
	public void setTenantHolder(TenantHolder tenantHolder)
	{
		this.tenantHolder = tenantHolder;
	}
}
