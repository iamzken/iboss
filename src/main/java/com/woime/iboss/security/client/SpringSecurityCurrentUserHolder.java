package com.woime.iboss.security.client;

import com.woime.iboss.core.auth.CurrentUserHolder;
import com.woime.iboss.security.util.SpringSecurityUtils;

public class SpringSecurityCurrentUserHolder implements CurrentUserHolder
{
	public String getUserId()
	{
		return SpringSecurityUtils.getCurrentUserId();
	}

	public String getUsername()
	{
		return SpringSecurityUtils.getCurrentUsername();
	}
}
