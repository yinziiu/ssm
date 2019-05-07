package com.hz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.HotelOrder;

public interface IHotelOrderService {
	
	public List<HotelOrder> getHotelOrderList();
	
	public Long getHotelOrderListtotal();

	public List<HotelOrder> getHotelOrderListByUId(int id);
	
	public List<HotelOrder> getHotelOrderListById(int id);
	
	public Long getHotelOrderTotalByUId(int id);
	
	public HotelOrder getHotelOrderListById2(int id);
	
	public void saveHotelOrder(HotelOrder hotelOrder);
	
	public void updateStatus(HotelOrder hotelOrder);
	
	public void deleteHotelOrder(int id);
	
}

