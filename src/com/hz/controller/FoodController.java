package com.hz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hz.model.Food;
import com.hz.model.layer.Json;
import com.hz.service.IFoodService;
import com.hz.util.FileUtil;

@Controller
public class FoodController {
	
	@Autowired
	private IFoodService foodService;
	@Value("${SERVER_URL}")
    private String SERVER_URL;
	@Value("${WEB_WORK_ADDRESS}")
    private String WEB_WORK_ADDRESS;
	
	/**
    * 餐饮列表
    * @return
    */
   @RequestMapping("getFoodList")
   public ModelAndView listUser(){
		ModelAndView mav = new ModelAndView();
		List<Food> foodList= foodService.getFoodList();
		Long totalList = foodService.getFoodListTotal();
		for(Food food : foodList){
			food.setFphoto(WEB_WORK_ADDRESS+food.getFphoto());
		}
		// 放入转发参数
		mav.addObject("foodList", foodList);
		mav.addObject("totalList", totalList);
		// 放入jsp路径
		mav.setViewName("admin/food/food-list");
		return mav;
	}
   
   /**
    * 添加餐饮页
    */
   @RequestMapping("add_food")
   public ModelAndView add_food(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/food/food-list-add");
		return mav;
	} 
   
   /**
    * 添加餐饮
    */
   @ResponseBody
   @RequestMapping(value = "savaFood",method = RequestMethod.POST)
   public Json saveFood(Food food,HttpServletRequest request,
		   @RequestParam(value = "foodphoto", required = false) MultipartFile uploadFile){
	   Json j = new Json();
	   System.out.println("food"+food);
		try {
			if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName)&& FileUtil.checkPic(suffix)) {
					List<String> strList = FileUtil.saveFile(uploadFile,request, SERVER_URL);
					food.setFphoto(strList.get(0));
				}
			}
			foodService.saveFood(food);
			j.setSuccess(true);
			j.setMsg("添加成功！");
			j.setObj(food);
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
	
   /**
    * 更新餐饮页
    */
   @RequestMapping("update_food")
   public ModelAndView update_food(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		Food food = foodService.getFoodById(id);
		request.getSession().setAttribute("food", food);
		System.out.println(food);
		mav.setViewName("admin/food/food-list-update");
		return mav;
	} 
   
   /**
    * 修改餐饮
    */
   @ResponseBody
   @RequestMapping(value = "updateFood",method = RequestMethod.POST)
   public Json updateFood(Food food,HttpServletRequest request){
	   Json j = new Json();
	   System.out.println("food"+food);
		try {
			foodService.updateFood(food);
			j.setSuccess(true);
			j.setObj(food);
			j.setMsg("编辑成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
   /**
    * 修改餐饮图片
    */
   @ResponseBody
   @RequestMapping(value = "updateFPhoto",method = RequestMethod.POST)
   public Json updateFPhoto(Food food,HttpServletRequest request,
		   @RequestParam(value = "foodphoto", required = false) MultipartFile fileUpload){
	   Json j = new Json();
	   System.out.println("food"+food);
		try {
			if (fileUpload != null) {
				String fileName = fileUpload.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName)&& FileUtil.checkPic(suffix)) {
					Food food2 = foodService.getFoodById(food.getId());
					if (null != food2.getFphoto() && "" != food2.getFphoto()) {
						// 删除图片文件
						FileUtil.deleteFile(food2.getFphoto(),request);
					}
					List<String> strList = FileUtil.saveFile(fileUpload,request, SERVER_URL);
					food.setFphoto(strList.get(0));
				}
			}
			foodService.updateFPhoto(food);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
			j.setObj(food);
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
   
   @ResponseBody
   @RequestMapping(value = "deleteFood",method = RequestMethod.POST)
   public Json deleteFood(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			Food food = foodService.getFoodById(id);
			if (null != food.getFphoto() && "" != food.getFphoto()) {
				// 删除图片文件
				FileUtil.deleteFile(food.getFphoto(), request);
			}
			foodService.deleteFood(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
}
