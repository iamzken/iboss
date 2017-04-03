package com.woime.iboss.quartz.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.quartz.CronTrigger;
import org.quartz.Scheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.woime.iboss.gather.persistence.domain.GatherPlan;
import com.woime.iboss.gather.persistence.domain.GatherPlanTask;
import com.woime.iboss.gather.persistence.manager.GatherPlanTaskManager;
import com.woime.iboss.gather.service.GatherPlanService;
import com.woime.iboss.quartz.ScheduleJobService;
import com.woime.iboss.quartz.ScheduleUtils;
import com.woime.iboss.quartz.module.ScheduleJob;
import com.woime.iboss.quartz.vo.ScheduleJobVo;

/**
 * 定时任务接口
 * 
 * @author 王国栋
 *
 */
@Service
public class ScheduleJobServiceImpl implements ScheduleJobService
{

	/** 调度工厂Bean */
	@Autowired
	private Scheduler scheduler;

	@Autowired
	private GatherPlanService gatherPlanManager;
	
	@Autowired
	private GatherPlanTaskManager planTaskManager;

	public void initScheduleJob()
	{
		List<GatherPlan> gatherPlans = gatherPlanManager.getAll();
		if (CollectionUtils.isEmpty(gatherPlans))
		{
			return;
		}
		Date now = new Date();
		for (GatherPlan gatherPlan : gatherPlans)
		{
			List<GatherPlanTask> details = gatherPlan.getDetails();
			if (details != null)
			{
				for (GatherPlanTask gatherPlanTask : details)
				{
					CronTrigger cronTrigger = ScheduleUtils.getCronTrigger(scheduler, gatherPlanTask.getName(), "etl");
					ScheduleJob job = new ScheduleJob();
					job.setAliasName(gatherPlanTask.getName());
					job.setCronExpression(gatherPlanTask.getFrequency());
					job.setDescription(gatherPlanTask.getName());
					job.setGmtCreate(now);
					job.setGmtModify(now);
					job.setIsSync(true);
					job.setJobGroup("etl");
					job.setJobName(gatherPlanTask.getName());
//					job.setJobTrigger(jobTrigger);
					job.setScheduleJobId(gatherPlanTask.getId());
					job.setStatus("1");
					// 不存在，创建一个
					if (cronTrigger == null)
					{
						ScheduleUtils.createScheduleJob(scheduler, job);
					}
					else
					{
						// 已存在，那么更新相应的定时设置
						ScheduleUtils.updateScheduleJob(scheduler, job);
					}
				}
			}
		}
	}

	public void insert(ScheduleJob job)
	{
		ScheduleUtils.createScheduleJob(scheduler, job);
	}

	public void update(ScheduleJob scheduleJobVo)
	{
		ScheduleUtils.updateScheduleJob(scheduler, scheduleJobVo);
	}

	public void delUpdate(ScheduleJob scheduleJobVo)
	{
		// 先删除
		ScheduleUtils.deleteScheduleJob(scheduler, scheduleJobVo.getJobName(), scheduleJobVo.getJobGroup());
		// 再创建
		ScheduleUtils.createScheduleJob(scheduler, scheduleJobVo);
	}

	public void delete(String jobName, String jogGroupName)
	{
//		ScheduleJob scheduleJob = jdbcDao.get(ScheduleJob.class, scheduleJobId);
//		// 删除运行的任务
		ScheduleUtils.deleteScheduleJob(scheduler, jobName, jogGroupName);
//		// 删除数据
//		jdbcDao.delete(ScheduleJob.class, scheduleJobId);
	}

	public void runOnce(Long planTaskId)
	{
		Date now = new Date();
		GatherPlanTask task = planTaskManager.get(planTaskId);
		if (task != null)
		{
			ScheduleJob job = new ScheduleJob();
			job.setAliasName(task.getName());
			job.setCronExpression(task.getFrequency());
			job.setDescription(task.getName());
			job.setGmtCreate(now);
			job.setGmtModify(now);
			job.setIsSync(true);
			job.setJobGroup("etl");
			job.setJobName(task.getName());
//			job.setJobTrigger(jobTrigger);
			job.setScheduleJobId(task.getId());
			job.setStatus("1");
			
			ScheduleUtils.runOnce(scheduler, job.getJobName(), job.getJobGroup());
		}
	}

