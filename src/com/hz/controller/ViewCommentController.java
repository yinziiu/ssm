package com.hz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.hz.model.ViewComment;
import com.hz.model.layer.Json;
import com.hz.service.IViewCommentService;

@Controller
public class ViewCommentController {
	
	@Autowired
	private IViewCommentService viewCommentService;
	
	/**
    * 景点点评列表
    * @return
    */
   @RequestMapping("getViewCommentList")
   public ModelAndView listView(){
		ModelAndView mav = new ModelAndView();
		List<ViewComment> viewcommentList= viewCommentService.getViewCommentList();
		Long totalList = viewCommentService.getViewCommentListtotal();
		// 放入转发参数
		mav.addObject("viewcommentList", viewcommentList);
		mav.addObject("totalList", totalList);
		// 放入jsp路径
		mav.setViewName("admin/comment/vcomment-list");
		return mav;
	}
   
   /**
    * 删除景点点评
    */
   @ResponseBody
   @RequestMapping(value = "deleteVComment",method = RequestMethod.POST)
   public Json deleteVComment(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			viewCommentService.deleteVComment(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
   
   

}
