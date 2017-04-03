package com.woime.iboss.audit.support;

import javax.annotation.Resource;

import com.woime.iboss.api.audit.AuditConnector;
import com.woime.iboss.api.audit.AuditDTO;
import com.woime.iboss.audit.persistence.domain.AuditBase;
import com.woime.iboss.audit.service.AuditService;
import com.woime.iboss.core.mapper.BeanMapper;

public class AuditConnectorImpl implements AuditConnector
{
	private AuditService auditService;
	private BeanMapper beanMapper = new BeanMapper();

	public void log(AuditDTO auditDto)
	{
		AuditBase auditBase = new AuditBase();
		beanMapper.copy(auditDto, auditBase);
		auditService.log(auditBase);
	}

	@Resource
	public void setAuditService(AuditService auditService)
	{
		this.auditService = auditService;
	}
}
