package com.hz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hz.model.HotelComment;
import com.hz.model.layer.Json;
import com.hz.service.IHotelCommentService;

@Controller
public class HotelCommentController {
	
	@Autowired
	private IHotelCommentService hotelCommentService;
	
	/**
    * 餐饮点评列表
    * @return
    */
   @RequestMapping("getHotelCommentList")
   public ModelAndView listView(){
		ModelAndView mav = new ModelAndView();
		List<HotelComment> hotelcommentList= hotelCommentService.getHotelCommentList();
		Long totalList = hotelCommentService.getHotelCommentListtotal();
		for(HotelComment hotelComment : hotelcommentList){
			System.out.println(hotelComment);
		}
		// 放入转发参数
		mav.addObject("hotelcommentList",hotelcommentList);
		mav.addObject("totalList", totalList);
		// 放入jsp路径
		mav.setViewName("admin/comment/hcomment-list");
		return mav;
	}
   
   /**
    * 删除酒店点评
    */
   @ResponseBody
   @RequestMapping(value = "deleteHComment",method = RequestMethod.POST)
   public Json deleteHComment(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			hotelCommentService.deleteHComment(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }

}
