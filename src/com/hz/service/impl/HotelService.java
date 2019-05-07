package com.hz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.hz.dao.HotelMapper;
import com.hz.model.Hotel;
import com.hz.service.IHotelService;

@Service
public class HotelService implements IHotelService {
	
	@Autowired
	private HotelMapper hotelMapper;

	@Override
	public List<Hotel> getHotelList() {
		return hotelMapper.getHotelList();
	}

	@Override
	public Long getHotelListTotal() {
		return hotelMapper.getHotelListTotal();
	}
	
	@Override
	public List<Hotel> getHotelList2() {
		return hotelMapper.getHotelList2();
	}

	@Override
	public List<Hotel> getHotelList3(Integer currentPage) {
		PageHelper.startPage(currentPage, 10);
		return hotelMapper.getHotelList3();
	}

	@Override
	public List<Hotel> getHotHotelList() {
		return hotelMapper.getHotHotelList();
	}

	@Override
	public List<Hotel> getHotelListById(int id) {
		return hotelMapper.getHotelListById(id);
	}

	@Override
	public void deleteHotel(int id) {
		hotelMapper.deleteHotel(id);
	}

	@Override
	public void saveHotel(Hotel hotel) {
		hotelMapper.saveHotel(hotel);
	}

	@Override
	public void update_hotelphoto(Hotel hotel) {
		hotelMapper.update_hotelphoto(hotel);
	}

	@Override
	public void update_Hotel(Hotel hotel) {
		hotelMapper.update_Hotel(hotel);
	}

	@Override
	public Hotel getHotelById(int id) {
		return hotelMapper.getHotelById(id);
	}

}
