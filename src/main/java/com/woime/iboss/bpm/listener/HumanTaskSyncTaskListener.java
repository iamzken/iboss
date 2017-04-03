package com.woime.iboss.bpm.listener;

import javax.annotation.Resource;

import org.activiti.engine.delegate.DelegateTask;

import com.woime.iboss.api.humantask.HumanTaskConnector;
import com.woime.iboss.api.humantask.HumanTaskDTO;
import com.woime.iboss.bpm.support.DefaultTaskListener;

public class HumanTaskSyncTaskListener extends DefaultTaskListener
{
	private static final long serialVersionUID = 1L;
	public static final int TYPE_COPY = 3;
//	private static Logger logger = LoggerFactory.getLogger(HumanTaskSyncTaskListener.class);
	private HumanTaskConnector humanTaskConnector;

	@Override
	public void onCreate(DelegateTask delegateTask) throws Exception
	{
		HumanTaskDTO humanTaskDto = humanTaskConnector.findHumanTaskByTaskId(delegateTask.getId());
		delegateTask.setOwner(humanTaskDto.getOwner());
		delegateTask.setAssignee(humanTaskDto.getAssignee());
	}

	@Resource
	public void setHumanTaskConnector(HumanTaskConnector humanTaskConnector)
	{
		this.humanTaskConnector = humanTaskConnector;
	}
}
