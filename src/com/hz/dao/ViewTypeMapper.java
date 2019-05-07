package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.ViewType;

public interface ViewTypeMapper {
	
	public List<ViewType> getViewTypeList();
	
	public Long getViewTypeListTotal();
	
	public void saveViewType(@Param("viewtype") ViewType viewtype);
	
	public ViewType CheckViewType(@Param("viewtype") ViewType viewtype);
	
	public ViewType getViewTypeById(@Param("id") int id);
	
	public void updateViewType(@Param("viewtype") ViewType viewtype);
	
	public void deleteViewType(@Param("id") int id);
	
}
