package com.woime.iboss.spi.userauth;

import javax.servlet.http.HttpSession;

import com.woime.iboss.api.userauth.UserAuthDTO;

public class MockInternalUserAuthConnector implements InternalUserAuthConnector
{
	public UserAuthDTO findFromSession(HttpSession session)
	{
		return null;
	}
}
