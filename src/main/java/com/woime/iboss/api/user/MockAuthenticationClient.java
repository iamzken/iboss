package com.woime.iboss.api.user;

public class MockAuthenticationClient implements AuthenticationClient
{
	public String doAuthenticate(String username, String password, String type, String application)
	{
		return AccountStatus.ENABLED;
	}
}
