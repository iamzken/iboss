package com.woime.iboss.plm.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.woime.iboss.core.auth.CurrentUserHolder;
import com.woime.iboss.core.mapper.BeanMapper;
import com.woime.iboss.plm.persistence.domain.PlmSprint;
import com.woime.iboss.plm.persistence.domain.PlmStep;
import com.woime.iboss.plm.persistence.manager.PlmCategoryManager;
import com.woime.iboss.plm.persistence.manager.PlmCommentManager;
import com.woime.iboss.plm.persistence.manager.PlmIssueManager;
import com.woime.iboss.plm.persistence.manager.PlmLogManager;
import com.woime.iboss.plm.persistence.manager.PlmProjectManager;
import com.woime.iboss.plm.persistence.manager.PlmSprintManager;
import com.woime.iboss.plm.persistence.manager.PlmStepManager;
import com.woime.iboss.plm.persistence.manager.PlmVersionManager;
import com.woime.iboss.plm.service.PlmLogService;

@Controller
@RequestMapping("plm")
public class PlmKanbanController
{
	private PlmProjectManager plmProjectManager;
	private PlmVersionManager plmVersionManager;
	private PlmIssueManager plmIssueManager;
	private PlmCommentManager plmCommentManager;
	private PlmCategoryManager plmCategoryManager;
	private PlmLogManager plmLogManager;
	private PlmSprintManager plmSprintManager;
	private PlmStepManager plmStepManager;
	private PlmLogService plmLogService;
	private CurrentUserHolder currentUserHolder;
	private JdbcTemplate jdbcTemplate;
	private BeanMapper beanMapper = new BeanMapper();

	/**
	 * 看板.
	 */
	@RequestMapping("kanban")
	public String kanban(@RequestParam("sprintId") Long sprintId, Model model) throws Exception
	{
		// 获得迭代
		PlmSprint plmSprint = plmSprintManager.get(sprintId);
		model.addAttribute("plmSprint", plmSprint);

		// 获得迭代对应的步骤
		String hql = "from PlmStep where plmConfig=? order by priority";
		List<PlmStep> plmSteps = plmStepManager.find(hql, plmSprint.getPlmConfig());
		model.addAttribute("plmSteps", plmSteps);

		// 获得每个步骤下的任务
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		model.addAttribute("list", list);

		for (PlmStep plmStep : plmSteps)
		{
			Map<String, Object> map = new HashMap<String, Object>();
			list.add(map);
			map.put("plmStep", plmStep);

			String hqlSelectIssue = "from PlmIssue where plmSprint=? and step=?";
			map.put("plmIssues", plmIssueManager.find(hqlSelectIssue, plmSprint, plmStep.getCode()));
		}

		return "plm/kanban";
	}

	@Resource
	public void setPlmProjectManager(PlmProjectManager plmProjectManager)
	{
		this.plmProjectManager = plmProjectManager;
	}

	@Resource
	public void setPlmVersionManager(PlmVersionManager plmVersionManager)
	{
		this.plmVersionManager = plmVersionManager;
	}

	@Resource
	public void setPlmIssueManager(PlmIssueManager plmIssueManager)
	{
		this.plmIssueManager = plmIssueManager;
	}

	@Resource
	public void setPlmCommentManager(PlmCommentManager plmCommentManager)
	{
		this.plmCommentManager = plmCommentManager;
	}

	@Resource
	public void setPlmCategoryManager(PlmCategoryManager plmCategoryManager)
	{
		this.plmCategoryManager = plmCategoryManager;
	}

	@Resource
	public void setPlmLogManager(PlmLogManager plmLogManager)
	{
		this.plmLogManager = plmLogManager;
	}

	@Resource
	public void setPlmSprintManager(PlmSprintManager plmSprintManager)
	{
		this.plmSprintManager = plmSprintManager;
	}

	@Resource
	public void setPlmStepManager(PlmStepManager plmStepManager)
	{
		this.plmStepManager = plmStepManager;
	}

	@Resource
	public void setPlmLogService(PlmLogService plmLogService)
	{
		this.plmLogService = plmLogService;
	}

	@Resource
	public void setCurrentUserHolder(CurrentUserHolder currentUserHolder)
	{
		this.currentUserHolder = currentUserHolder;
	}

	@Resource
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}
}
