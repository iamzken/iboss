package com.woime.iboss.humantask.rule;

public interface RuleMatcher
{
	boolean matches(String text);

	String getValue(String text);
}
