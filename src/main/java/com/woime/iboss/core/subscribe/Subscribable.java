package com.woime.iboss.core.subscribe;

public interface Subscribable<T>
{
	void handleMessage(T message);

	boolean isTopic();

	String getName();
}
