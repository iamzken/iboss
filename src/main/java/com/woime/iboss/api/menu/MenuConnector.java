package com.woime.iboss.api.menu;

import java.util.List;

public interface MenuConnector
{
	List<MenuDTO> findMenus(String systemCode, String userId);

	List<MenuDTO> findSystemMenus(String userId);
}
