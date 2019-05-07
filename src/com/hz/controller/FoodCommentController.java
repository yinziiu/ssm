package com.hz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hz.model.FoodComment;
import com.hz.model.layer.Json;
import com.hz.service.IFoodCommentService;

@Controller
public class FoodCommentController {
	
	@Autowired
	private IFoodCommentService foodCommentService;
	
	/**
    * 餐饮点评列表
    * @return
    */
   @RequestMapping("getFoodCommentList")
   public ModelAndView listView(){
		ModelAndView mav = new ModelAndView();
		List<FoodComment> foodcommentList= foodCommentService.getFoodCommentList();
		Long totalList = foodCommentService.getFoodCommentListtotal();
		// 放入转发参数
		mav.addObject("foodcommentList", foodcommentList);
		mav.addObject("totalList", totalList);
		// 放入jsp路径
		mav.setViewName("admin/comment/fcomment-list");
		return mav;
	}
   
   
   /**
    * 删除餐饮点评
    */
   @ResponseBody
   @RequestMapping(value = "deleteFComment",method = RequestMethod.POST)
   public Json deleteFComment(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			foodCommentService.deleteFComment(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }

}
