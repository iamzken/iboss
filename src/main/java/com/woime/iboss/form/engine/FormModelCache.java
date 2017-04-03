package com.woime.iboss.form.engine;

import com.woime.iboss.form.engine.model.FormModel;

public interface FormModelCache
{
	FormModel getFormModel(String id);

	void setFormModel(FormModel formModel);
}
