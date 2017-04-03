package com.woime.iboss.auth.component;

import javax.annotation.Resource;

import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.woime.iboss.auth.persistence.domain.Role;
import com.woime.iboss.core.hibernate.EntityEvent;

@Component
public class RoleEventListener implements ApplicationListener<EntityEvent>
{
	private AuthCache authCache;

	public void onApplicationEvent(EntityEvent event)
	{
		if (!event.supportsEntityType(Role.class))
		{
			return;
		}

		Role role = event.getEntity();
		authCache.evictRole(role);
	}

	@Resource
	public void setAuthCache(AuthCache authCache)
	{
		this.authCache = authCache;
	}
}
