package com.woime.iboss.user.authenticate;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.woime.iboss.api.user.AccountStatus;
import com.woime.iboss.api.user.AuthenticationHandler;
import com.woime.iboss.api.user.AuthenticationType;
import com.woime.iboss.core.auth.CustomPasswordEncoder;
import com.woime.iboss.user.persistence.domain.AccountCredential;
import com.woime.iboss.user.persistence.domain.AccountInfo;
import com.woime.iboss.user.persistence.manager.AccountCredentialManager;
import com.woime.iboss.user.persistence.manager.AccountInfoManager;

public class SpecialAuthenticationHandler implements AuthenticationHandler
{
	private static Logger logger = LoggerFactory.getLogger(SpecialAuthenticationHandler.class);
	private AccountInfoManager accountInfoManager;
	private AccountCredentialManager accountCredentialManager;
	private CustomPasswordEncoder customPasswordEncoder;

	public boolean support(String type)
	{
		return AuthenticationType.SPECIAL.equals(type);
	}

	public String doAuthenticate(String username, String password, String application)
	{
		if (username == null)
		{
			logger.info("username cannot be null");

			return AccountStatus.ACCOUNT_NOT_EXISTS;
		}

		username = username.toLowerCase();

		AccountInfo accountInfo = accountInfoManager.findUniqueBy("username", username);

		if (accountInfo == null)
		{
			return AccountStatus.ACCOUNT_NOT_EXISTS;
		}

		String hql = "from AccountCredential from accountInfo=? and catalog=?";
		AccountCredential accountCredential = accountCredentialManager.findUnique(hql, accountInfo, application);

		if (accountCredential == null)
		{
			return AccountStatus.PASSWORD_NOT_EXISTS;
		}

		if (customPasswordEncoder.matches(password, accountCredential.getPassword()))
		{
			return AccountStatus.SUCCESS;
		}
		else
		{
			return AccountStatus.BAD_CREDENTIALS;
		}
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
}
