package com.woime.iboss.quartz;

import java.io.File;
import java.util.Date;
import java.util.UUID;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;

import com.woime.iboss.alarm.service.AlarmService;
import com.woime.iboss.core.spring.ApplicationContextHelper;
import com.woime.iboss.gather.persistence.domain.GatherPlanTask;
import com.woime.iboss.gather.persistence.manager.GatherPlanTaskManager;
import com.woime.iboss.gather.support.DBUtils;
import com.woime.iboss.quartz.module.ScheduleJob;
import com.woime.iboss.quartz.support.CSVExporter;
import com.woime.iboss.quartz.support.CSVLoader;
import com.woime.iboss.quartz.vo.ScheduleJobVo;

/**
 * 同步的任务工厂类
 * 
 * @author 王国栋
 *
 */
public class JobSyncFactory implements Job
{
	/* 日志对象 */
	private static final Logger LOG = LoggerFactory.getLogger(JobSyncFactory.class);

	public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException
	{
		JobDataMap mergedJobDataMap = jobExecutionContext.getMergedJobDataMap();
		ScheduleJob scheduleJob = (ScheduleJob) mergedJobDataMap.get(ScheduleJobVo.JOB_PARAM_KEY);
		LOG.info("jobName:" + scheduleJob.getJobName() + "  " + scheduleJob);
		if(scheduleJob.getJobGroup() != null && "etl".equals(scheduleJob.getJobGroup()))
		{
			// 开始执行数据导入任务
			GatherPlanTaskManager planTaskManager = ApplicationContextHelper.getBean(GatherPlanTaskManager.class);
			GatherPlanTask task = planTaskManager.get(scheduleJob.getScheduleJobId());
			if (task != null)
			{
				// 获取采集源
				try
				{
					DBUtils db = new DBUtils();
					CSVExporter ce = new CSVExporter(db.getConnection(task.getObject()));
					File d = File.createTempFile(UUID.randomUUID().toString(), task.getName());
					ce.exportCsv(task, d);

					CSVLoader l = new CSVLoader(ApplicationContextHelper.getBean(JdbcTemplate.class).getDataSource().getConnection());
					l.loadCSV(d.getAbsolutePath(), task.getTarget().getDbTableName(), true, new Date(), task.getTarget());
				}
				catch (Exception e)
				{
					LOG.error(e.getMessage());
				}
			}
		}
		else if(scheduleJob.getJobGroup() != null && "alarm".equals(scheduleJob.getJobGroup()))
		{
			//TODO jinggao  ....
			AlarmService as = ApplicationContextHelper.getBean(AlarmService.class);
			as.alarm(as.getAlarmConfig(scheduleJob.getScheduleJobId()));
		}
	}
}
