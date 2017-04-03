package com.woime.iboss.alarm.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.quartz.CronExpression;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Maps;
import com.woime.iboss.alarm.persistence.domain.AlarmConfig;
import com.woime.iboss.alarm.persistence.domain.AutoConfirm;
import com.woime.iboss.alarm.persistence.manager.AlarmConfigManager;
import com.woime.iboss.alarm.persistence.manager.AlarmInfoManager;
import com.woime.iboss.alarm.persistence.manager.AlarmTargetManager;
import com.woime.iboss.alarm.service.AlarmService;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.user.persistence.manager.UserBaseManager;

/**
 * @author Chen Yujian on 2017/1/22 15:19.
 */
@Controller
@RequestMapping("alarm/config")
public class AlarmConfigController {

    private static Map<Integer, String> leveldict = ImmutableMap.of(1, "紧急", 2, "重要", 3, "次要", 4, "提示");

    @Resource
    AlarmConfigManager alarmConfigManager;

    @Resource
    AlarmTargetManager alarmTargetManager;

    @Resource
    AlarmInfoManager alarmInfoManager;

    @Resource
    UserBaseManager userBaseManager;

    @Resource
    AlarmService alarmService;

    @RequestMapping
    public ModelAndView index(ModelAndView modelAndView) {
        modelAndView.addObject("targets", alarmTargetManager.getAll());
        modelAndView.addObject("leveldict", leveldict);
        modelAndView.addObject("users", userBaseManager.getAll());
        modelAndView.addObject("parameterList", alarmService.getAlarmParameter());
        modelAndView.setViewName("alarm/config");
        return modelAndView;
    }

    @RequestMapping("page")
    @ResponseBody
    public Object page(Page page) {
        return alarmConfigManager.pagedQuery(page, PropertyFilter.buildFromMap(page.getFilters()));
    }


    @RequestMapping("add")
    @ResponseBody
    public Object add(AlarmConfig alarmConfig) {
        Map<String, Object> result = Maps.newHashMap();
        boolean cronExpressionFlag = CronExpression.isValidExpression(alarmConfig.getFrequency());
        if (cronExpressionFlag){
            result.put("result", false);
            result.put("message", "配置的corn表达式不正确");
            return result;
        }
        alarmService.saveAlarmConfig(alarmConfig);
        result.put("result", true);
        result.put("message", "添加告警配置成功！");
        return result;
    }

    @RequestMapping("modify")
    @ResponseBody
    public Object modify(AlarmConfig alarmConfig) {
        Map<String, Object> result = Maps.newHashMap();

        boolean cronExpressionFlag = CronExpression.isValidExpression(alarmConfig.getFrequency());
        if (!cronExpressionFlag){
            result.put("result", false);
            result.put("message", "配置的corn表达式不正确");
            return result;
        }
        alarmService.updateAlarmConfig(alarmConfig);
        result.put("result", true);
        result.put("message", "修改告警配置成功！");
        return result;
    }
    
    @RequestMapping("autoConfirmSetting")
    @ResponseBody
    public Object autoConfirmSetting(String jinji,String zhongyao,String ciyao,String tishi,String time) {
        Map<String, Object> result = Maps.newHashMap();

//        boolean cronExpressionFlag = CronExpression.isValidExpression(alarmConfig.getFrequency());
//        if (!cronExpressionFlag){
//            result.put("result", false);
//            result.put("message", "配置的corn表达式不正确");
//            return result;
//        }
        AutoConfirm ac = new AutoConfirm();
        ac.setAlrmLevel("jinji");
        ac.setComType(jinji);
        ac.setComTime(time);
        alarmService.updateAutoConfirm(ac);
        ac = new AutoConfirm();
        ac.setAlrmLevel("zhongyao");
        ac.setComType(zhongyao);
        ac.setComTime(time);
        alarmService.updateAutoConfirm(ac);
        ac = new AutoConfirm();
        ac.setAlrmLevel("ciyao");
        ac.setComType(ciyao);
        ac.setComTime(time);
        alarmService.updateAutoConfirm(ac);
        ac = new AutoConfirm();
        ac.setAlrmLevel("tishi");
        ac.setComType(tishi);
        ac.setComTime(time);
        alarmService.updateAutoConfirm(ac);
        result.put("result", true);
        result.put("message", "自动确认配置成功！");
        return result;
    }

    @RequestMapping("remove")
    @ResponseBody
    public Object remove(Long id) {
        AlarmConfig alarmConfig = new AlarmConfig();
        alarmConfig.setId(id);
        if(alarmInfoManager.findBy("config", alarmConfig).size()!=0){
            return ImmutableMap.of("result", false, "message", "删除失败，该告警配置已被使用！");
        }else{
            alarmService.removeAlarmConfig(id);
            Map<String, Object> result = Maps.newHashMap();
            result.put("result", true);
            result.put("message", "删除告警配置成功！");
            return result;
        }
    }

    @RequestMapping("get")
    @ResponseBody
    public Object get(Long id) {
        return alarmService.getAlarmConfig(id);
    }
    
    @RequestMapping("getAutoConfirm")
    @ResponseBody
    public Object getAutoConfirm() {
        Map<String, Object> result = Maps.newHashMap();
        List<AutoConfirm> list = alarmService.getAllAutoConfirm();
        for (AutoConfirm autoConfirm : list) {
        	result.put(autoConfirm.getAlrmLevel(), autoConfirm.getComType());
		}
        result.put("time", list.get(0).getComTime());
        return result;
    }
    
}
