package com.woime.iboss.party.support;

import java.util.ArrayList;
import java.util.List;

import com.woime.iboss.party.persistence.domain.PartyEntity;

public class PartyEntityConverter
{
	public List<PartyEntityDTO> createPartyEntityDtos(List<PartyEntity> partyEntities)
	{
		List<PartyEntityDTO> partyEntityDtos = new ArrayList<PartyEntityDTO>();

		for (PartyEntity partyEntity : partyEntities)
		{
			PartyEntityDTO partyEntityDto = new PartyEntityDTO();
			partyEntityDto.setId(partyEntity.getId());
			partyEntityDto.setType(partyEntity.getPartyType().getName());
			partyEntityDto.setName(partyEntity.getName());
			partyEntityDtos.add(partyEntityDto);
		}

		return partyEntityDtos;
	}
}
