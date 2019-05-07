package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.ViewTicket;

public interface ViewTicketMapper {
	
	public List<ViewTicket> getViewTicketList();
	
	public List<ViewTicket> getViewShopping();
	
	public List<ViewTicket> getViewShopping2();
	
	public List<ViewTicket> getViewTicketByID(@Param("id") int id);
	
	public List<ViewTicket> getViewTicketByTID(@Param("id") int id);
	
	public ViewTicket getViewTicketByTID2(@Param("id") int id);
	
	public List<ViewTicket> getViewTicketList_1();
	
	public List<ViewTicket> getViewTicketList_2(@Param("id") int id);
	
	public Long getViewTicketListTotal();
	
	public Long getViewTicketListTotal2(@Param("id") int id);
	
	public void deleteViewTicket(@Param("id") int id);
	
	public void saveViewTicket(@Param("viewTicket")ViewTicket viewTicket);
	
	public ViewTicket getViewTicketById(@Param("id") int id);
	
	public void updateViewTicket(@Param("viewTicket")ViewTicket viewTicket);
	
	public List<ViewTicket> getTicketListByTname(@Param("tname")String tname);
	
	public ViewTicket getSalesById(@Param("id") int id);
	
	public void updateViewTicketSales(@Param("viewTicket2")ViewTicket viewTicket2);

}
