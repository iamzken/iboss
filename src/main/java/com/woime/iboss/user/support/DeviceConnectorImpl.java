package com.woime.iboss.user.support;

import java.util.Date;

import javax.annotation.Resource;

import com.woime.iboss.api.tenant.TenantHolder;
import com.woime.iboss.core.auth.CurrentUserHolder;
import com.woime.iboss.spi.device.DeviceConnector;
import com.woime.iboss.spi.device.DeviceDTO;
import com.woime.iboss.user.persistence.domain.AccountDevice;
import com.woime.iboss.user.persistence.domain.AccountInfo;
import com.woime.iboss.user.persistence.manager.AccountDeviceManager;
import com.woime.iboss.user.persistence.manager.AccountInfoManager;

public class DeviceConnectorImpl implements DeviceConnector
{
	private AccountDeviceManager accountDeviceManager;
	private AccountInfoManager accountInfoManager;
	private CurrentUserHolder currentUserHolder;
	private TenantHolder tenantHolder;

	public DeviceDTO findDevice(String code)
	{
		if (code == null)
		{
			return null;
		}

		AccountDevice accountDevice = accountDeviceManager.findUniqueBy("code", code);

		if (accountDevice == null)
		{
			return null;
		}

		DeviceDTO deviceDto = new DeviceDTO();
		deviceDto.setCode(accountDevice.getCode());
		deviceDto.setType(accountDevice.getType());
		deviceDto.setOs(accountDevice.getOs());
		deviceDto.setClient(accountDevice.getClient());
		deviceDto.setStatus(accountDevice.getStatus());

		return deviceDto;
	}

	public void saveDevice(DeviceDTO deviceDto)
	{
		if (deviceDto == null)
		{
			return;
		}

		if (deviceDto.getCode() == null)
		{
			return;
		}

		AccountDevice accountDevice = accountDeviceManager.findUniqueBy("code", deviceDto.getCode());
		Date now = new Date();

		if (accountDevice == null)
		{
			accountDevice = new AccountDevice();
			accountDevice.setCode(deviceDto.getCode());
			accountDevice.setType(deviceDto.getType());
			accountDevice.setOs(deviceDto.getOs());
			accountDevice.setClient(deviceDto.getClient());
			accountDevice.setCreateTime(now);
			accountDevice.setLastLoginTime(now);
			accountDevice.setStatus("new");
			accountDevice.setTenantId(tenantHolder.getTenantId());

			AccountInfo accountInfo = accountInfoManager.get(Long.parseLong(currentUserHolder.getUserId()));
			accountDevice.setAccountInfo(accountInfo);
		}
		else
		{
			accountDevice.setLastLoginTime(now);
		}

		accountDeviceManager.save(accountDevice);
	}

	@Resource
	public void setAccountDeviceManager(AccountDeviceManager accountDeviceManager)
	{
		this.accountDeviceManager = accountDeviceManager;
	}

	@Resource
	public void setAccountInfoManager(AccountInfoManager accountInfoManager)
	{
		this.accountInfoManager = accountInfoManager;
	}

	@Resource
	public void setCurrentUserHolder(CurrentUserHolder currentUserHolder)
	{
		this.currentUserHolder = currentUserHolder;
	}

	@Resource
	public void setTenantHolder(TenantHolder tenantHolder)
	{
		this.tenantHolder = tenantHolder;
	}
}
