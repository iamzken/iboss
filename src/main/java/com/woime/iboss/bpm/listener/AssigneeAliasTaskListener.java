package com.woime.iboss.bpm.listener;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.impl.context.Context;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.woime.iboss.bpm.rule.AssigneeRule;
import com.woime.iboss.bpm.rule.PositionAssigneeRule;
import com.woime.iboss.bpm.rule.RuleMatcher;
import com.woime.iboss.bpm.rule.SuperiorAssigneeRule;
import com.woime.iboss.bpm.support.DefaultTaskListener;

public class AssigneeAliasTaskListener extends DefaultTaskListener
{
	private static final long serialVersionUID = 1L;
	private static Logger logger = LoggerFactory.getLogger(AssigneeAliasTaskListener.class);
//	private JdbcTemplate jdbcTemplate;
	private Map<RuleMatcher, AssigneeRule> assigneeRuleMap = new HashMap<RuleMatcher, AssigneeRule>();

	public AssigneeAliasTaskListener()
	{
		SuperiorAssigneeRule superiorAssigneeRule = new SuperiorAssigneeRule();
		PositionAssigneeRule positionAssigneeRule = new PositionAssigneeRule();
		assigneeRuleMap.put(new RuleMatcher("常用语"), superiorAssigneeRule);
		assigneeRuleMap.put(new RuleMatcher("岗位"), positionAssigneeRule);
	}

	@Override
	public void onCreate(DelegateTask delegateTask) throws Exception
	{
		String assignee = delegateTask.getAssignee();
		logger.debug("assignee : {}", assignee);

		if (assignee == null)
		{
			return;
		}

		for (Map.Entry<RuleMatcher, AssigneeRule> entry : assigneeRuleMap.entrySet())
		{
			RuleMatcher ruleMatcher = entry.getKey();

			if (!ruleMatcher.matches(assignee))
			{
				continue;
			}

			String value = ruleMatcher.getValue(assignee);
			AssigneeRule assigneeRule = entry.getValue();
			logger.debug("value : {}", value);
			logger.debug("assigneeRule : {}", assigneeRule);

			if (assigneeRule instanceof SuperiorAssigneeRule)
			{
				this.processSuperior(delegateTask, assigneeRule, value);
			}
			else if (assigneeRule instanceof PositionAssigneeRule)
			{
				this.processPosition(delegateTask, assigneeRule, value);
			}
		}
	}

	public void processSuperior(DelegateTask delegateTask, AssigneeRule assigneeRule, String value)
	{
		String processInstanceId = delegateTask.getProcessInstanceId();
		String startUserId = Context.getCommandContext().getHistoricProcessInstanceEntityManager().findHistoricProcessInstance(processInstanceId).getStartUserId();
		String userId = assigneeRule.process(startUserId);
		logger.debug("userId : {}", userId);
		delegateTask.setAssignee(userId);
	}

	public void processPosition(DelegateTask delegateTask, AssigneeRule assigneeRule, String value)
	{
		String processInstanceId = delegateTask.getProcessInstanceId();
		String startUserId = Context.getCommandContext().getHistoricProcessInstanceEntityManager().findHistoricProcessInstance(processInstanceId).getStartUserId();
		List<String> userIds = assigneeRule.process(value, startUserId);
		logger.debug("userIds : {}", userIds);

		if (!userIds.isEmpty())
		{
			delegateTask.setAssignee(userIds.get(0));
		}
	}

//	@Resource
//	public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
//	{
//		this.jdbcTemplate = jdbcTemplate;
//	}
}
