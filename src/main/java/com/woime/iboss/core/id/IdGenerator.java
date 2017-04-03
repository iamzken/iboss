package com.woime.iboss.core.id;

public interface IdGenerator
{
	long generateId();

	long generateId(String name);

	long generateId(Class<?> clz);
}
