package com.woime.iboss.security.impl;

import java.util.Collections;

import com.woime.iboss.security.api.UserFetcher;
import com.woime.iboss.security.api.UserInfo;

public class MockUserFetcher implements UserFetcher
{
	public UserInfo getUserInfo(String username)
	{
		return getUserInfo(username, null, null);
	}

	public UserInfo getUserInfo(String username, String appId)
	{
		return getUserInfo(username, appId, null);
	}

	public UserInfo getUserInfo(String username, String appId, String repoCode)
	{
		UserInfoImpl userInfo = new UserInfoImpl();

		userInfo.setUsername(username);
		userInfo.setDisplayName(username);
		userInfo.setPassword("password");
		userInfo.setAuthorities(Collections.singletonList("*"));
		userInfo.setAttributes(Collections.EMPTY_LIST);
		userInfo.putExtraItem("repoCode", repoCode);
		userInfo.putExtraItem("appId", appId);

		return userInfo;
	}
}
