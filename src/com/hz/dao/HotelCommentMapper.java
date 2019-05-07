package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.HotelComment;

public interface HotelCommentMapper {
	
	public List<HotelComment> getHotelCommentList();
	
	public Long getHotelCommentListtotal();
	
	public List<HotelComment> getHotelCommentList2();
	
	public List<HotelComment> getHotelCommentByUId(@Param("id") int id);
	
	public Long getHotelCommentTotalByUId(@Param("id") int id);
	
	public List<HotelComment> getHotelComment2ByUId(@Param("id") int id);
	
	public void deleteHComment(@Param("id") int id);
	
	//酒店点评
	public List<HotelComment> getHotelCommentListById(@Param("id")int id);
	
	//酒店点评总数
	public Long getHotelCommentListTotalById(@Param("id")int id);
	

}
