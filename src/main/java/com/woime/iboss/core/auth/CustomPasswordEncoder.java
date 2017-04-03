package com.woime.iboss.core.auth;

public interface CustomPasswordEncoder
{
	String encode(CharSequence rawPassword);

	boolean matches(CharSequence rawPassword, String encodedPassword);
}
