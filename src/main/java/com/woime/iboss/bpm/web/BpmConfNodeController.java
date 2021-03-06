package com.woime.iboss.bpm.web;

import java.util.List;

import javax.annotation.Resource;

import org.activiti.engine.ProcessEngine;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.woime.iboss.bpm.persistence.domain.BpmConfBase;
import com.woime.iboss.bpm.persistence.domain.BpmConfNode;
import com.woime.iboss.bpm.persistence.manager.BpmConfBaseManager;
import com.woime.iboss.bpm.persistence.manager.BpmConfNodeManager;
import com.woime.iboss.bpm.persistence.manager.BpmConfUserManager;
import com.woime.iboss.bpm.persistence.manager.BpmProcessManager;

@Controller
@RequestMapping("bpm")
public class BpmConfNodeController
{
	private BpmConfUserManager bpmConfUserManager;
	private BpmConfNodeManager bpmConfNodeManager;
	private BpmConfBaseManager bpmConfBaseManager;
	private ProcessEngine processEngine;
	private BpmProcessManager bpmProcessManager;

	@RequestMapping("bpm-conf-node-list")
	public String list(@RequestParam("bpmConfBaseId") Long bpmConfBaseId, Model model)
	{
		BpmConfBase bpmConfBase = bpmConfBaseManager.get(bpmConfBaseId);
		String hql = "from BpmConfNode where bpmConfBase=? order by priority";
		List<BpmConfNode> bpmConfNodes = bpmConfNodeManager.find(hql, bpmConfBase);
		model.addAttribute("bpmConfBase", bpmConfBase);
		model.addAttribute("bpmConfNodes", bpmConfNodes);

		return "bpm/bpm-conf-node-list";
	}

	// ~ ======================================================================
	@Resource
	public void setBpmConfNodeManager(BpmConfNodeManager bpmConfNodeManager)
	{
		this.bpmConfNodeManager = bpmConfNodeManager;
	}

	@Resource
	public void setBpmConfBaseManager(BpmConfBaseManager bpmConfBaseManager)
	{
		this.bpmConfBaseManager = bpmConfBaseManager;
	}
}
