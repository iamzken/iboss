package com.woime.iboss.cms.web;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.woime.iboss.cms.export.NewsExporter;

@Controller
@RequestMapping("/cms")
public class CmsExportController
{
	private JdbcTemplate jdbcTemplate;
	private String baseDir;

	@RequestMapping("doExport")
	public void doExport() throws Exception
	{
		new NewsExporter().doExport(new File(baseDir), jdbcTemplate);
	}

	@Resource
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate)
	{
		this.jdbcTemplate = jdbcTemplate;
	}

	@Value("${store.baseDir}")
	public void setBaseDir(String baseDir)
	{
		this.baseDir = baseDir;
	}
}
