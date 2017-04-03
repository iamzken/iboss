package com.woime.iboss.api.audit;

public interface AuditConnector
{
	void log(AuditDTO auditDto);
}
