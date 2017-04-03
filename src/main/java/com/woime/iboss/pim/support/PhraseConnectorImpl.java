package com.woime.iboss.pim.support;

import java.util.List;

import javax.annotation.Resource;

import com.woime.iboss.api.phrase.PhraseConnector;
import com.woime.iboss.pim.persistence.manager.PimPhraseManager;

public class PhraseConnectorImpl implements PhraseConnector
{
	private PimPhraseManager pimPhraseManager;

	public List<String> findByUserId(String userId)
	{
		return pimPhraseManager.find("select content from PimPhrase where userId=?", userId);
	}

	@Resource
	public void setPimPhraseManager(PimPhraseManager pimPhraseManager)
	{
		this.pimPhraseManager = pimPhraseManager;
	}
}
