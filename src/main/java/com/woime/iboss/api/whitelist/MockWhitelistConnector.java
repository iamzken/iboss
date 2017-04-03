package com.woime.iboss.api.whitelist;

import java.util.List;

public class MockWhitelistConnector implements WhitelistConnector
{
	public WhitelistDTO getWhitelist(String code, String tenantId)
	{
		return null;
	}

	public List<WhitelistDTO> getWhitelists(String code, String tenantId)
	{
		return null;
	}
}
