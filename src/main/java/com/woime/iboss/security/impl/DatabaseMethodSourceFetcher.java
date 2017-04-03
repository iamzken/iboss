package com.woime.iboss.security.impl;

import org.springframework.beans.factory.InitializingBean;

import com.woime.iboss.security.api.MethodSourceFetcher;

public class DatabaseMethodSourceFetcher extends AbstractDatabaseSourceFetcher implements MethodSourceFetcher, InitializingBean
{
	public void afterPropertiesSet() throws Exception
	{
		if (getQuery() != null)
		{
			return;
		}

		String sql = "select ac.value as acce,p.code as perm" + " from AUTH_ACCESS ac,AUTH_PERM p" + " where ac.perm_id=p.id and ac.type='METHOD'" + " order by ac.priority";
		this.setQuery(sql);
	}
}
