package com.woime.iboss.android.rs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.ws.rs.FormParam;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.woime.iboss.api.user.UserConnector;
import com.woime.iboss.api.user.UserDTO;
import com.woime.iboss.core.mapper.JsonMapper;
import com.woime.iboss.core.util.BaseDTO;
import com.woime.iboss.msg.persistence.domain.MsgInfo;
import com.woime.iboss.msg.persistence.manager.MsgInfoManager;
import com.woime.iboss.pim.persistence.domain.PimDevice;
import com.woime.iboss.pim.persistence.manager.PimDeviceManager;

@Component
@Path("android/msg")
public class AndroidMsgResource
{
	private static Logger logger = LoggerFactory.getLogger(AndroidMsgResource.class);
	private JsonMapper jsonMapper = new JsonMapper();
//	private TenantHolder tenantHolder;
	private MsgInfoManager msgInfoManager;
	private UserConnector userConnector;
	private PimDeviceManager pimDeviceManager;

	@SuppressWarnings("unchecked")
	@POST
	@Path("msg")
	@Produces(MediaType.APPLICATION_JSON)
	public BaseDTO msg(@HeaderParam("sessionId") String sessionId) throws Exception
	{
		logger.info("start");

		PimDevice pimDevice = pimDeviceManager.findUniqueBy("sessionId", sessionId);

		if (pimDevice == null)
		{
			BaseDTO result = new BaseDTO();
			result.setCode(401);
			result.setMessage("auth fail");

			return result;
		}

		String userId = pimDevice.getUserId();
		String hql = "from MsgInfo where receiverId=? order by createTime desc";
		List<MsgInfo> msgInfos = msgInfoManager.find(hql, userId);

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		for (MsgInfo msgInfo : msgInfos)
		{
			UserDTO userDto = null;

			if ((msgInfo.getSenderId() != null) && (!"".equals(msgInfo.getSenderId())))
			{
				userDto = userConnector.findById(msgInfo.getSenderId());
			}

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("id", Long.toString(msgInfo.getId()));

			if (userDto != null)
			{
				map.put("senderUsername", userDto.getUsername());
			}
			else
			{
				map.put("senderUsername", "system");
			}

			map.put("content", msgInfo.getContent());
			list.add(map);
		}

		String json = jsonMapper.toJson(list);
		BaseDTO result = new BaseDTO();
		result.setCode(200);
		result.setData(json);
		logger.info("end");

		return result;
	}

	@POST
	@Path("view")
	@Produces(MediaType.APPLICATION_JSON)
	public BaseDTO view(@HeaderParam("sessionId") String sessionId, @FormParam("msgId") String msgId) throws Exception
	{
		logger.info("start");

		PimDevice pimDevice = pimDeviceManager.findUniqueBy("sessionId", sessionId);

		if (pimDevice == null)
		{
			BaseDTO result = new BaseDTO();
			result.setCode(401);
			result.setMessage("auth fail");

			return result;
		}

//		String userId = pimDevice.getUserId();
		MsgInfo msgInfo = msgInfoManager.get(Long.parseLong(msgId));

		UserDTO userDto = null;

		if ((msgInfo.getSenderId() != null) && (!"".equals(msgInfo.getSenderId())))
		{
			userDto = userConnector.findById(msgInfo.getSenderId());
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", Long.toString(msgInfo.getId()));

		if (userDto != null)
		{
			map.put("senderUsername", userDto.getUsername());
		}
		else
		{
			map.put("senderUsername", "system");
		}

		map.put("content", msgInfo.getContent());
		map.put("data", msgInfo.getData());

		String json = jsonMapper.toJson(map);

		BaseDTO result = new BaseDTO();
		result.setCode(200);
		result.setData(json);
		logger.info("end");

		return result;
	}

	// ~ ======================================================================
	@Resource
	public void setMsgInfoManager(MsgInfoManager msgInfoManager)
	{
		this.msgInfoManager = msgInfoManager;
	}

//	@Resource
//	public void setTenantHolder(TenantHolder tenantHolder)
//	{
//		this.tenantHolder = tenantHolder;
//	}

	@Resource
	public void setUserConnector(UserConnector userConnector)
	{
		this.userConnector = userConnector;
	}

	@Resource
	public void setPimDeviceManager(PimDeviceManager pimDeviceManager)
	{
		this.pimDeviceManager = pimDeviceManager;
	}
}
