package com.woime.iboss.internal.sendmail.support;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.woime.iboss.api.notification.NotificationDTO;
import com.woime.iboss.api.notification.NotificationHandler;
import com.woime.iboss.api.user.UserConnector;
import com.woime.iboss.internal.sendmail.service.SendmailDataService;

public class SendmailNotificationHandler implements NotificationHandler
{
	private static Logger logger = LoggerFactory.getLogger(SendmailNotificationHandler.class);
	private SendmailDataService sendmailDataService;
	private UserConnector userConnector;

	public void handle(NotificationDTO notificationDto, String tenantId)
	{
		String email = null;

		if ("userid".equals(notificationDto.getReceiverType()))
		{
			email = userConnector.findById(notificationDto.getReceiver()).getEmail();
		}
		else if ("email".equals(notificationDto.getReceiverType()))
		{
			email = notificationDto.getReceiver();
		}
		else
		{
			return;
		}

		try
		{
			sendmailDataService.send(email, notificationDto.getSubject(), notificationDto.getContent(), "1", tenantId);
		}
		catch (Exception ex)
		{
			logger.error(ex.getMessage(), ex);
		}
	}

	public String getType()
	{
		return "sendmail";
	}

	@Resource
	public void setSendmailDataService(SendmailDataService sendmailDataService)
	{
		this.sendmailDataService = sendmailDataService;
	}

	@Resource
	public void setUserConnector(UserConnector userConnector)
	{
		this.userConnector = userConnector;
	}
}
