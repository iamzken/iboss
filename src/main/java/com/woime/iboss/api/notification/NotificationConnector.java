package com.woime.iboss.api.notification;

import java.util.Collection;

public interface NotificationConnector
{
	void send(NotificationDTO notificationDto, String tenantId);

	Collection<String> getTypes(String tenantId);
}
