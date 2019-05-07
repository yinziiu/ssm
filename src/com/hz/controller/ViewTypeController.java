package com.hz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.hz.model.ViewType;
import com.hz.model.layer.Json;
import com.hz.service.IViewTypeService;

@Controller
public class ViewTypeController {
	
	@Autowired
	private IViewTypeService viewTypeService;
	
	@RequestMapping("getViewTypeList")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<ViewType> viewtypeList = viewTypeService.getViewTypeList();
		Long totalList = viewTypeService.getViewTypeListTotal();
		// 放入转发参数
		mav.addObject("viewtypeList", viewtypeList);
		mav.addObject("totalList", totalList);
		// 放入jsp路径
		mav.setViewName("admin/view/viewtype-list");
		return mav;
	}
	
	/**
    * 跳转到添加酒店类型页面
    */
   @RequestMapping("ViewType_add")
   public ModelAndView addHotelType(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/view/viewtype-add");
		return mav;
   }
   
   /**
    * 添加酒店类型
    */
   @ResponseBody
   @RequestMapping(value = "savaViewType",method = RequestMethod.POST)
   public Json savaViewType(ViewType viewtype,HttpServletRequest request){
	   Json json = new Json();
		try {
			viewTypeService.saveViewType(viewtype);
			json.setObj(viewtype);
			json.setSuccess(true);
			json.setMsg("添加成功");
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 跳转编辑酒店类型页面
    */
   @ResponseBody
   @RequestMapping(value = "updateViewType")
   public ModelAndView updateViewType(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		ViewType viewType = viewTypeService.getViewTypeById(id);
		request.getSession().setAttribute("viewType", viewType);
		mav.setViewName("admin/view/viewtype-update");
		return mav;
   }
   
   /**
    * 编辑酒店类型
    */
   @ResponseBody
   @RequestMapping(value = "update_ViewType",method = RequestMethod.POST)
   public Json update_ViewType(ViewType viewtype,HttpServletRequest request){
	   Json json = new Json();
	   System.out.println(viewtype);
		try {
			viewTypeService.updateViewType(viewtype);
			json.setObj(viewtype);
			json.setSuccess(true);
			json.setMsg("编辑成功");
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 删除酒店类型
    */
   @ResponseBody
   @RequestMapping(value = "deleteViewType",method = RequestMethod.POST)
   public Json deleteViewType(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			viewTypeService.deleteViewType(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }

}
