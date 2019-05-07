package com.hz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.ViewComment;

public interface IViewCommentService {
	
	public List<ViewComment> getViewCommentList();
	
	public Long getViewCommentListtotal();
	
	public List<ViewComment> getViewCommentList2();

	public List<ViewComment> getViewCommentByID(int id,Integer currentPage);
	
	public Long getViewCommentTotalByID(int id);
	
	public Long getViewCommentTotalByUId(int id);
	
	public List<ViewComment> getViewCommentByUId(int id);
	
	public List<ViewComment> getViewComment2ByUId(int id);
	
	public void deleteVComment(int id);
	
	public ViewComment getViewCommentByUIdandVid(ViewComment viewComment);
	
	public ViewComment getViewCommentByUIdandVid2(int uid,int id);
	
	public void saveViewComment(ViewComment viewComment);
	
	public void updateViewComment(ViewComment viewComment);
	
	public void updateViewCommentPhoto(ViewComment viewComment);

}
