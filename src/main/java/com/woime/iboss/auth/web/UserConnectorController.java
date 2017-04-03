package com.woime.iboss.auth.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.woime.iboss.api.tenant.TenantHolder;
import com.woime.iboss.api.user.UserCache;
import com.woime.iboss.api.user.UserConnector;
import com.woime.iboss.api.user.UserDTO;
import com.woime.iboss.auth.component.UserStatusConverter;
import com.woime.iboss.auth.persistence.domain.UserStatus;
import com.woime.iboss.auth.persistence.manager.UserStatusManager;
import com.woime.iboss.auth.service.AuthService;
import com.woime.iboss.auth.support.UserStatusDTO;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.spring.MessageHelper;
import com.woime.iboss.core.util.ServletUtils;
import com.woime.iboss.user.persistence.domain.AccountAvatar;
import com.woime.iboss.user.persistence.domain.AccountCredential;
import com.woime.iboss.user.persistence.domain.AccountInfo;
import com.woime.iboss.user.persistence.domain.PersonInfo;
import com.woime.iboss.user.persistence.manager.AccountAvatarManager;
import com.woime.iboss.user.persistence.manager.AccountCredentialManager;
import com.woime.iboss.user.persistence.manager.AccountInfoManager;
import com.woime.iboss.user.persistence.manager.PersonInfoManager;
import com.woime.iboss.user.publish.UserPublisher;

@Controller
@RequestMapping("auth")
public class UserConnectorController
{
	private static Logger logger = LoggerFactory.getLogger(UserConnectorController.class);
	private UserStatusManager userStatusManager;
	private UserStatusConverter userStatusConverter;
	private UserConnector userConnector;
	private AuthService authService;
	private TenantHolder tenantHolder;
	@Autowired
	private AccountInfoManager accountInfoManager;
	@Autowired
	private AccountCredentialManager accountCredentialManager;
	@Autowired
	private UserPublisher userPublisher;
	@Autowired
	private UserCache userCache;
	@Autowired
	private AccountAvatarManager accountAvatarManager;
	@Autowired
	private MessageHelper messageHelper;
	@Autowired
	private PersonInfoManager personInfoManager;

	@SuppressWarnings("unchecked")
	@RequestMapping("user-connector-list")
	public String list(@ModelAttribute Page page, @RequestParam Map<String, Object> parameterMap, Model model)
	{
		String tenantId = tenantHolder.getTenantId();
		Map<String, Object> parameters = ServletUtils.getParametersStartingWith(parameterMap, "filter_");

		// 缩小显示范围，把所有用户都显示出来也没什么用途
		if (parameters.isEmpty())
		{
			// 如果没有查询条件，就只返回配置了权限的用户
			String hql = "from UserStatus where tenantId=?";
			page = userStatusManager.pagedQuery(hql, page.getPageNo(), page.getPageSize(), tenantId);

			List<UserStatus> userStatuses = (List<UserStatus>) page.getResult();
			List<UserStatusDTO> userStatusDtos = new ArrayList<UserStatusDTO>();

			for (UserStatus userStatus : userStatuses)
			{
				userStatusDtos.add(userStatusConverter.createUserStatusDto(userStatus, tenantHolder.getUserRepoRef(), tenantHolder.getTenantId()));
			}

			page.setResult(userStatusDtos);
			model.addAttribute("page", page);
		}
		else
		{
			// 如果设置了查询条件，就根据条件查询
			page = userConnector.pagedQuery(tenantId, page, parameterMap);

			List<UserDTO> userDtos = (List<UserDTO>) page.getResult();
			List<UserStatusDTO> userStatusDtos = new ArrayList<UserStatusDTO>();

			for (UserDTO userDto : userDtos)
			{
				String usernameStr = userDto.getUsername();
				String hql = "from UserStatus where username=? and userRepoRef=?";
				UserStatus userStatus = userStatusManager.findUnique(hql, usernameStr, tenantHolder.getUserRepoRef());

				if (userStatus == null)
				{
					UserStatusDTO userStatusDto = new UserStatusDTO();
					userStatusDto.setUsername(usernameStr);
					userStatusDto.setEnabled(true);
					userStatusDto.setRef(userDto.getId());
					userStatusDtos.add(userStatusDto);
				}
				else
				{
					userStatusDtos.add(userStatusConverter.createUserStatusDto(userStatus, tenantHolder.getUserRepoRef(), tenantHolder.getTenantId()));
				}
			}

			page.setResult(userStatusDtos);
			model.addAttribute("page", page);
		}

		return "auth/user-connector-list";
	}

