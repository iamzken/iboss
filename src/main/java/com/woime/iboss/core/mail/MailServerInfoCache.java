package com.woime.iboss.core.mail;

public interface MailServerInfoCache
{
	MailServerInfo getDefaultMailServerInfo();

	void setDefaultMailServerInfo(MailServerInfo mailServerInfo);

	MailServerInfo getMailServerInfo(String name);

	void setMailServerInfo(MailServerInfo mailServerInfo);
}
