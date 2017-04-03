package com.woime.iboss.humantask.client;

public class HumanTaskClient
{
	public HumanTask create()
	{
		HumanTask humanTask = new HumanTask();
		humanTask.setStatus(HumanTaskConstants.STATUS_CREATED);

		return humanTask;
	}
}
