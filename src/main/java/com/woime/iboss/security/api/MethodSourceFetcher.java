package com.woime.iboss.security.api;

import java.util.Map;

public interface MethodSourceFetcher
{
	Map<String, String> getSource(String type);
}
