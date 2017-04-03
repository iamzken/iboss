package com.woime.iboss.alarm.persistence.domain;

import java.io.Serializable;

/**
 * 绩效报告模板
 * @author 王国栋
 *
 */
public class KPIReportTemplate implements Serializable
{
	private static final long serialVersionUID = 1L;
	
	private Long id;
	private String name;
	/**
	 * 0-小时报 1-周报 2-月报
	 */
	private Integer type;
	
}
