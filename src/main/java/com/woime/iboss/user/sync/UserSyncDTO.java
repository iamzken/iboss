package com.woime.iboss.user.sync;

public interface UserSyncDTO
{
	String getId();

	boolean hasModified(UserSyncDTO userSyncDto);
}
