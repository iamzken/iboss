package com.woime.iboss.spi.user;

public interface AccountCredentialConnector
{
	String findPassword(String username, String tenantId);
}
