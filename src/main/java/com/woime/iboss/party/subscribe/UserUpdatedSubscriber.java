package com.woime.iboss.party.subscribe;

import java.io.IOException;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.woime.iboss.api.user.UserDTO;
import com.woime.iboss.core.mapper.JsonMapper;
import com.woime.iboss.core.subscribe.Subscribable;

@Transactional
@Component("com.woime.iboss.party.subscribe.UserUpdatedSubscriber")
public class UserUpdatedSubscriber implements Subscribable<String>
{
	private static Logger logger = LoggerFactory.getLogger(UserUpdatedSubscriber.class);
	private String updatePartyEntitySql = "UPDATE PARTY_ENTITY SET NAME=? WHERE REF=? AND TYPE_ID=?";
	private JsonMapper jsonMapper = new JsonMapper();
	private String destinationName = "queue.user.sync.updated";
	private JdbcTemplate jdbcTemplate;

	public void handleMessage(String message)
	{
		logger.info("update party user : {}", message);

		try
		{
			UserDTO userDto = jsonMapper.fromJson(message, UserDTO.class);

			Long typeId = 1L;
			jdbcTemplate.update(updatePartyEntitySql, userDto.getUsername(), userDto.getId(), typeId);

			logger.info("update user : {}", message);
		}
		catch (IOException ex)
		{
			logger.error(ex.getMessage(), ex);
		}
	}

	public boolean isTopic()
	{
		return false;
	}

	public String getName()
	{
		return destinationName;
	}

	public void setDestinationName(String destinationName)
	{
		this.destinationName = destinationName;
	}

	@Resource
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}
}
