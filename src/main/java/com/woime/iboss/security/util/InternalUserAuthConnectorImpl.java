package com.woime.iboss.security.util;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;

import com.woime.iboss.api.userauth.UserAuthDTO;
import com.woime.iboss.spi.userauth.InternalUserAuthConnector;

public class InternalUserAuthConnectorImpl implements InternalUserAuthConnector
{
	public UserAuthDTO findFromSession(HttpSession session)
	{
		SecurityContext securityContext = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");

		if (securityContext == null)
		{
			return null;
		}

		Authentication authentication = securityContext.getAuthentication();

		if (authentication == null)
		{
			return null;
		}

		Object principal = authentication.getPrincipal();

		if (!(principal instanceof UserAuthDTO))
		{
			return null;
		}

		return ((UserAuthDTO) principal);
	}
}
