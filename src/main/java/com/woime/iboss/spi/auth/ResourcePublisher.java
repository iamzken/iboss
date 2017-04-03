package com.woime.iboss.spi.auth;

public interface ResourcePublisher
{
	void publish();

	void publish(String message);
}
