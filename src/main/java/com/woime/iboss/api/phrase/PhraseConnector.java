package com.woime.iboss.api.phrase;

import java.util.List;

public interface PhraseConnector
{
	List<String> findByUserId(String userId);
}