	@RequestMapping("user-connector-remove")
	public String remove(@RequestParam("selectedItem") List<Long> selectedItem, RedirectAttributes redirectAttributes)
	{
		String tenantId = tenantHolder.getTenantId();

		List<UserStatus> userStatuses = userStatusManager.findByIds(selectedItem);

		List<Long> ids = Lists.newArrayListWithExpectedSize(userStatuses.size());
		for(UserStatus status : userStatuses) {
			ids.add(Long.parseLong(status.getRef()));
		}

		List<AccountInfo> accountInfos = accountInfoManager.findByIds(ids);

		for (AccountInfo accountInfo : accountInfos)
		{
			for (AccountCredential accountCredential : accountInfo.getAccountCredentials())
			{
				accountCredentialManager.remove(accountCredential);
			}

			for (AccountAvatar accountAvatar : accountInfo.getAccountAvatars())
			{
				accountAvatarManager.remove(accountAvatar);
			}

			accountInfoManager.remove(accountInfo);

			UserDTO userDto = new UserDTO();
			userDto.setId(Long.toString(accountInfo.getId()));
			userDto.setUsername(accountInfo.getUsername());
			userDto.setRef(accountInfo.getCode());
			userDto.setUserRepoRef(tenantId);
			userCache.removeUser(userDto);
			userPublisher.notifyUserRemoved(this.convertUserDto(accountInfo));
		}

		messageHelper.addFlashMessage(redirectAttributes, "core.success.delete", "删除成功");

		return "redirect:/auth/user-connector-list.do#config&user";
	}

	@RequestMapping("user-connector-configRole")
	public String configRole(@RequestParam("ref") String ref)
	{
		logger.debug("ref : {}", ref);

		UserDTO userDto = userConnector.findById(ref);
		Long id = null;

		if (userDto != null)
		{
			String username = userDto.getUsername();

			UserStatus userStatus = authService.createOrGetUserStatus(username, userDto.getId(), tenantHolder.getUserRepoRef(), tenantHolder.getTenantId());

			id = userStatus.getId();
		}

		return "redirect:/auth/user-role-input.do?id=" + id;
	}

	// ~ ======================================================================
	@Resource
	public void setUserStatusManager(UserStatusManager userStatusManager)
	{
		this.userStatusManager = userStatusManager;
	}

	@Resource
	public void setUserStatusConverter(UserStatusConverter userStatusConverter)
	{
		this.userStatusConverter = userStatusConverter;
	}

	@Resource
	public void setUserConnector(UserConnector userConnector)
	{
		this.userConnector = userConnector;
	}

	@Resource
	public void setAuthService(AuthService authService)
	{
		this.authService = authService;
	}

	@Resource
	public void setTenantHolder(TenantHolder tenantHolder)
	{
		this.tenantHolder = tenantHolder;
	}

	public UserDTO convertUserDto(AccountInfo accountInfo)
	{
		String hql = "from PersonInfo where code=? and tenantId=?";
		PersonInfo personInfo = personInfoManager.findUnique(hql, accountInfo.getCode(), accountInfo.getTenantId());

		UserDTO userDto = new UserDTO();
		userDto.setId(Long.toString(accountInfo.getId()));
		userDto.setUsername(accountInfo.getUsername());
		userDto.setDisplayName(accountInfo.getDisplayName());
		userDto.setNickName(accountInfo.getNickName());
		userDto.setUserRepoRef(accountInfo.getTenantId());

		if (personInfo != null)
		{
			userDto.setEmail(personInfo.getEmail());
			userDto.setMobile(personInfo.getCellphone());
		}

		return userDto;
	}

}
