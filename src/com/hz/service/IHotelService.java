package com.hz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.Hotel;

public interface IHotelService {
	
	public List<Hotel> getHotelList();
	
	public Long getHotelListTotal();
	
	public List<Hotel> getHotelList2();
	
	public List<Hotel> getHotelList3(Integer currentPage);
	
	public List<Hotel> getHotHotelList();
	
	public List<Hotel> getHotelListById(int id);
	
	public void deleteHotel(int id);
	
	public void saveHotel(Hotel hotel);
	
	public void update_hotelphoto(Hotel hotel);
	
	public void update_Hotel(Hotel hotel);
	
	public Hotel getHotelById(int id);

}
