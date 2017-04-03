package com.woime.iboss.humantask.rule;

import java.util.Collections;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.woime.iboss.api.org.OrgConnector;
import com.woime.iboss.core.spring.ApplicationContextHelper;

/**
 * 获得指定用户的上级领导.
 * 
 */
public class SuperiorAssigneeRule implements AssigneeRule
{
	private static Logger logger = LoggerFactory.getLogger(SuperiorAssigneeRule.class);
	private OrgConnector orgConnector;

	public List<String> process(String value, String initiator)
	{
		return Collections.singletonList(this.process(initiator));
	}

	/**
	 * 获得员工的直接上级.
	 */
	public String process(String initiator)
	{
		if (orgConnector == null)
		{
			orgConnector = ApplicationContextHelper.getBean(OrgConnector.class);
		}

		return orgConnector.getSuperiorId(initiator);
	}
}
