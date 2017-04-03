package com.woime.iboss.user.support;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.woime.iboss.api.user.AccountStatus;
import com.woime.iboss.api.user.AccountStatusHelper;
import com.woime.iboss.api.user.AuthenticationClient;
import com.woime.iboss.api.user.AuthenticationHandler;
import com.woime.iboss.core.auth.CustomPasswordEncoder;
import com.woime.iboss.user.persistence.manager.AccountCredentialManager;
import com.woime.iboss.user.persistence.manager.AccountInfoManager;

public class DefaultAuthenticationClient implements AuthenticationClient
{
	private static Logger logger = LoggerFactory.getLogger(DefaultAuthenticationClient.class);
	private AccountInfoManager accountInfoManager;
	private AccountCredentialManager accountCredentialManager;
	private CustomPasswordEncoder customPasswordEncoder;
	private AccountStatusHelper accountStatusHelper;
	private List<AuthenticationHandler> authenticationHandlers;

	public String doAuthenticate(String username, String password, String type, String application)
	{
		boolean locked = accountStatusHelper.isLocked(username, application);

		if (locked)
		{
			return AccountStatus.LOCKED;
		}

		String result = AccountStatus.FAILURE;

		for (AuthenticationHandler authenticationHandler : authenticationHandlers)
		{
			if (authenticationHandler.support(type))
			{
				result = authenticationHandler.doAuthenticate(username, password, application);

				break;
			}
		}

		if (!AccountStatus.SUCCESS.equals(result))
		{
			return result;
		}

		String status = accountStatusHelper.getAccountStatus(username, application);

		return status;
	}

	@Resource
	public void setAccountInfoManager(AccountInfoManager accountInfoManager)
	{
		this.accountInfoManager = accountInfoManager;
	}

	@Resource
	public void setAccountCredentialManager(AccountCredentialManager accountCredentialManager)
	{
		this.accountCredentialManager = accountCredentialManager;
	}

	@Resource
	public void setCustomPasswordEncoder(CustomPasswordEncoder customPasswordEncoder)
	{
		this.customPasswordEncoder = customPasswordEncoder;
	}

	@Resource
	public void setAccountStatusHelper(AccountStatusHelper accountStatusHelper)
	{
		this.accountStatusHelper = accountStatusHelper;
	}

	public void setAuthenticationHandlers(List<AuthenticationHandler> authenticationHandlers)
	{
		this.authenticationHandlers = authenticationHandlers;
	}
}
