package com.woime.iboss.alarm.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.ImmutableMap;
import com.woime.iboss.alarm.persistence.domain.AlarmInfo;
import com.woime.iboss.alarm.persistence.manager.AlarmInfoManager;
import com.woime.iboss.alarm.persistence.manager.AlarmTargetManager;
import com.woime.iboss.alarm.service.AlarmService;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.ne.persistence.domain.NetworkElement;
import com.woime.iboss.ne.service.NetworkElementService;

/**
 * @author Chen Yujian on 2017/1/22 15:19.
 */
@Controller
@RequestMapping("alarm/manage")
public class AlarmManageController {

    private static Map<Integer, String> levelDict = ImmutableMap.of(1, "紧急", 2, "重要", 3, "次要", 4, "提示");
    private static Map<Integer, String> statusDict = ImmutableMap.of(1, "未确认未清除", 2, "未确认已清除", 3, "已确认未清除", 4, "已确认已清除");

    @Resource
    AlarmInfoManager alarmInfoManager;

    @Resource
    AlarmTargetManager alarmTargetManager;

    @Resource
    AlarmService alarmService;

    @Resource
    NetworkElementService neService;


    @RequestMapping
    public ModelAndView index(ModelAndView modelAndView) {
        modelAndView.setViewName("alarm/manage");
        modelAndView.addObject("leveldict", levelDict);
        modelAndView.addObject("statusDict", statusDict);
        modelAndView.addObject("targets", alarmTargetManager.getAll());
        modelAndView.addObject("counts", updateCount(alarmService.alarmCount(), neService.all()));
        return modelAndView;
    }

    private static Map<Long, Long> updateCount(Map<Long, Long> countMap, List<NetworkElement> networkElementList){
        if(countMap.isEmpty()){
            return countMap;
        }
        for(NetworkElement networkElement : networkElementList){
            if(networkElement.getParentId() == null){
                update(networkElement.getId(), countMap, networkElementList);
            }
        }
        return countMap;
    }

    public static long update(long neid, Map<Long, Long> countMap, List<NetworkElement> networkElementList){
        long count = 0;
        for(NetworkElement networkElement : networkElementList){
            if(networkElement.getParentId() != null && networkElement.getParentId() == neid){
                if(countMap.containsKey(networkElement.getId())){
                    count += countMap.get(networkElement.getId());
                }else{
                    count += update(networkElement.getId(), countMap, networkElementList);
                }
            }
        }
        countMap.put(neid, count);
        return count;
    }

    @RequestMapping("page")
    @ResponseBody
    public Object page(Page page) {
        return alarmService.pagedQuery(page, PropertyFilter.buildFromMap(page.getFilters()));
    }

    @RequestMapping("query")
    @ResponseBody
    public Object query(@RequestParam(required = false) Long neId, @RequestParam(required = false) Integer alarmLevel, @RequestParam(required = false) Integer alarmStatus, @RequestParam(required = false) Long alarmTargetId, @RequestParam(required = false) String alarmName, @RequestParam(required = false) int pageSize) {
        return alarmService.queryAlarmInfo(neId, alarmLevel, alarmStatus, alarmTargetId, alarmName, pageSize);
    }

    @RequestMapping("get")
    @ResponseBody
    public Object get(Long id) {
        return alarmInfoManager.get(id);
    }


    @RequestMapping("confirm")
    @ResponseBody
    public Object confirm(Long id) {
        alarmService.confirmAlarmInfo(id);
        return ImmutableMap.of("result", true, "message", "确认告警成功！");
    }

    @RequestMapping("clean")
    @ResponseBody
    public Object confirm(AlarmInfo alarmInfo) {
        alarmService.cleanAlarmInfo(alarmInfo);
        return ImmutableMap.of("result", true, "message", "清除告警成功！");
    }

}
