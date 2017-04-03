package com.woime.iboss.auth.component;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.woime.iboss.api.userauth.UserAuthCache;
import com.woime.iboss.api.userauth.UserAuthConnector;
import com.woime.iboss.api.userauth.UserAuthDTO;
import com.woime.iboss.auth.persistence.domain.Perm;
import com.woime.iboss.auth.persistence.domain.Role;
import com.woime.iboss.auth.persistence.domain.RoleDef;
import com.woime.iboss.auth.persistence.domain.UserStatus;

@Component
public class AuthCache
{
	private UserAuthCache userAuthCache;
	private UserAuthConnector userAuthConnector;

	public void evictUser(String userId)
	{
		UserAuthDTO userAuthDto = userAuthConnector.findById(userId, "1");
		userAuthCache.removeUserAuth(userAuthDto);
	}

	public void evictUserStatus(UserStatus userStatus)
	{
		UserAuthDTO userAuthDto = new UserAuthDTO();
		userAuthDto.setId(Long.toString(userStatus.getId()));
		userAuthDto.setUsername(userStatus.getUsername());
		userAuthDto.setRef(userStatus.getRef());
		userAuthDto.setTenantId(userStatus.getTenantId());
		userAuthCache.removeUserAuth(userAuthDto);
	}

	public void evictRole(Role role)
	{
		for (UserStatus userStatus : role.getUserStatuses())
		{
			evictUserStatus(userStatus);
		}
	}

	public void evictPerm(Perm perm)
	{
		for (RoleDef roleDef : perm.getRoleDefs())
		{
			for (Role role : roleDef.getRoles())
			{
				evictRole(role);
			}
		}
	}

	@Resource
	public void setUserAuthCache(UserAuthCache userAuthCache)
	{
		this.userAuthCache = userAuthCache;
	}

	@Resource
	public void setUserAuthConnector(UserAuthConnector userAuthConnector)
	{
		this.userAuthConnector = userAuthConnector;
	}
}
