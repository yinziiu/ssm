package com.hz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.HotelComment;

public interface IHotelCommentService {
	
	public List<HotelComment> getHotelCommentList();
	
	public Long getHotelCommentListtotal();
	
	public List<HotelComment> getHotelCommentList2();
	
	public List<HotelComment> getHotelCommentByUId(int id);
	
	public Long getHotelCommentTotalByUId(int id);
	
	public List<HotelComment> getHotelComment2ByUId(int id);
	
	public void deleteHComment(int id);
	
	//酒店点评
	public List<HotelComment> getHotelCommentListById(int id,Integer currentPage);
	
	//酒店点评总数
	public Long getHotelCommentListTotalById(int id);


}
