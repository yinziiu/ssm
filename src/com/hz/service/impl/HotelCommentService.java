package com.hz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.github.pagehelper.PageHelper;
import com.hz.dao.HotelCommentMapper;
import com.hz.model.HotelComment;
import com.hz.service.IHotelCommentService;

@Controller
public class HotelCommentService implements IHotelCommentService {
	
	@Autowired
	private HotelCommentMapper hotelCommentMapper;

	@Override
	public List<HotelComment> getHotelCommentList() {
		return hotelCommentMapper.getHotelCommentList();
	}

	@Override
	public Long getHotelCommentListtotal() {
		return hotelCommentMapper.getHotelCommentListtotal();
	}

	@Override
	public List<HotelComment> getHotelCommentList2() {
		return hotelCommentMapper.getHotelCommentList2();
	}

	@Override
	public List<HotelComment> getHotelCommentByUId(int id) {
		return hotelCommentMapper.getHotelCommentByUId(id);
	}

	@Override
	public Long getHotelCommentTotalByUId(int id) {
		return hotelCommentMapper.getHotelCommentTotalByUId(id);
	}
	
	@Override
	public List<HotelComment> getHotelComment2ByUId(int id) {
		return hotelCommentMapper.getHotelComment2ByUId(id);
	}

	@Override
	public void deleteHComment(int id) {
		hotelCommentMapper.deleteHComment(id);
	}
	
	//酒店点评
	@Override
	public List<HotelComment> getHotelCommentListById(int id,Integer currentPage) {
		PageHelper.startPage(currentPage, 10);
		return hotelCommentMapper.getHotelCommentListById(id);
	}

	//酒店点评总数
	@Override
	public Long getHotelCommentListTotalById(int id) {
		return hotelCommentMapper.getHotelCommentListTotalById(id);
	}

}
