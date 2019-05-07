package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.HotelOrder;

public interface HotelOrderMapper {
	
	public List<HotelOrder> getHotelOrderList();
	
	public Long getHotelOrderListtotal();
	
	public List<HotelOrder> getHotelOrderListByUId(@Param("id")int id);
	
	public List<HotelOrder> getHotelOrderListById(@Param("id")int id);
	
	public Long getHotelOrderTotalByUId(@Param("id")int id);
	
	public HotelOrder getHotelOrderListById2(@Param("id")int id);
	
	public void saveHotelOrder(@Param("hotelOrder") HotelOrder hotelOrder);
	
	public void updateStatus(@Param("hotelOrder") HotelOrder hotelOrder);
	
	public void deleteHotelOrder(@Param("id")int id);

}
