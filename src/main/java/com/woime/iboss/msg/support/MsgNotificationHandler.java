package com.woime.iboss.msg.support;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;

import com.woime.iboss.api.notification.NotificationDTO;
import com.woime.iboss.api.notification.NotificationHandler;
import com.woime.iboss.msg.persistence.domain.MsgInfo;
import com.woime.iboss.msg.persistence.manager.MsgInfoManager;

public class MsgNotificationHandler implements NotificationHandler
{
	private MsgInfoManager msgInfoManager;
	private String defaultSender = "";

	public void handle(NotificationDTO notificationDto, String tenantId)
	{
		if (!"userid".equals(notificationDto.getReceiverType()))
		{
			return;
		}

		MsgInfo msgInfo = new MsgInfo();
		msgInfo.setName(notificationDto.getSubject());
		msgInfo.setContent(notificationDto.getContent());
		msgInfo.setReceiverId(notificationDto.getReceiver());
		msgInfo.setCreateTime(new Date());
		msgInfo.setStatus(0);
		msgInfo.setTenantId(tenantId);

		String humanTaskId = (String) notificationDto.getData().get("humanTaskId");
		msgInfo.setData(humanTaskId);

		if (StringUtils.isNotBlank(notificationDto.getSender()))
		{
			msgInfo.setSenderId(notificationDto.getSender());
		}
		else
		{
			msgInfo.setSenderId(defaultSender);
		}

		msgInfoManager.save(msgInfo);
	}

	public String getType()
	{
		return "msg";
	}

	public void setDefaultSender(String defaultSender)
	{
		this.defaultSender = defaultSender;
	}

	@Resource
	public void setMsgInfoManager(MsgInfoManager msgInfoManager)
	{
		this.msgInfoManager = msgInfoManager;
	}
}
