package com.hz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.ViewOrder;

public interface IViewOrderService {
	
	public List<ViewOrder> getViewOrderList();
	
	public Long getViewOrderListtotal();
	
	public List<ViewOrder> getViewOrderListByUID(int id);
	
	public List<ViewOrder> getViewOrderListById(int id);
	
	public void deleteViewOrder(int id);
	
	public ViewOrder getViewOrderListById2(int id);
	
	public void UpdateViewOrder(ViewOrder viewOrder);
	
	public Long getViewOrderTotalByUID(int id);
	
	public void saveViewTicket(ViewOrder viewOrder);
	
	public void updateStatus(ViewOrder viewOrder);

}
