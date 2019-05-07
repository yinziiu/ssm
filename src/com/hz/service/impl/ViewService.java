package com.hz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.hz.dao.ViewMapper;
import com.hz.model.View;
import com.hz.model.ViewImages;
import com.hz.service.IViewService;

@Service
public class ViewService implements IViewService {
	
	@Autowired
	ViewMapper viewMapper;

	@Override
	public List<View> findViewList() {
		return viewMapper.findViewList();
	}

	@Override
	public Long getViewListtotal() {
		return viewMapper.getViewListtotal();
	}

	@Override
	public List<View> getbiyoutop5() {
		return viewMapper.getbiyoutop5();
	}

	@Override
	public List<View> getrementop() {
		return viewMapper.getrementop();
	}
	
	@Override
	public List<View> findViewList2(Integer currentPage) {
		PageHelper.startPage(currentPage, 10);
		return viewMapper.findViewList2();
	}

	@Override
	public List<View> getViewName() {
		return viewMapper.getViewName();
	}

	@Override
	public List<View> getViewDetailByID(int id) {
		return viewMapper.getViewDetailByID(id);
	}

	@Override
	public List<View> getHotViewList() {
		return viewMapper.getHotViewList();
	}
	
	@Override
	public List<View> getHotViewList2() {
		return viewMapper.getHotViewList2();
	}

	@Override
	public void deleteView(int id) {
		viewMapper.deleteView(id);
	}

	@Override
	public String getViewIntroById(int id) {
		return viewMapper.getViewIntroById(id);
	}

	@Override
	public String getViewTicketById(int id) {
		return viewMapper.getViewTicketById(id);
	}

	@Override
	public View getViewListById(int id) {
		return viewMapper.getViewListById(id);
	}

	@Override
	public String getViewTrafficById(int id) {
		return viewMapper.getViewTrafficById(id);
	}

	@Override
	public void saveView(View view) {
		viewMapper.saveView(view);
	}

	@Override
	public void update_vphoto(View view) {
		viewMapper.update_vphoto(view);
	}

	@Override
	public void updateView(View view) {
		viewMapper.updateView(view);
	}

	@Override
	public void updatevreadnum(int id, int vreadnum) {
		viewMapper.updatevreadnum(id, vreadnum);
	}

	@Override
	public List<ViewImages> getViewImages(int id) {
		return viewMapper.getViewImages(id);
	}
	
	public void saveViewPhoto(ViewImages viewImages){
		 viewMapper.saveViewPhoto(viewImages);
	}

}
