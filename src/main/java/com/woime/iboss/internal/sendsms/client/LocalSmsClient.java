package com.woime.iboss.internal.sendsms.client;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;

import com.woime.iboss.core.mapper.JsonMapper;
import com.woime.iboss.internal.sendsms.service.SendsmsDataService;

public class LocalSmsClient implements SmsClient
{
	private static Logger logger = LoggerFactory.getLogger(LocalSmsClient.class);
	private String baseUrl;
	private String configCode;
	private JsonMapper jsonMapper = new JsonMapper();
	private SendsmsDataService sendsmsDataService;

	public void sendSms(String mobile, String message) throws Exception
	{
		sendsmsDataService.saveSendsmsQueue(mobile, message, configCode);
	}

	@Value("${sms.baseUrl}")
	public void setBaseUrl(String baseUrl)
	{
		this.baseUrl = baseUrl;
	}

	@Value("${sms.configCode}")
	public void setConfigCode(String configCode)
	{
		this.configCode = configCode;
	}

	@Resource
	public void setSendsmsDataService(SendsmsDataService sendsmsDataService)
	{
		this.sendsmsDataService = sendsmsDataService;
	}
}
