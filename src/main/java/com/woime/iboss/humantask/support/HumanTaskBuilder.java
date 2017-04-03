package com.woime.iboss.humantask.support;

import java.util.Date;

import com.woime.iboss.api.humantask.HumanTaskDTO;

public class HumanTaskBuilder
{
	public HumanTaskDTO create()
	{
		HumanTaskDTO humanTaskDto = new HumanTaskDTO();

		humanTaskDto.setDelegateStatus("none");
		humanTaskDto.setCreateTime(new Date());
		humanTaskDto.setSuspendStatus("none");
		humanTaskDto.setStatus("active");

		return humanTaskDto;
	}
}
