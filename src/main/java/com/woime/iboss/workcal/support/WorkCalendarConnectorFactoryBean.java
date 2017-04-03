package com.woime.iboss.workcal.support;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.util.Assert;

import com.woime.iboss.api.workcal.MockWorkCalendarConnector;
import com.woime.iboss.api.workcal.WorkCalendarConnector;

public class WorkCalendarConnectorFactoryBean implements FactoryBean
{
	private static Logger logger = LoggerFactory.getLogger(WorkCalendarConnectorFactoryBean.class);
	private WorkCalendarConnector workCalendarConnector;
	private String type = "database";

	@PostConstruct
	public void afterPropertiesSet()
	{
		Assert.notNull(type, "type cannot be null");

		if ("mock".equals(type))
		{
			this.processMock();
		}
		else if ("database".equals(type))
		{
			this.processDatabase();
		}
		else
		{
			throw new IllegalArgumentException("unsupported type : " + type);
		}
	}

	public void processMock()
	{
		MockWorkCalendarConnector mockWorkCalendarConnector = new MockWorkCalendarConnector();
		workCalendarConnector = mockWorkCalendarConnector;
	}

	public void processDatabase()
	{
	}

	public Object getObject()
	{
		return workCalendarConnector;
	}

	public Class getObjectType()
	{
		return WorkCalendarConnector.class;
	}

	public boolean isSingleton()
	{
		return true;
	}

	public void setType(String type)
	{
		this.type = type;
	}
}
