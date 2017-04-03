package com.woime.iboss.android.rs;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.woime.iboss.cms.persistence.domain.CmsArticle;
import com.woime.iboss.cms.persistence.manager.CmsArticleManager;
import com.woime.iboss.core.mapper.JsonMapper;
import com.woime.iboss.core.util.BaseDTO;

@Component
@Path("android/cms")
public class AndroidCmsResource
{
	private static Logger logger = LoggerFactory.getLogger(AndroidCmsResource.class);
	private JsonMapper jsonMapper = new JsonMapper();
//	private TenantHolder tenantHolder;
	private CmsArticleManager cmsArticleManager;

	@SuppressWarnings("unchecked")
	@POST
	@Path("articles")
	@Produces(MediaType.APPLICATION_JSON)
	public BaseDTO articles() throws Exception
	{
		logger.info("start");

		String tenantId = "1";
		String hql = "from CmsArticle where tenantId=? order by createTime desc";
		List<CmsArticle> cmsArticles = cmsArticleManager.find(hql, tenantId);

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		for (CmsArticle cmsArticle : cmsArticles)
		{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("title", cmsArticle.getTitle());
			map.put("content", cmsArticle.getContent());
			list.add(map);
		}

		String json = jsonMapper.toJson(list);
		BaseDTO result = new BaseDTO();
		result.setCode(200);
		result.setData(json);
		logger.info("end");

		return result;
	}

	// ~ ======================================================================
	@Resource
	public void setCmsArticleManager(CmsArticleManager cmsArticleManager)
	{
		this.cmsArticleManager = cmsArticleManager;
	}

//	@Resource
//	public void setTenantHolder(TenantHolder tenantHolder)
//	{
//		this.tenantHolder = tenantHolder;
//	}
}
