package com.woime.iboss.user.support;

import java.util.Collections;
import java.util.List;

import com.woime.iboss.api.userrepo.UserRepoConnector;
import com.woime.iboss.api.userrepo.UserRepoDTO;

public class MockUserRepoConnector implements UserRepoConnector
{
	private UserRepoDTO userRepoDto = new UserRepoDTO();

	public MockUserRepoConnector()
	{
		userRepoDto.setId("1");
		userRepoDto.setCode("default");
	}

	public UserRepoDTO findById(String id)
	{
		return userRepoDto;
	}

	public UserRepoDTO findByCode(String code)
	{
		return userRepoDto;
	}

	public List<UserRepoDTO> findAll()
	{
		return Collections.singletonList(userRepoDto);
	}
}
