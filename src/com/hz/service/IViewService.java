package com.hz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.View;
import com.hz.model.ViewImages;

public interface IViewService {
	
	public List<View> findViewList();
	
	public Long getViewListtotal();
	
	public List<View> getbiyoutop5();
	
	public List<View> getrementop();
	
	public List<View> findViewList2(Integer currentPage);
	
	public List<View> getViewName();
	
	public List<View> getViewDetailByID(int id);
	
	public View getViewListById(int id);
	
	public List<View> getHotViewList();
	
	public List<View> getHotViewList2();
	
	public void deleteView(int id);
	
	public String getViewIntroById(int id);
	
	public String getViewTicketById(int id);
	
	public String getViewTrafficById(int id);
	
	public void saveView(View view);
	
	public void saveViewPhoto(ViewImages viewImages);
	
	public void update_vphoto(View view);
	
	public void updateView(View view);
	
	public void updatevreadnum(int id,int vreadnum);
	
	public List<ViewImages> getViewImages(int id);
	

}
