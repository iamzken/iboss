package com.woime.iboss.spi.userauth;

import javax.servlet.http.HttpSession;

import com.woime.iboss.api.userauth.UserAuthDTO;

public interface InternalUserAuthConnector
{
	UserAuthDTO findFromSession(HttpSession session);
}
