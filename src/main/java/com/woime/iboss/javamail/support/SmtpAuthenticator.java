package com.woime.iboss.javamail.support;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SmtpAuthenticator extends Authenticator
{
	private String username = "wangguodong@devaeye.com";
	private String password = "";

	public SmtpAuthenticator()
	{
		super();
	}

	public SmtpAuthenticator(String username, String password)
	{
		super();
		this.username = username;
		this.password = password;
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication()
	{
		return new PasswordAuthentication(username, password);
	}
}
