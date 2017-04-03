package com.woime.iboss.android.rs;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
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
import com.woime.iboss.pim.persistence.domain.PimDevice;
import com.woime.iboss.pim.persistence.manager.PimDeviceManager;

@Component
@Path("android/user")
public class AndroidUserResource
{
	private static Logger logger = LoggerFactory.getLogger(AndroidUserResource.class);
	private JsonMapper jsonMapper = new JsonMapper();
//	private TenantHolder tenantHolder;
//	private MsgInfoManager msgInfoManager;
	private UserConnector userConnector;
	private PimDeviceManager pimDeviceManager;

	@POST
	@Path("profile")
	@Produces(MediaType.APPLICATION_JSON)
	public BaseDTO profile(@HeaderParam("sessionId") String sessionId) throws Exception
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
		UserDTO userDto = userConnector.findById(userId);

		Map<String, String> map = new HashMap<String, String>();
		map.put("username", userDto.getUsername());
		map.put("displayName", userDto.getDisplayName());
		map.put("email", userDto.getEmail());
		map.put("mobile", userDto.getMobile());

		String json = jsonMapper.toJson(map);
		BaseDTO result = new BaseDTO();
		result.setCode(200);
		result.setData(json);
		logger.info("end");

		return result;
	}

	// ~ ======================================================================
//	@Resource
//	public void setMsgInfoManager(MsgInfoManager msgInfoManager)
//	{
//		this.msgInfoManager = msgInfoManager;
//	}
//
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
