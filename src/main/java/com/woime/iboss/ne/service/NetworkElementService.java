package com.woime.iboss.ne.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.woime.iboss.api.keyvalue.KeyValueConnector;
import com.woime.iboss.api.keyvalue.Prop;
import com.woime.iboss.api.keyvalue.Record;
import com.woime.iboss.core.page.Page;
import com.woime.iboss.core.query.MatchType;
import com.woime.iboss.core.query.PropertyFilter;
import com.woime.iboss.ne.persistence.domain.NetworkElement;
import com.woime.iboss.ne.persistence.domain.NetworkTemplate;
import com.woime.iboss.ne.persistence.manager.NetworkElementManager;
import com.woime.iboss.ne.persistence.manager.NetworkTemplateManager;

/**
 * 网元的业务服务接口。
 * 
 * @author 王国栋
 *
 */
@Transactional
@Service
public class NetworkElementService
{
	private NetworkElementManager neManager;
	private NetworkTemplateManager neTemplateManager;
	private KeyValueConnector keyValueConnector;
	
	@Resource
	public void setNeManager(NetworkElementManager neManager)
	{
		this.neManager = neManager;
	}

	/**
	 * 根据条件 查询网元对象的例子
	 * 
	 * @param page
	 * @param propertyFilters
	 * @return
	 */
	public Page queryByFiltersPageAble(Page page, List<PropertyFilter> propertyFilters)
	{
		return neManager.pagedQuery(page, propertyFilters);
	}

	/**
	 * 创建新实体
	 * @param parentId
	 * @param ne
	 */
	public void create(Long parentId, NetworkElement ne)
	{
		ne.setParentId(parentId);
		neManager.save(ne);
		Record record = ne.getRecord();
		if (record != null)
		{
			record.setRef(String.valueOf(ne.getId()));
			Map<String, Prop> props = record.getProps();
			if (props != null)
			{
				Iterator<Entry<String, Prop>> it = props.entrySet().iterator();
				Entry<String, Prop> en;
				Prop pro;
				String code;
				while (it.hasNext())
				{
					en = it.next();
					pro = en.getValue();
					code = en.getKey();
					pro.setCode(code);
				}
			}
			keyValueConnector.save(ne.getRecord());
		}
	}

	/**
	 * 删除实体
	 * @param neId
	 */
	public void remove(Long neId)
	{
		if (neId != null)
		{
			NetworkElement ne = neManager.get(neId);
			if (ne != null)
			{
				neManager.removeById(neId);
				if (ne.getRecord() != null)
				{
					keyValueConnector.removeByCode(ne.getRecord().getCode());
				}
			}
		}
	}

	/**
	 * 更新实体
	 * @param ne
	 * @return
	 */
	public NetworkElement update(NetworkElement ne)
	{
		if (ne != null && ne.getId() != null)
		{
			neManager.update(ne);
			Record record = ne.getRecord();
			if (record != null)
			{
				record.setRef(String.valueOf(ne.getId()));
				Map<String, Prop> props = record.getProps();
				if (props != null)
				{
					Iterator<Entry<String, Prop>> it = props.entrySet().iterator();
					Entry<String, Prop> en;
					Prop pro;
					String code;
					while (it.hasNext())
					{
						en = it.next();
						pro = en.getValue();
						code = en.getKey();
						pro.setCode(code);
					}
				}
				keyValueConnector.save(ne.getRecord());
			}
			return ne;
		}
		return null;
	}

	/**
	 * 查询所有下层实体
	 * @param parentId	为null返回所有顶层根节点
	 * @return
	 */
	public List<NetworkElement> queryTreeNodes(Long parentId)
	{
		return neManager.findBy("parentId", parentId, MatchType.EQ);
	}

	public List<NetworkElement> all() {
		return neManager.getAll();
	}

	public NetworkElement queryById(Long id)
	{
		if (id != null)
		{
			NetworkElement result = neManager.get(id);
			neManager.initialize(result);
			Record record = keyValueConnector.findByRef(String.valueOf(result.getId()));
			List list = neManager.findBy("parentId", id);
			if (record != null)
			{
				result.setRecord(record);
				result.setLeaf(list==null || list.size()==0 ? 1 : 0);
			}
		
			return result;
		}
		return null;
	}

	public List<NetworkTemplate> queryTemplates()
	{
		return neTemplateManager.getAll();
	}
	
	@Autowired
	public void setKeyValueConnector(KeyValueConnector keyValueConnector)
	{
		this.keyValueConnector = keyValueConnector;
	}

	public NetworkTemplateManager getNeTemplateManager()
	{
		return neTemplateManager;
	}

	@Autowired
	public void setNeTemplateManager(NetworkTemplateManager neTemplateManager)
	{
		this.neTemplateManager = neTemplateManager;
	}

}
