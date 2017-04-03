package com.woime.iboss.internal.sendsms.client;

public interface SmsClient
{
	void sendSms(String mobile, String message) throws Exception;
}
