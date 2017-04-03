package com.woime.iboss.gather.web;

import java.util.List;
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
import com.woime.iboss.gather.persistence.domain.GatherSource;
import com.woime.iboss.gather.service.GatherSourceService;
import com.woime.iboss.gather.service.enums.DBType;
import com.woime.iboss.gather.support.DBTableSchema;

/**
 * @author Chen Yujian on 2017/1/22 15:19.
 */
@Controller
@RequestMapping("gather/source")
public class GatherSourceController {

    @Autowired
    private GatherSourceService gatherSourceService;

    @RequestMapping(method = RequestMethod.GET)
    public String source(Model model) {
        model.addAttribute("dbTypes", DBType.map());
        return "gather/source";
    }

    @RequestMapping("page")
    @ResponseBody
    public Object page(Page page) {
        return gatherSourceService.page(page, PropertyFilter.buildFromMap(page.getFilters()));
    }

    @RequestMapping("test")
    @ResponseBody
    public Object test(GatherSource gatherSource) {
        	return gatherSourceService.testConnection(gatherSource);
    }

    @RequestMapping("add")
    @ResponseBody
    public Object add(GatherSource gatherSource) {
        Map<String, Object> result = Maps.newHashMap();
        
        try {
			gatherSourceService.add(gatherSource);
			result.put("result", true);
			result.put("message", "添加采集源成功！");
		} catch (Exception e) {
			result.put("result", false);
			result.put("message", e.getMessage());
		}
        return result;
    }

    @RequestMapping("modify")
    @ResponseBody
    public Object modify(GatherSource gatherSource) {
    	Map<String, Object> result = Maps.newHashMap();
        try {
			gatherSourceService.modify(gatherSource);
			result.put("result", true);
			result.put("message", "修改采集源成功！");
		} catch (Exception e) {
			result.put("result", true);
			result.put("message", e.getMessage());
		}
        return result;
    }

    @RequestMapping("remove")
    @ResponseBody
    public Object remove(Long id) {
    	Map<String, Object> result = Maps.newHashMap();
        try {
			gatherSourceService.remove(id);
			result.put("result", true);
			result.put("message", "删除采集源成功！");
		} catch (Exception e) {
			result.put("result", false);
			result.put("message", e.getMessage());
		}
        return result;
    }

    @RequestMapping("get")
    @ResponseBody
    public Object get(Long id) {
        return gatherSourceService.get(id);
    }

    @RequestMapping("toggle")
    @ResponseBody
    public Object toggle(Long id) {
    	 Map<String, Object> result = Maps.newHashMap();
    	
        try {
			GatherSource gatherSource = gatherSourceService.toggle(id);
			result.put("result", true);
			result.put("status", gatherSource.getStatus().getDesc());
			result.put("message", "已"+gatherSource.getStatus().getDesc()+"！");
		} catch (Exception e) {
			result.put("result", false);
			result.put("message", e.getMessage());
		}
        return result;
    }

    /**
     * 返回所有的采集元<br>
     * 1、添加数据采集对象 对话框中 选择 采集元数据库下拉框调用。<br>
     * @return
     */
    @RequestMapping("list")
    public @ResponseBody List<GatherSource> getAllSources()
    {
    	return gatherSourceService.queryAllSource();
    }
    
    /**
     * 返回指定采集源 下的所有数据库表<br>
     * 1、添加数据采集对象 对话框中 获取所有数据库表名。<br>
     * @param id	采集源的id
     * @return
     * @throws Exception 
     */
    @RequestMapping("tables")
    public @ResponseBody List<String> tables(Long id) throws Exception
    {
    	return gatherSourceService.queryTableNamesFromGatherSource(id);
    }
    
    /**
     * 获取指定采集源下指定表的所有列
     * @param id	采集源id
     * @param tableName	表名
     * @return
     * @throws Exception
     */
    @RequestMapping("columns")
     public
     @ResponseBody
     List<DBTableSchema> columns(Long id, String tableName) throws Exception {
    	return gatherSourceService.queryColumnNamesFromTable(id, tableName.toUpperCase());
    }
    
}