	public void pauseJob(Long planTaskId)
	{
		Date now = new Date();
		GatherPlanTask task = planTaskManager.get(planTaskId);
		if (task != null)
		{
			ScheduleJob job = new ScheduleJob();
			job.setAliasName(task.getName());
			job.setCronExpression(task.getFrequency());
			job.setDescription(task.getName());
			job.setGmtCreate(now);
			job.setGmtModify(now);
			job.setIsSync(true);
			job.setJobGroup("etl");
			job.setJobName(task.getName());
//			job.setJobTrigger(jobTrigger);
			job.setScheduleJobId(task.getId());
			job.setStatus("1");
			ScheduleUtils.pauseJob(scheduler, job.getJobName(), job.getJobGroup());
		}
	}

	public void resumeJob(Long taskId)
	{
		Date now = new Date();
		GatherPlanTask task = planTaskManager.get(taskId);
		if (task != null)
		{
			ScheduleJob job = new ScheduleJob();
			job.setAliasName(task.getName());
			job.setCronExpression(task.getFrequency());
			job.setDescription(task.getName());
			job.setGmtCreate(now);
			job.setGmtModify(now);
			job.setIsSync(true);
			job.setJobGroup("etl");
			job.setJobName(task.getName());
//			job.setJobTrigger(jobTrigger);
			job.setScheduleJobId(task.getId());
			job.setStatus("1");
			ScheduleUtils.resumeJob(scheduler, job.getJobName(), job.getJobGroup());
		}
	}

	public ScheduleJobVo get(Long scheduleJobId)
	{
//		ScheduleJob scheduleJob = jdbcDao.get(ScheduleJob.class, scheduleJobId);
//		return scheduleJob.getTargetObject(ScheduleJobVo.class);
		return null;
	}

	public List<ScheduleJobVo> queryList(ScheduleJobVo scheduleJobVo)
	{
		return null;
//		List<ScheduleJob> scheduleJobs = jdbcDao.queryList(scheduleJobVo.getTargetObject(ScheduleJob.class));
//
//		List<ScheduleJobVo> scheduleJobVoList = BeanConverter.convert(ScheduleJobVo.class, scheduleJobs);
//		try
//		{
//			for (ScheduleJobVo vo : scheduleJobVoList)
//			{
//
//				JobKey jobKey = ScheduleUtils.getJobKey(vo.getJobName(), vo.getJobGroup());
//				List<? extends Trigger> triggers = scheduler.getTriggersOfJob(jobKey);
//				if (CollectionUtils.isEmpty(triggers))
//				{
//					continue;
//				}
//
//				// 这里一个任务可以有多个触发器， 但是我们一个任务对应一个触发器，所以只取第一个即可，清晰明了
//				Trigger trigger = triggers.iterator().next();
//				scheduleJobVo.setJobTrigger(trigger.getKey().getName());
//
//				Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
//				vo.setStatus(triggerState.name());
//
//				if (trigger instanceof CronTrigger)
//				{
//					CronTrigger cronTrigger = (CronTrigger) trigger;
//					String cronExpression = cronTrigger.getCronExpression();
//					vo.setCronExpression(cronExpression);
//				}
//			}
//		}
//		catch (SchedulerException e)
//		{
//			// 演示用，就不处理了
//		}
//		return scheduleJobVoList;
	}

	public List<ScheduleJob> queryExecutingJobList()
	{
//		try
//		{
//			List<JobExecutionContext> executingJobs = scheduler.getCurrentlyExecutingJobs();
//			List<ScheduleJobVo> jobList = new ArrayList<ScheduleJobVo>(executingJobs.size());
//			for (JobExecutionContext executingJob : executingJobs)
//			{
//				ScheduleJobVo job = new ScheduleJobVo();
//				JobDetail jobDetail = executingJob.getJobDetail();
//				JobKey jobKey = jobDetail.getKey();
//				Trigger trigger = executingJob.getTrigger();
//				job.setJobName(jobKey.getName());
//				job.setJobGroup(jobKey.getGroup());
//				job.setJobTrigger(trigger.getKey().getName());
//				Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
//				job.setStatus(triggerState.name());
//				if (trigger instanceof CronTrigger)
//				{
//					CronTrigger cronTrigger = (CronTrigger) trigger;
//					String cronExpression = cronTrigger.getCronExpression();
//					job.setCronExpression(cronExpression);
//				}
//				jobList.add(job);
//			}
//			return jobList;
//		}
//		catch (SchedulerException e)
//		{
//			// 演示用，就不处理了
//			return null;
//		}
		return null;
	}

	@Override
	public List<ScheduleJob> queryList(ScheduleJob scheduleJobVo)
	{
		// TODO Auto-generated method stub
		return null;
	}
}
