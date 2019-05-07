package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.ViewOrder;

public interface ViewOrderMapper {
	
	public List<ViewOrder> getViewOrderList();
	
	public Long getViewOrderListtotal();
	
	public List<ViewOrder> getViewOrderListByUID(@Param("id") int id);
	
	public List<ViewOrder> getViewOrderListById(@Param("id") int id);
	
	
	public void deleteViewOrder(@Param("id") int id);
	
	public ViewOrder getViewOrderListById2(@Param("id") int id);
	
	public void UpdateViewOrder(@Param("viewOrder") ViewOrder viewOrder);
	
	public Long getViewOrderTotalByUID(@Param("id") int id);
	
	public void saveViewTicket(@Param("viewOrder") ViewOrder viewOrder);
	
	public void updateStatus(@Param("viewOrder") ViewOrder viewOrder);

}
