package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.View;
import com.hz.model.ViewComment;

public interface ViewCommentMapper {
	
	public List<ViewComment> getViewCommentList();
	
	public Long getViewCommentListtotal();
	
	public List<ViewComment> getViewCommentList2();
	
	public List<ViewComment> getViewCommentByID(@Param("id") int id);
	
	public Long getViewCommentTotalByID(@Param("id") int id);
	
	public Long getViewCommentTotalByUId(@Param("id") int id);
	
	public List<ViewComment> getViewCommentByUId(@Param("id") int id);
	
	public List<ViewComment> getViewComment2ByUId(@Param("id") int id);
	
	public void deleteVComment(@Param("id") int id);
	
	public ViewComment getViewCommentByUIdandVid(@Param("viewComment")ViewComment viewComment);
	
	public ViewComment getViewCommentByUIdandVid2(@Param("uid")int uid,@Param("id")int id);
	
	public void saveViewComment(@Param("viewComment")ViewComment viewComment);
	
	public void updateViewComment(@Param("viewComment")ViewComment viewComment);
	
	public void updateViewCommentPhoto(@Param("viewComment")ViewComment viewComment);

}
