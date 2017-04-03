package com.woime.iboss.operation.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.woime.iboss.api.form.FormConnector;
import com.woime.iboss.api.form.FormDTO;
import com.woime.iboss.api.keyvalue.KeyValueConnector;
import com.woime.iboss.api.keyvalue.Record;
import com.woime.iboss.api.keyvalue.RecordBuilder;
import com.woime.iboss.api.store.StoreConnector;
import com.woime.iboss.api.tenant.TenantHolder;
import com.woime.iboss.core.MultipartHandler;
import com.woime.iboss.core.export.Exportor;
import com.woime.iboss.core.mapper.BeanMapper;
import com.woime.iboss.core.mapper.JsonMapper;
import com.woime.iboss.core.spring.MessageHelper;
import com.woime.iboss.core.util.EncodeUtils;
import com.woime.iboss.xform.Xform;
import com.woime.iboss.xform.XformBuilder;

@Controller
@RequestMapping("operation")
public class FormOperationController
{
	private static Logger logger = LoggerFactory.getLogger(FormOperationController.class);
	private Exportor exportor;
	private BeanMapper beanMapper = new BeanMapper();
	private JsonMapper jsonMapper = new JsonMapper();
	private MessageHelper messageHelper;
	private KeyValueConnector keyValueConnector;
	private MultipartResolver multipartResolver;
	private StoreConnector storeConnector;
	private FormConnector formConnector;
	private TenantHolder tenantHolder;

	@RequestMapping("form-operation-preview")
	public String preview(@RequestParam("code") String code, Model model) throws Exception
	{
		String tenantId = tenantHolder.getTenantId();
		FormDTO formDto = formConnector.findForm(code, tenantId);
		Record record = keyValueConnector.findByRef(code);

		if (record == null)
		{
			record = new Record();
			record.setName(formDto.getName());
			record.setRef(formDto.getCode());
			keyValueConnector.save(record);
		}

		model.addAttribute("record", record);

		Xform xform = new XformBuilder().setStoreConnector(storeConnector).setContent(formDto.getContent()).setRecord(record).build();
		model.addAttribute("xform", xform);

		return "operation/form-operation-preview";
	}

	@RequestMapping("form-operation-test")
	public String test(HttpServletRequest request) throws Exception
	{
		String tenantId = tenantHolder.getTenantId();
		MultipartHandler multipartHandler = new MultipartHandler(multipartResolver);
		FormDTO formDto = null;

		try
		{
			multipartHandler.handle(request);
			logger.info("{}", multipartHandler.getMultiValueMap());
			logger.info("{}", multipartHandler.getMultiFileMap());

			String ref = multipartHandler.getMultiValueMap().getFirst("ref");

			formDto = formConnector.findForm(ref, tenantId);

			Record record = keyValueConnector.findByRef(ref);

			record = new RecordBuilder().build(record, multipartHandler, storeConnector, tenantId);

			keyValueConnector.save(record);
		}
		finally
		{
			multipartHandler.clear();
		}

		if (formDto == null)
		{
			return "redirect:/form/form-template-list.do";
		}
		else
		{
			return "redirect:/operation/form-operation-preview.do?code=" + EncodeUtils.urlEncode(formDto.getCode());
		}
	}

	// ~ ======================================================================
	@Resource
	public void setExportor(Exportor exportor)
	{
		this.exportor = exportor;
	}

	@Resource
	public void setMessageHelper(MessageHelper messageHelper)
	{
		this.messageHelper = messageHelper;
	}

	@Resource
	public void setKeyValueConnector(KeyValueConnector keyValueConnector)
	{
		this.keyValueConnector = keyValueConnector;
	}

	@Resource
	public void setMultipartResolver(MultipartResolver multipartResolver)
	{
		this.multipartResolver = multipartResolver;
	}

	@Resource
	public void setStoreConnector(StoreConnector storeConnector)
	{
		this.storeConnector = storeConnector;
	}

	@Resource
	public void setFormConnector(FormConnector formConnector)
	{
		this.formConnector = formConnector;
	}

	@Resource
	public void setTenantHolder(TenantHolder tenantHolder)
	{
		this.tenantHolder = tenantHolder;
	}
}
