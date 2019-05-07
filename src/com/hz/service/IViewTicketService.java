package com.hz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.View;
import com.hz.model.ViewTicket;

public interface IViewTicketService {
	
	public List<ViewTicket> getViewTicketList();
	
	public List<ViewTicket> getViewShopping(Integer currentPage);
	
	public List<ViewTicket> getViewShopping2();
	
	public List<ViewTicket> getViewTicketByID(int id);
	
	public List<ViewTicket> getViewTicketByTID(int id);
	
	public List<ViewTicket> getViewTicketList_1();
	
	public Long getViewTicketListTotal();
	
	public List<ViewTicket> getViewTicketList_2(int id);
	
	public Long getViewTicketListTotal2(int id);
	
	public void deleteViewTicket(int id);
	
	public void saveViewTicket(ViewTicket viewTicket);
	
	public ViewTicket getViewTicketById(int id);
	
	public void updateViewTicket(ViewTicket viewTicket);
	
	public ViewTicket getViewTicketByTID2(int id);
	
	public List<ViewTicket> getTicketListByTname(String tname,Integer currentPage);
	
	public ViewTicket getSalesById(int id);
	
	public void updateViewTicketSales(ViewTicket viewTicket2);

	

}
