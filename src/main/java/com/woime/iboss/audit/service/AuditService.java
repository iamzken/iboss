package com.woime.iboss.audit.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woime.iboss.api.audit.AuditDTO;
import com.woime.iboss.audit.persistence.domain.AuditBase;
import com.woime.iboss.audit.persistence.manager.AuditBaseManager;
import com.woime.iboss.core.mapper.BeanMapper;

@Service
@Transactional
public class AuditService
{
	private BeanMapper beanMapper = new BeanMapper();
	private AuditBaseManager auditBaseManager;

	public void log(AuditBase auditBase)
	{
		auditBaseManager.save(auditBase);
	}

	public void batchLog(List<AuditDTO> auditDtos)
	{
		for (AuditDTO auditDto : auditDtos)
		{
			AuditBase auditBase = new AuditBase();
			beanMapper.copy(auditDto, auditBase);

			auditBaseManager.save(auditBase);
		}
	}

	@Resource
	public void setAuditBaseManager(AuditBaseManager auditBaseManager)
	{
		this.auditBaseManager = auditBaseManager;
	}
}
