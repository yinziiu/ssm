package com.hz.service;

import java.util.List;


import com.hz.model.ViewType;

public interface IViewTypeService {
	
	public List<ViewType> getViewTypeList();
	
	public Long getViewTypeListTotal();
	
	public void saveViewType(ViewType viewtype);
	
	public ViewType CheckViewType(ViewType viewtype);
	
	public ViewType getViewTypeById(int id);
	
	public void updateViewType(ViewType viewtype);
	
	public void deleteViewType(int id);

}
