package com.woime.iboss.gather.web;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.gather.persistence.domain.GatherObject;
import com.woime.iboss.gather.service.GatherObjectService;
import com.woime.iboss.gather.service.GatherSourceService;

/**
 * @author Chen Yujian on 2017/1/22 15:19.
 */
@Controller
@RequestMapping("gather/object")
public class GatherObjectController {

    @Autowired
    private GatherObjectService gatherObjectService;

    @Autowired
    private GatherSourceService gatherSourceService;

    @RequestMapping(method = RequestMethod.GET)
    public String source(Model model) {
        model.addAttribute("sources", gatherSourceService.queryAllSource());
        return "gather/object";
    }

    @RequestMapping("page")
    @ResponseBody
    public Object page(Page page) {
        return gatherObjectService.page(page, PropertyFilter.buildFromMap(page.getFilters()));
    }

    @RequestMapping("add")
    @ResponseBody
    public Object add(GatherObject gatherObject) {
    	Map<String, Object> result = Maps.newHashMap();
        try
		{
			gatherObjectService.add(gatherObject);
			result.put("result", true);
			result.put("message", "添加采集对象成功！");
		}
		catch (Exception e)
		{
			result.put("result", false);
			result.put("message", e.getMessage());
		}
        return result;
    }

    @RequestMapping("modify")
    @ResponseBody
    public Object modify(GatherObject gatherObject) {
    	Map<String, Object> result = Maps.newHashMap();
        try {
			gatherObjectService.modify(gatherObject);
			result.put("result", true);
			result.put("message", "修改采集对象成功！");
		} catch (Exception e) {
	        result.put("result", false);
	        result.put("message", e.getMessage());
		}

        return result;
    }

    @RequestMapping("remove")
    @ResponseBody
    public Object remove(Long id) {
    	Map<String, Object> result = Maps.newHashMap();
        try {
			gatherObjectService.remove(id);
			result.put("result", true);
			result.put("message", "删除采集对象成功！");
		} catch (Exception e) {
			result.put("result", false);
			result.put("message", e.getMessage());
		}
        return result;
    }

    @RequestMapping("get")
    @ResponseBody
    public Object get(Long id) {
        return gatherObjectService.get(id);
    }

    @RequestMapping("all")
    @ResponseBody
    public Object all() {
        return gatherObjectService.all();
    }


}
