package com.woime.iboss.humantask.listener;

import com.woime.iboss.humantask.persistence.domain.TaskInfo;

public interface HumanTaskListener
{
	void onCreate(TaskInfo taskInfo) throws Exception;

	void onComplete(TaskInfo taskInfo) throws Exception;
}
