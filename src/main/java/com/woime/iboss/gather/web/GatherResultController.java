package com.woime.iboss.gather.web;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.woime.iboss.core.page.Page;
import com.woime.iboss.gather.persistence.domain.GatherResultQueryModel;
import com.woime.iboss.gather.service.GatherTargetService;

/**
 * @author Chen Yujian on 2017/2/14 12:25.
 */
@Controller
@RequestMapping("gather/result")
public class GatherResultController {

	@Autowired
	private GatherTargetService targetService;
	
    @RequestMapping(method = RequestMethod.GET)
    public String source(Model model) {
        return "gather/result";
    }

    @RequestMapping("page")
    @ResponseBody
    public Object page(@RequestParam(defaultValue = "10", required = false) int pageSize,
                       @RequestParam(defaultValue = "1", required = false) int pageNo,
                       GatherResultQueryModel queryModel) throws SQLException {

        Page page = new Page();
        page.setPageNo(pageNo);
        page.setPageSize(pageSize);
        
		try
		{
			Long counts = 0l;
            Map<String,Object> result = targetService.queryResult(queryModel, pageSize, pageNo,counts);
			page.setTotalCount((Long) result.get("count"));
			page.setResult(result.get("rows"));
		}
		catch (SQLException e)
		{
			throw e;
		}


        return page;
    }

}
