package com.woime.iboss.alarm.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.woime.iboss.alarm.persistence.domain.AlarmTarget;
import com.woime.iboss.alarm.service.AlarmService;
import com.woime.iboss.alarm.service.AlarmTargetService;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.gather.support.DBTableSchema;

/**
 * @author Chen Yujian on 2017/1/22 15:19.
 */
@Controller
@RequestMapping("alarm/target")
public class AlarmTargetController {
    @Resource
	AlarmTargetService alarmTargetService;
	
    @Resource
    AlarmService alarmService;

    @RequestMapping
    public String index() {
        return "alarm/target";
    }

    @RequestMapping("page")
    @ResponseBody
    public Object page(Page page) {
        return alarmTargetService.page(page, PropertyFilter.buildFromMap(page.getFilters()));
    }


    @RequestMapping("add")
    @ResponseBody
    public Object add(AlarmTarget alarmTarget) {
    	
        Map<String, Object> result = Maps.newHashMap();
        try
		{
			alarmTargetService.add(alarmTarget);
			result.put("result", true);
			result.put("message", "添加告警指标对象成功！");
		}
		catch (Exception e)
		{
			result.put("result", false);
			result.put("message", "添加告警指标对象失败！");
		}
        return result;
    }

    @RequestMapping("modify")
    @ResponseBody
    public Object modify(AlarmTarget alarmTarget) {
    	
        Map<String, Object> result = Maps.newHashMap();
        try
		{
			alarmTargetService.modify(alarmTarget);
			result.put("result", true);
			result.put("message", "修改告警指标对象成功！");
		}
		catch (Exception e)
		{
			result.put("result", false);
			result.put("message", "修改告警指标对象失败！");
		}
        return result;
    }

    @RequestMapping("remove")
    @ResponseBody
    public Object remove(Long id) {
        AlarmTarget alarmTarget = new AlarmTarget();
        alarmTarget.setId(id);
        if(alarmTargetService.get(id)== null){
            return ImmutableMap.of("result", false, "message", "删除失败，该告警指标对象已被使用！");
        }else{
        	alarmTargetService.remove(id);
            Map<String, Object> result = Maps.newHashMap();
            result.put("result", true);
            result.put("message", "删除告警指标对象成功！");
            return result;
        }
    }

    @RequestMapping("get")
    @ResponseBody
    public Object get(Long id) {
        return alarmTargetService.get(id);
    }

    @RequestMapping("test")
    @ResponseBody
    public Object test(AlarmTarget alarmTarget) {
        if(alarmService.testAlarmTarget(alarmTarget)){
            return ImmutableMap.of("result", true, "message", "测试告警指标对象成功！");
        }else{
            return ImmutableMap.of("result", false, "message", "测试告警指标对象失败！");
        }
    }

    @RequestMapping("columns")
    public
    @ResponseBody
    List<DBTableSchema> columns(String tableName) throws Exception {
        try {
            return alarmService.queryColumnNamesFromTable(tableName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return Lists.newArrayList();
    }

}
