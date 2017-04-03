package com.woime.iboss.internal.sendsms.service;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woime.iboss.core.mapper.BeanMapper;
import com.woime.iboss.core.mapper.JsonMapper;
import com.woime.iboss.internal.sendsms.persistence.domain.SendsmsConfig;
import com.woime.iboss.internal.sendsms.persistence.domain.SendsmsHistory;
import com.woime.iboss.internal.sendsms.persistence.domain.SendsmsQueue;
import com.woime.iboss.internal.sendsms.persistence.manager.SendsmsConfigManager;
import com.woime.iboss.internal.sendsms.persistence.manager.SendsmsHistoryManager;
import com.woime.iboss.internal.sendsms.persistence.manager.SendsmsQueueManager;
import com.woime.iboss.internal.sendsms.support.SmsConnector;
import com.woime.iboss.internal.sendsms.support.SmsDTO;
import com.woime.iboss.internal.sendsms.support.SmsServerInfo;

@Service
@Transactional
public class SendsmsDataService
{
	private static Logger logger = LoggerFactory.getLogger(SendsmsDataService.class);
	private SendsmsConfigManager sendsmsConfigManager;
	private SendsmsQueueManager sendsmsQueueManager;
	private SendsmsHistoryManager sendsmsHistoryManager;
	private BeanMapper beanMapper = new BeanMapper();
	private SmsConnector smsConnector;
	private JsonMapper jsonMapper = new JsonMapper();

	public void saveSendsmsQueue(String mobile, String message, String configCode)
	{
		SendsmsConfig sendsmsConfig = sendsmsConfigManager.findUniqueBy("name", configCode);

		if (sendsmsConfig == null)
		{
			throw new IllegalArgumentException("configCode isnot exists : " + configCode);
		}

		SendsmsQueue sendsmsQueue = new SendsmsQueue();
		sendsmsQueue.setMobile(mobile);
		sendsmsQueue.setMessage(message);
		sendsmsQueue.setSendsmsConfig(sendsmsConfig);
		sendsmsQueue.setCreateTime(new Date());
		sendsmsQueueManager.save(sendsmsQueue);
	}

	public boolean checkConfigCodeExists(String configCode)
	{
		SendsmsConfig sendsmsConfig = sendsmsConfigManager.findUniqueBy("name", configCode);

		return sendsmsConfig != null;
	}

	public List<SendsmsQueue> findTopSendsmsQueues(int size)
	{
		return (List<SendsmsQueue>) sendsmsQueueManager.pagedQuery("from SendsmsQueue", 1, size).getResult();
	}

	public void processSendsmsQueue(SendsmsQueue sendsmsQueue) throws Exception
	{
		SmsDTO smsDto = new SmsDTO();
		SmsDTO resultSmsDto = null;

		if (sendsmsQueue.getSendsmsConfig() == null)
		{
			logger.info("sendsms config is null");

			return;
		}

		SendsmsConfig sendsmsConfig = sendsmsQueue.getSendsmsConfig();
		SmsServerInfo smsServerInfo = new SmsServerInfo();
		smsServerInfo.setHost(sendsmsConfig.getHost());
		smsServerInfo.setUsername(sendsmsConfig.getUsername());
		smsServerInfo.setPassword(sendsmsConfig.getPassword());
		smsServerInfo.setAppId(sendsmsConfig.getAppId());
		smsServerInfo.setMobileFieldName(sendsmsConfig.getMobileFieldName());
		smsServerInfo.setMessageFieldName(sendsmsConfig.getMessageFieldName());
		smsDto.setMobile(sendsmsQueue.getMobile());
		smsDto.setMessage(sendsmsQueue.getMessage());

		resultSmsDto = smsConnector.send(smsDto, smsServerInfo);

		if (!resultSmsDto.isSuccess() && (resultSmsDto.getThrowable() != null))
		{
			StringWriter writer = new StringWriter();
			resultSmsDto.getThrowable().printStackTrace(new PrintWriter(writer));
			resultSmsDto.setResult(writer.toString());
		}

		this.saveSendsmsHistory(sendsmsQueue, resultSmsDto);
	}

	public void saveSendsmsHistory(SendsmsQueue sendsmsQueue, SmsDTO smsDto)
	{
		SendsmsHistory sendsmsHistory = new SendsmsHistory();
		beanMapper.copy(smsDto, sendsmsHistory);
		sendsmsHistory.setStatus(smsDto.isSuccess() ? "success" : "error");
		sendsmsHistory.setInfo(smsDto.getResult());

		if (smsDto.getThrowable() != null)
		{
			sendsmsHistory.setInfo(smsDto.getThrowable().getMessage());
		}

		sendsmsHistory.setSendsmsConfig(sendsmsQueue.getSendsmsConfig());
		sendsmsHistory.setCreateTime(new Date());

		sendsmsHistoryManager.save(sendsmsHistory);
		sendsmsQueueManager.remove(sendsmsQueue);
	}

	@Resource
	public void setSendsmsConfigManager(SendsmsConfigManager sendsmsConfigManager)
	{
		this.sendsmsConfigManager = sendsmsConfigManager;
	}

	@Resource
	public void setSendsmsQueueManager(SendsmsQueueManager sendsmsQueueManager)
	{
		this.sendsmsQueueManager = sendsmsQueueManager;
	}

	@Resource
	public void setSendsmsHistoryManager(SendsmsHistoryManager sendsmsHistoryManager)
	{
		this.sendsmsHistoryManager = sendsmsHistoryManager;
	}

	@Resource
	public void setSmsConnector(SmsConnector smsConnector)
	{
		this.smsConnector = smsConnector;
	}
}
