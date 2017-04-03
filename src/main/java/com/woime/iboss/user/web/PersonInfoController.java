package com.woime.iboss.user.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woime.iboss.api.store.StoreConnector;
import com.woime.iboss.api.user.UserCache;
import com.woime.iboss.api.user.UserDTO;
import com.woime.iboss.core.auth.CustomPasswordEncoder;
import com.woime.iboss.core.export.Exportor;
import com.woime.iboss.core.mapper.BeanMapper;
import com.woime.iboss.core.spring.MessageHelper;
import com.woime.iboss.user.persistence.domain.AccountInfo;
import com.woime.iboss.user.persistence.domain.PersonInfo;
import com.woime.iboss.user.persistence.manager.AccountInfoManager;
import com.woime.iboss.user.persistence.manager.PersonInfoManager;
import com.woime.iboss.user.service.UserService;

@Controller
@RequestMapping("user")
public class PersonInfoController
{
	private AccountInfoManager accountInfoManager;
	private PersonInfoManager personInfoManager;
	private UserCache userCache;
	private MessageHelper messageHelper;
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private CustomPasswordEncoder customPasswordEncoder;
	private UserService userService;
	private StoreConnector storeConnector;

	@RequestMapping("person-info-account-input")
	public String accountInput(@RequestParam("code") String code)
	{
		PersonInfo personInfo = personInfoManager.findUniqueBy("code", code);

		if (personInfo == null)
		{
			personInfo = new PersonInfo();
			personInfo.setCode(code);
			personInfoManager.save(personInfo);
		}

		return "redirect:/user/person-info-input.do?id=" + personInfo.getId();
	}

	@RequestMapping("person-info-input")
	public String input(@RequestParam(value = "id", required = false) Long id, Model model)
	{
		PersonInfo personInfo = null;

		if (id != null)
		{
			personInfo = personInfoManager.get(id);
		}
		else
		{
			personInfo = new PersonInfo();
		}

		model.addAttribute("model", personInfo);

		return "user/person-info-input";
	}

	@RequestMapping("person-info-save")
	public String save(@ModelAttribute PersonInfo personInfo, RedirectAttributes redirectAttributes) throws Exception
	{
		// 再进行数据复制
		PersonInfo dest = null;
		Long id = personInfo.getId();

		if (id != null)
		{
			dest = personInfoManager.get(id);
			beanMapper.copy(personInfo, dest);
		}
		else
		{
			dest = personInfo;
		}

		personInfoManager.save(dest);

		messageHelper.addFlashMessage(redirectAttributes, "core.success.save", "保存成功");

		AccountInfo accountInfo = accountInfoManager.findUniqueBy("code", personInfo.getCode());

		if (accountInfo != null)
		{
			UserDTO userDto = new UserDTO();
			userDto.setId(Long.toString(accountInfo.getId()));
			userDto.setUsername(accountInfo.getUsername());
			userDto.setRef(accountInfo.getCode());
			userDto.setUserRepoRef("1");
			userCache.removeUser(userDto);
		}

		return "redirect:/user/account-info-list.do";
	}

	// ~ ======================================================================
	@Resource
	public void setAccountInfoManager(AccountInfoManager accountInfoManager)
	{
		this.accountInfoManager = accountInfoManager;
	}

	@Resource
	public void setPersonInfoManager(PersonInfoManager personInfoManager)
	{
		this.personInfoManager = personInfoManager;
	}

	@Resource
	public void setUserCache(UserCache userCache)
	{
		this.userCache = userCache;
	}

	@Resource
	public void setMessageHelper(MessageHelper messageHelper)
	{
		this.messageHelper = messageHelper;
	}

	@Resource
	public void setExportor(Exportor exportor)
	{
		this.exportor = exportor;
	}

	@Resource
	public void setStoreConnector(StoreConnector storeConnector)
	{
		this.storeConnector = storeConnector;
	}
}
