package com.hz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.github.pagehelper.PageHelper;
import com.hz.dao.ViewCommentMapper;
import com.hz.model.ViewComment;
import com.hz.service.IViewCommentService;

@Controller
public class ViewCommentService implements IViewCommentService {
	
	@Autowired
	private ViewCommentMapper viewCommentMapper;

	@Override
	public List<ViewComment> getViewCommentList() {
		return viewCommentMapper.getViewCommentList();
	}

	@Override
	public Long getViewCommentListtotal() {
		return viewCommentMapper.getViewCommentListtotal();
	}
	
	@Override
	public List<ViewComment> getViewCommentList2() {
		return viewCommentMapper.getViewCommentList2();
	}

	@Override
	public List<ViewComment> getViewCommentByID(int id,Integer currentPage) {
		PageHelper.startPage(currentPage, 10);
		return viewCommentMapper.getViewCommentByID(id);
	}

	@Override
	public Long getViewCommentTotalByID(int id) {
		return viewCommentMapper.getViewCommentTotalByID(id);
	}

	@Override
	public Long getViewCommentTotalByUId(int id) {
		return viewCommentMapper.getViewCommentTotalByUId(id);
	}

	@Override
	public List<ViewComment> getViewCommentByUId(int id) {
		return viewCommentMapper.getViewCommentByUId(id);
	}
	
	@Override
	public List<ViewComment> getViewComment2ByUId(int id) {
		return viewCommentMapper.getViewComment2ByUId(id);
	}

	@Override
	public void deleteVComment(int id) {
		viewCommentMapper.deleteVComment(id);
	}

	@Override
	public ViewComment getViewCommentByUIdandVid(ViewComment viewComment) {
		return viewCommentMapper.getViewCommentByUIdandVid(viewComment);
	}

	@Override
	public ViewComment getViewCommentByUIdandVid2(int uid,int id) {
		return viewCommentMapper.getViewCommentByUIdandVid2(uid,id);
	}
	
	@Override
	public void saveViewComment(ViewComment viewComment) {
		viewCommentMapper.saveViewComment(viewComment);
	}

	@Override
	public void updateViewComment(ViewComment viewComment) {
		viewCommentMapper.updateViewComment(viewComment);
	}

	@Override
	public void updateViewCommentPhoto(ViewComment viewComment) {
		viewCommentMapper.updateViewCommentPhoto(viewComment);
	}

}
