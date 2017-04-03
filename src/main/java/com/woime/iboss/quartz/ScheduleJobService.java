package com.woime.iboss.quartz;

import java.util.List;

import com.woime.iboss.quartz.module.ScheduleJob;
import com.woime.iboss.quartz.vo.ScheduleJobVo;

/**
 * 定时任务service
 * 
 * @author 王国栋
 *
 */
public interface ScheduleJobService
{
	/**
	 * 初始化定时任务
	 */
	public void initScheduleJob();

	/**
	 * 新增
	 * 
	 * @param scheduleJob
	 */
	public void insert(ScheduleJob job);

	/**
	 * 直接修改 只能修改运行的时间，参数、同异步等无法修改
	 * 
	 * @param scheduleJobVo
	 */
	public void update(ScheduleJob scheduleJobVo);

	/**
	 * 删除重新创建方式
	 * 
	 * @param scheduleJobVo
	 */
	public void delUpdate(ScheduleJob scheduleJobVo);

	/**
	 * 删除
	 * 
	 * @param scheduleJobId
	 */
	public void delete(String jobName, String jogGroupName);

	/**
	 * 运行一次任务
	 *
	 * @param scheduleJobId
	 *            the schedule job id
	 * @return
	 */
	public void runOnce(Long planTaskId);

	/**
	 * 暂停任务
	 *
	 * @param scheduleJobId
	 *            the schedule job id
	 * @return
	 */
	public void pauseJob(Long scheduleJobId);

	/**
	 * 恢复任务
	 *
	 * @param scheduleJobId
	 *            the schedule job id
	 * @return
	 */
	public void resumeJob(Long scheduleJobId);

	/**
	 * 获取任务对象
	 * 
	 * @param scheduleJobId
	 * @return
	 */
	public ScheduleJobVo get(Long scheduleJobId);

	/**
	 * 查询任务列表
	 * 
	 * @param scheduleJobVo
	 * @return
	 */
	public List<ScheduleJob> queryList(ScheduleJob scheduleJobVo);

	/**
	 * 获取运行中的任务列表
	 *
	 * @return
	 */
	public List<ScheduleJob> queryExecutingJobList();
}
