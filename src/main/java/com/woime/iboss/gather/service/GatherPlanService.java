package com.woime.iboss.gather.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.gather.persistence.domain.GatherPlan;
import com.woime.iboss.gather.persistence.domain.GatherPlanTask;
import com.woime.iboss.gather.persistence.domain.PlanTaskColMapping;
import com.woime.iboss.gather.persistence.manager.GatherPlanDetailManager;
import com.woime.iboss.gather.persistence.manager.GatherPlanManager;
import com.woime.iboss.gather.persistence.manager.PlanTaskColManager;
import com.woime.iboss.quartz.ScheduleJobService;
import com.woime.iboss.quartz.module.ScheduleJob;

@Service
@Transactional(readOnly = true)
public class GatherPlanService {
	private Logger logger = LoggerFactory.getLogger(GatherPlanService.class);
    @Autowired
    private GatherPlanManager planManager;
    @Autowired
    private GatherPlanDetailManager planDetailManager;
    public Page page(Page page) {
        return planManager.pagedQuery(page, PropertyFilter.buildFromMap(page.getFilters()));
    }

    @Autowired
    private ScheduleJobService jobService;
    
    @Transactional(readOnly = false)
    public void add(GatherPlan plan) {
    	List<ScheduleJob> jobs = new ArrayList<ScheduleJob>();
    	try
		{
			List<GatherPlanTask> tasks = plan.getDetails();
			if (tasks != null)
			{
				plan.setTaskNum(tasks.size());
			}
			planManager.save(plan);
			
			if (tasks != null)
			{
				ScheduleJob sj;
				Date now = new Date();
				for (GatherPlanTask task : tasks)
				{
					task.setGatherPlan(plan);
					planDetailManager.save(task);
			    	sj = new ScheduleJob();
			    	sj.setAliasName(task.getName());
			    	sj.setCronExpression(task.getFrequency());
			    	sj.setDescription(task.getName());
			    	sj.setGmtCreate(now);
			    	sj.setGmtModify(now);
			    	sj.setIsSync(true);
			    	sj.setJobGroup("etl");
			    	sj.setJobName(task.getName());
//	        	sj.setJobTrigger(jobTrigger);
			    	sj.setScheduleJobId(task.getId());
			    	sj.setStatus("1");
			    	jobService.insert(sj);
			    	jobs.add(sj);
			    	List<PlanTaskColMapping> mList = task.getColMaps();
			    	if (mList != null) {
			    		pcm.removeAll(pcm.find(" from PlanTaskColMapping t where t.planTask.id = ?", task.getId()));
						for (PlanTaskColMapping planTaskColMapping : mList) {
							planTaskColMapping.setPlanTask(task);
							pcm.save(planTaskColMapping);
						}
					}
				}
			}
		}
		catch (Exception e)
		{
			if (jobs.size() > 0)
			{
				try
				{
					for (ScheduleJob scheduleJob : jobs)
					{
						jobService.delete(scheduleJob.getJobName(), scheduleJob.getJobGroup());
					}
				}
				catch (Exception e1)
				{
					logger.debug(e1.getMessage());
				}
			}
			throw e;
		}
    }

    @Autowired
    private PlanTaskColManager pcm;
    
    @Transactional(readOnly = false)
    public void removeById(Long id) {
    	GatherPlan plan = planManager.get(id);
    	if (plan != null)
		{
    		List<GatherPlanTask> tasks = planManager.find("from GatherPlanTask t where t.gatherPlan.id = ?", plan.getId());
            //删除计划
        	for (GatherPlanTask gatherPlanTask : tasks) {
        		List<PlanTaskColMapping> cols = pcm.find("from PlanTaskColMapping t where t.planTask.id = ?", gatherPlanTask.getId());
        		for (PlanTaskColMapping planTaskColMapping : cols) {
    				pcm.remove(planTaskColMapping);
    			}
        		//删除计划下面的任务
        		planDetailManager.remove(gatherPlanTask);
        		jobService.delete(gatherPlanTask.getName(), "etl");
    		}
        	planManager.remove(plan);
		}
    }

    @Transactional(readOnly = false)
    public void update(GatherPlan plan) {
        List<GatherPlanTask> tasks = plan.getDetails();
        if (tasks != null)
		{
			plan.setTaskNum(tasks.size());
		}
        planManager.update(plan);
        if (tasks != null)
		{
        	 planDetailManager.removeAll(planDetailManager.find("from GatherPlanTask t where t.gatherPlan = ?", plan));
        	for (GatherPlanTask task : tasks)
			{
				task.setGatherPlan(plan);
				planDetailManager.save(task);
				
	        	List<PlanTaskColMapping> mList = task.getColMaps();
	        	if (mList != null) {
	        		pcm.removeAll(pcm.find(" from PlanTaskColMapping t where t.planTask.id = ?", task.getId()));
					for (PlanTaskColMapping planTaskColMapping : mList) {
						pcm.insert(planTaskColMapping);
					}
				}
			}
		}
    }

    @SuppressWarnings("unchecked")
	public GatherPlan get(Long id) {
    	GatherPlan result = planManager.get(id);
    	if (result != null)
		{
			result.setDetails(planDetailManager.find("from GatherPlanTask t where t.gatherPlan.id = ?", id));
			List<GatherPlanTask> tasks = result.getDetails();
			for (GatherPlanTask gatherPlanTask : tasks) {
				gatherPlanTask.setColMaps(pcm.find(" from PlanTaskColMapping t where t.planTask.id = ?", gatherPlanTask.getId()));
			}
		}
        return result;
    }

	@SuppressWarnings("unchecked")
	public List<GatherPlan> getAll()
	{
		List<GatherPlan> plans = planManager.getAll();
		for (GatherPlan gatherPlan : plans)
		{
			gatherPlan.setDetails(planDetailManager.find("from GatherPlanTask t where t.gatherPlan.id = ?", gatherPlan.getId()));
			List<GatherPlanTask> tasks = gatherPlan.getDetails();
			for (GatherPlanTask gatherPlanTask : tasks) {
				gatherPlanTask.setColMaps(pcm.find(" from PlanTaskColMapping t where t.planTask.id = ?", gatherPlanTask.getId()));
			}
		}
		return plans;
	}

}
