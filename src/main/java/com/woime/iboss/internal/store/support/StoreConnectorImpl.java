package com.woime.iboss.internal.store.support;

import javax.activation.DataSource;
import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.woime.iboss.api.store.StoreConnector;
import com.woime.iboss.api.store.StoreDTO;
import com.woime.iboss.internal.store.persistence.domain.StoreInfo;
import com.woime.iboss.internal.store.persistence.manager.StoreInfoManager;
import com.woime.iboss.internal.store.service.StoreService;
import com.woime.iboss.spi.store.InternalStoreConnector;

public class StoreConnectorImpl implements StoreConnector
{
	private Logger logger = LoggerFactory.getLogger(StoreConnectorImpl.class);
	private StoreService storeService;
	private StoreInfoManager storeInfoManager;
	private InternalStoreConnector internalStoreConnector;

	public StoreDTO saveStore(String model, DataSource dataSource, String tenantId) throws Exception
	{
		return storeService.saveStore(model, dataSource, tenantId);
	}

	public StoreDTO saveStore(String model, String key, DataSource dataSource, String tenantId) throws Exception
	{
		return storeService.saveStore(model, key, dataSource, tenantId);
	}

	public StoreDTO getStore(String model, String key, String tenantId) throws Exception
	{
		StoreDTO storeDto = internalStoreConnector.getStore(model, key, tenantId);

		if (storeDto == null)
		{
			return null;
		}

		StoreInfo storeInfo = storeInfoManager.findUnique("from StoreInfo where path=? and tenantId=?", key, tenantId);

		if (storeInfo == null)
		{
			storeDto.setDisplayName(key);
		}
		else
		{
			storeDto.setDisplayName(storeInfo.getName());
		}

		return storeDto;
	}

	public void removeStore(String model, String key, String tenantId) throws Exception
	{
		internalStoreConnector.removeStore(model, key, tenantId);
	}

	@Resource
	public void setStoreService(StoreService storeService)
	{
		this.storeService = storeService;
	}

	@Resource
	public void setStoreInfoManager(StoreInfoManager storeInfoManager)
	{
		this.storeInfoManager = storeInfoManager;
	}

	@Resource
	public void setInternalStoreConnector(InternalStoreConnector internalStoreConnector)
	{
		this.internalStoreConnector = internalStoreConnector;
	}
}
