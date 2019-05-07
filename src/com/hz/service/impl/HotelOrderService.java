package com.hz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hz.dao.HotelOrderMapper;
import com.hz.model.HotelOrder;
import com.hz.service.IHotelOrderService;

@Service
public class HotelOrderService implements IHotelOrderService {
	
	@Autowired
	private HotelOrderMapper hotelOrderMapper;

	@Override
	public List<HotelOrder> getHotelOrderList() {
		return hotelOrderMapper.getHotelOrderList();
	}

	@Override
	public Long getHotelOrderListtotal() {
		return hotelOrderMapper.getHotelOrderListtotal();
	}

	@Override
	public List<HotelOrder> getHotelOrderListByUId(int id) {
		return hotelOrderMapper.getHotelOrderListByUId(id);
	}

	@Override
	public List<HotelOrder> getHotelOrderListById(int id) {
		return hotelOrderMapper.getHotelOrderListById(id);
	}

	@Override
	public Long getHotelOrderTotalByUId(int id) {
		return hotelOrderMapper.getHotelOrderTotalByUId(id);
	}

	@Override
	public HotelOrder getHotelOrderListById2(int id) {
		return hotelOrderMapper.getHotelOrderListById2(id);
	}

	@Override
	public void saveHotelOrder(HotelOrder hotelOrder) {
		hotelOrderMapper.saveHotelOrder(hotelOrder);
	}

	@Override
	public void updateStatus(HotelOrder hotelOrder) {
		hotelOrderMapper.updateStatus(hotelOrder);
	}

	@Override
	public void deleteHotelOrder(int id) {
		hotelOrderMapper.deleteHotelOrder(id);
	}
}
