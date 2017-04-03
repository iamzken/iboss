package com.woime.iboss.gather.web;

import java.sql.SQLException;
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
import com.woime.iboss.gather.persistence.domain.GatherTarget;
import com.woime.iboss.gather.service.GatherTargetService;

@Controller
@RequestMapping("gather/target")
public class GatherTargetController {
    @Autowired
    private GatherTargetService targetService;

    @RequestMapping(method = RequestMethod.GET)
    public String source(Model model) {
        return "gather/target";
    }

    /**
     * 1、采集源-目标库 页面的列表 分页查询
     *
     * @param page
     * @return
     */
    @RequestMapping("page")
    public
    @ResponseBody
    Page page(Page page) {
        return targetService.page(page, PropertyFilter.buildFromMap(page.getFilters()));
    }

    /**
     * 2、采集源-目标库页面新增
     *
     * @param gt
     */
    @RequestMapping("add")
    @ResponseBody
    public Object add(GatherTarget gt) {
    	Map<String, Object> result = Maps.newHashMap();
        try
		{
			targetService.add(gt);
	        result.put("result", true);
	        result.put("message", "添加采集目标库表成功！");
		}
		catch (SQLException e)
		{
	        result.put("result", false);
	        result.put("message", e.getMessage());
		}
        return result;
    }

    /**
     * 3、采集源-目标库页面修改
     *
     * @param gt
     */
    @RequestMapping("update")
    @ResponseBody
    public Object update(GatherTarget gt) {
        Map<String, Object> result = Maps.newHashMap();
        try {
			targetService.update(gt);
	        result.put("result", true);
	        result.put("message", "修改采集目标库表成功！");
		} catch (SQLException e) {
	        result.put("result", false);
	        result.put("message", e.getMessage());
		}

        return result;
    }

    /**
     * 4、采集源-目标库页面删除
     *
     * @param id gathertarget 的id
     */
    @RequestMapping("remove")
    @ResponseBody
    public Object remove(Long id) {
        
        Map<String, Object> result = Maps.newHashMap();
        try {
			targetService.remove(id);
	        result.put("result", true);
	        result.put("message", "删除采集目标库表成功！");
		} catch (Exception e) {
	        result.put("result", false);
	        result.put("message", e.getMessage());
		}

        return result;
    }

    /**
     * 5、采集源-目标库获取单个数据
     *
     * @param id gathertarget 的id
     */
    @RequestMapping("get")
    @ResponseBody
    public Object get(Long id) {
        return targetService.get(id);
    }

    /**
     * 6、采集源-目标库获取所有数据
     */
    @RequestMapping("all")
    @ResponseBody
    public Object all() {
        return targetService.all();
    }

    public GatherTargetService getTargetService() {
        return targetService;
    }

    public void setTargetService(GatherTargetService targetService) {
        this.targetService = targetService;
    }
}
