package com.woime.iboss.ne.web;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Maps;
import com.woime.iboss.ne.persistence.domain.NetworkElement;
import com.woime.iboss.ne.persistence.domain.NetworkTemplate;
import com.woime.iboss.ne.service.NetworkElementService;

/**
 * @author Chen Yujian on 2017/1/22 15:19.
 */
@Controller
@RequestMapping("ne")
public class NeController {

	private NetworkElementService neService;
	
    @RequestMapping("index")
    public String index() {
        return "ne/index";
    }

    /**
     * 1、获取左侧网元树。<Br>
     * 异步按层获取，顶层parentId 为null，进入页面的时候默认调用 parentId 为null的所有顶层元素。
     * 后续通过点击每一层传递节点id获取下层的子
     * @return
     */
    @RequestMapping("tree")
    @ResponseBody
    public List<NetworkElement> tree() {
        //return neService.queryTreeNodes(parentId);
        return neService.all();
    }

    @RequestMapping("children")
    @ResponseBody
    public List<NetworkElement> tree(Long parentId) {
        return neService.queryTreeNodes(parentId);
    }
    
    /**
     * 2、获取网元信息<br>
     * 点击左侧树，传递id到后台，获取当前网元所有的相关信息，包含网元信息，警告配置信息
     * @param id
     * @return
     */
    @RequestMapping("node")
    public @ResponseBody NetworkElement node(@RequestParam Long id)
    {
    	return neService.queryById(id);
    }
    
    /**
     * 3、创建网元对象<br>
     * @param parentId
     * @param ne
     */
    @RequestMapping("create")
    @ResponseBody
    public Object create(Long parentId, NetworkElement ne)
    {
    	Map<String, Object> result = Maps.newHashMap();
    	try {
			neService.create(parentId, ne);
			result.put("result", true);
			result.put("message", "添加网元成功！");
		} catch (Exception e) {
			result.put("result", false);
			result.put("message", e.getMessage());
		}
        return result;
    }
    
    /**
     * 4、更新网元对象<br>
     * @param ne
     */
    @RequestMapping("update")
    @ResponseBody
    public Object update(NetworkElement ne)
    {
    	Map<String, Object> result = Maps.newHashMap();
    	try {
			neService.update(ne);
			result.put("result", true);
			result.put("message", "修改网元成功！");
		} catch (Exception e) {
			result.put("result", false);
			result.put("message", e.getMessage());
		}
        return result;
    }
    
    /**
     * 5、删除网元对象<br>
     * @param ne
     */
    @RequestMapping("remove")
    @ResponseBody
    public Object remove(Long id)
    {
    	Map<String, Object> result = Maps.newHashMap();
    	try {
			neService.remove(id);
			result.put("result", true);
			result.put("message", "删除网元成功！");
		} catch (Exception e) {
			result.put("result", false);
			result.put("message", e.getMessage());
		}
        return result;
    }
    
    /**
     * 6、获取所有 的网元模板类型
     * @return
     */
    @RequestMapping("templates")
    public @ResponseBody List<NetworkTemplate> templates()
    {
    	return neService.queryTemplates();
    }
    
    ///////////////////////////////////////////////////////////////////////////////
    
//    @RequestMapping("test")
//    public @ResponseBody NetworkElement test()
//    {
//    	NetworkElement ne = new NetworkElement();
//    	ne.setName("2017年招生系统");
//    	ne.setSection("小学");
//    	neService.create(null, ne);
//    	return ne;
//    }

	public NetworkElementService getNeService()
	{
		return neService;
	}

	@Autowired
	public void setNeService(NetworkElementService neService)
	{
		this.neService = neService;
	}
}
