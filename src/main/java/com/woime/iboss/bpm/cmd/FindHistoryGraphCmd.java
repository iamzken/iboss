package com.woime.iboss.bpm.cmd;

import org.activiti.engine.impl.interceptor.Command;
import org.activiti.engine.impl.interceptor.CommandContext;

import com.woime.iboss.bpm.graph.ActivitiHistoryGraphBuilder;
import com.woime.iboss.bpm.graph.Graph;

public class FindHistoryGraphCmd implements Command<Graph>
{
//	private static Logger logger = LoggerFactory.getLogger(FindHistoryGraphCmd.class);
	private String processInstanceId;

	public FindHistoryGraphCmd(String processInstanceId)
	{
		this.processInstanceId = processInstanceId;
	}

	public Graph execute(CommandContext commandContext)
	{
		return new ActivitiHistoryGraphBuilder(processInstanceId).build();
	}
}
