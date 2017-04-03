package com.woime.iboss.audit.component;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.TimeUnit;

import org.springframework.stereotype.Component;

import com.woime.iboss.api.audit.AuditDTO;

@Component
public class AuditQueue
{
	private BlockingQueue<AuditDTO> blockingQueue = new LinkedBlockingQueue<AuditDTO>();

	public void add(AuditDTO auditDto)
	{
		blockingQueue.add(auditDto);
	}

	public AuditDTO poll() throws InterruptedException
	{
		return blockingQueue.poll(1, TimeUnit.SECONDS);
	}
}
