package com.woime.iboss.internal.sendsms.support;

public interface SmsConnector
{
	SmsDTO send(SmsDTO smsDto, SmsServerInfo smsServerInfo);
}
