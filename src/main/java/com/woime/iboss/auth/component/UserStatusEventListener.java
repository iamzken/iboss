package com.woime.iboss.auth.component;

import javax.annotation.Resource;

import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.woime.iboss.auth.persistence.domain.UserStatus;
import com.woime.iboss.core.hibernate.EntityEvent;

@Component
public class UserStatusEventListener implements ApplicationListener<EntityEvent>
{
	private AuthCache authCache;

	public void onApplicationEvent(EntityEvent event)
	{
		if (!event.supportsEntityType(UserStatus.class))
		{
			return;
		}

		UserStatus userStatus = event.getEntity();
		authCache.evictUserStatus(userStatus);
	}

	@Resource
	public void setAuthCache(AuthCache authCache)
	{
		this.authCache = authCache;
	}
}
