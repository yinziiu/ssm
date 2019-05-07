package com.hz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hz.dao.ViewTypeMapper;
import com.hz.model.ViewType;
import com.hz.service.IViewTypeService;

@Service
public class ViewTypeService implements IViewTypeService {
	
	@Autowired 
	private ViewTypeMapper viewTypeMapper;

	@Override
	public List<ViewType> getViewTypeList() {
		return viewTypeMapper.getViewTypeList();
	}

	@Override
	public Long getViewTypeListTotal() {
		return viewTypeMapper.getViewTypeListTotal();
	}

	@Override
	public void saveViewType(ViewType viewtype) {
		viewTypeMapper.saveViewType(viewtype);
	}

	@Override
	public ViewType CheckViewType(ViewType viewtype) {
		return viewTypeMapper.CheckViewType(viewtype);
	}

	@Override
	public ViewType getViewTypeById(int id) {
		return viewTypeMapper.getViewTypeById(id);
	}

	@Override
	public void updateViewType(ViewType viewtype) {
		viewTypeMapper.updateViewType(viewtype);
	}

	@Override
	public void deleteViewType(int id) {
		viewTypeMapper.deleteViewType(id);
	}

}
