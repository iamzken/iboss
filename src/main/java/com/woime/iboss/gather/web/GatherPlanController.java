package com.woime.iboss.gather.web;

import java.util.List;
import java.util.Map;

import org.quartz.CronExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.gather.persistence.domain.GatherPlan;
import com.woime.iboss.gather.persistence.domain.GatherPlanTask;
import com.woime.iboss.gather.service.GatherPlanService;

@Controller
@RequestMapping("gather/plan")
public class GatherPlanController {
    @Autowired
    private GatherPlanService planService;

    @RequestMapping(method = RequestMethod.GET)
    public String source(Model model) {
        return "gather/plan";
    }

    /**
     * 采集计划页面的 分页列表展现
     *
     * @param page
     * @return
     */
    @RequestMapping("page")
    @ResponseBody
    public Page page(Page page) {
        return planService.page(page);
    }

    /**
     * 增加采集计划
     *
     * @param plan
     * @return
     */
    @RequestMapping("add")
    @ResponseBody
    public Map<String, Object> add(GatherPlan plan) {
    	Map<String, Object> result = Maps.newHashMap();
    	try {
			if (plan != null)
			{
				List<GatherPlanTask> tasks = plan.getDetails();
				if (tasks != null)
				{
					StringBuilder sb = new StringBuilder();
					for (GatherPlanTask gatherPlanTask : tasks)
					{
						boolean cronExpressionFlag = CronExpression.isValidExpression(gatherPlanTask.getFrequency());
						if (!cronExpressionFlag)
						{
							sb.append(gatherPlanTask.getName()).append(" ");
						}
					}
					if (sb.length() > 0)
					{
						result.put("result", false);
						result.put("message", sb.toString() + " 任务的corn表达式不正确");
						return result;
					}
				}
			}
			planService.add(plan);
			
			result.put("result", true);
			result.put("message", "添加采集对象成功！");
		} catch (Exception e) {
			result.put("result", false);
			result.put("message", e.getMessage());
		}
        return result;
    }

    /**
     * 删除采集计划
     *
     * @param id
     * @return
     */
    @RequestMapping("remove")
    @ResponseBody
    public Map<String, Object> remove(Long id) {
        planService.removeById(id);
        Map<String, Object> result = Maps.newHashMap();
        result.put("result", true);
        result.put("message", "删除采集计划成功！");
        return result;
    }

    @RequestMapping("update")
    @ResponseBody
    public Map<String, Object> update(GatherPlan plan) {
        planService.update(plan);
        Map<String, Object> result = Maps.newHashMap();
        result.put("result", true);
        result.put("message", "更新采集计划成功！");
        return result;
    }

    @RequestMapping("get")
    @ResponseBody
    public Object get(Long id) {
        return planService.get(id);
    }

    @RequestMapping("task/test")
    @ResponseBody
    public Object get(GatherPlanTask task) {
        Map<String, Object> result = Maps.newHashMap();
        boolean cronExpressionFlag = CronExpression.isValidExpression(task.getFrequency());
        result.put("result", cronExpressionFlag);
        if(cronExpressionFlag) {
            result.put("message", "测试成功！");
        } else {
            result.put("message", "采集频率(Cron表达式)填写错误！");
        }
        return result;
    }
}
