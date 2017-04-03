package com.woime.iboss.user.notification;

import com.woime.iboss.user.persistence.domain.UserBase;

public interface UserNotification
{
	void insertUser(UserBase userBase);

	void updateUser(UserBase userBase);

	void removeUser(UserBase userBase);
}
