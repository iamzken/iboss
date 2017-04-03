package com.woime.iboss.security.status;

public class AccountLockedException extends UserStatusException
{
	public AccountLockedException(String message)
	{
		super(message);
	}
}
