package com.woime.iboss.security.impl;

import org.springframework.jdbc.core.JdbcTemplate;

import com.woime.iboss.security.api.UserAuth;
import com.woime.iboss.security.api.UserRealm;

public class DatabaseUserRealm implements UserRealm
{
	private JdbcTemplate jdbcTemplate;

	public UserAuth login(String username, String password, String tenantId)
	{
		return null;
	}

	public UserAuth findByUsername(String username, String tenantId)
	{
		return null;
	}

	public UserAuth findByRef(String ref, String tenantId)
	{
		return null;
	}

	public UserAuth findById(String id, String tenantId)
	{
		return null;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}
}
