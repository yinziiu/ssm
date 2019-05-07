package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.View;
import com.hz.model.ViewImages;

public interface ViewMapper {
	
	public List<View> findViewList();
	
	public Long getViewListtotal();
	
	public List<View> getbiyoutop5();
	
	public List<View> getrementop();
	
	public List<View> findViewList2();
	
	public List<View> getViewName();
	
	public List<View> getViewDetailByID(@Param("id") int id);
	
	public List<View> getHotViewList();
	
	public List<View> getHotViewList2();
	
	public void deleteView(@Param("id") int id);
	
	public String getViewIntroById(@Param("id") int id);
	
	public String getViewTicketById(@Param("id") int id);
	
	public String getViewTrafficById(@Param("id") int id);
	
	public View getViewListById(@Param("id") int id);
	
	public void saveView(@Param("view") View view);
	
	public void update_vphoto(@Param("view") View view);
	
	public void updateView(@Param("view") View view);
	
	public void updatevreadnum(@Param("id") int id,@Param("vreadnum") int vreadnum);
	
	public List<ViewImages> getViewImages(@Param("id") int id);
	
	public void saveViewPhoto(@Param("viewImages")ViewImages viewImages);
	

}
