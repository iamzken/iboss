package com.woime.iboss.security.impl;

import com.woime.iboss.security.api.UserAuth;
import com.woime.iboss.security.api.UserRealm;

public class UserRealmWrapper implements UserRealm
{
	public UserAuth login(String username, String password, String tenantId)
	{
		return null;
	}

	public UserAuth findByRef(String ref, String tenantId)
	{
		return null;
	}

	public UserAuth findById(String id, String tenantId)
	{
		return null;
	}
}
