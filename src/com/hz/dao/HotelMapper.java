package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.Hotel;

public interface HotelMapper {
	
	public List<Hotel> getHotelList();
	
	public Long getHotelListTotal();
	
	public List<Hotel> getHotelList2();
	
	public List<Hotel> getHotelList3();
	
	public List<Hotel> getHotHotelList();

	public List<Hotel> getHotelListById(@Param("id") int id);
	
	public void deleteHotel(@Param("id") int id);
	
	public void saveHotel(@Param("hotel")Hotel hotel);
	
	public void update_hotelphoto(@Param("hotel")Hotel hotel);
	
	public void update_Hotel(@Param("hotel")Hotel hotel);
	
	public Hotel getHotelById(@Param("id") int id);
}
