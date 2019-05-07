package com.hz.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.hz.dao.ViewTicketMapper;
import com.hz.model.ViewTicket;
import com.hz.service.IViewTicketService;

@Service
public class ViewTicketService  implements IViewTicketService{
	
	@Autowired
	private ViewTicketMapper viewTicketMapper;
	
	@Override
	public List<ViewTicket> getViewTicketList() {
		return viewTicketMapper.getViewTicketList();
	}
	
	@Override
	public List<ViewTicket> getViewShopping(Integer currentPage) {
		PageHelper.startPage(currentPage, 10);
		return viewTicketMapper.getViewShopping();
	}
	@Override
	public List<ViewTicket> getViewShopping2() {
		return viewTicketMapper.getViewShopping2();
	}

	@Override
	public List<ViewTicket> getViewTicketByID(int id) {
		return viewTicketMapper.getViewTicketByID(id);
	}
	
	@Override
	public List<ViewTicket> getViewTicketByTID(int id) {
		return viewTicketMapper.getViewTicketByTID(id);
	}

	@Override
	public List<ViewTicket> getViewTicketList_1() {
		return viewTicketMapper.getViewTicketList_1();
	}

	@Override
	public Long getViewTicketListTotal() {
		return viewTicketMapper.getViewTicketListTotal();
	}

	@Override
	public List<ViewTicket> getViewTicketList_2(int id) {
		return viewTicketMapper.getViewTicketList_2(id);
	}

	@Override
	public void deleteViewTicket(int id) {
		viewTicketMapper.deleteViewTicket(id);
	}

	@Override
	public Long getViewTicketListTotal2(int id) {
		return viewTicketMapper.getViewTicketListTotal2(id);
	}

	@Override
	public void saveViewTicket(ViewTicket viewTicket) {
		viewTicketMapper.saveViewTicket(viewTicket);
	}

	@Override
	public ViewTicket getViewTicketById(int id) {
		return viewTicketMapper.getViewTicketById(id);
	}

	@Override
	public void updateViewTicket(ViewTicket viewTicket) {
		viewTicketMapper.updateViewTicket(viewTicket);
	}

	@Override
	public ViewTicket getViewTicketByTID2(int id) {
		return viewTicketMapper.getViewTicketByTID2(id);
	}

	@Override
	public List<ViewTicket> getTicketListByTname(String tname,Integer currentPage) {
		PageHelper.startPage(currentPage, 10);
		return viewTicketMapper.getTicketListByTname(tname);
	}

	@Override
	public ViewTicket getSalesById(int id) {
		return viewTicketMapper.getSalesById(id);
	}

	@Override
	public void updateViewTicketSales(ViewTicket viewTicket2) {
		viewTicketMapper.updateViewTicketSales(viewTicket2);
	}


}
