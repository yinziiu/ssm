package com.hz.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.github.pagehelper.PageInfo;
import com.hz.model.Food;
import com.hz.model.FoodComment;
import com.hz.model.Hotel;
import com.hz.model.View;
import com.hz.model.ViewComment;
import com.hz.service.IFoodCommentService;
import com.hz.service.IFoodService;
import com.hz.service.IHotelService;
import com.hz.service.IViewService;
import com.hz.util.FileUtil;

@Controller
public class WebFoodController {
	
	@Autowired
	private IFoodService foodService;
	@Autowired
	private IFoodCommentService foodCommentService;
	@Autowired
	private IViewService viewService;
	@Autowired
	private IHotelService hotelService;
	@Value("${SERVER_URL}")
    private String SERVER_URL;
	
	/**
	 * 转跳到美食列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("web/food")
	public ModelAndView toFood(@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage)throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<Food> foodList = foodService.getFoodList1(currentPage);
		PageInfo<Food> page = new PageInfo<Food>(foodList);
		mav.addObject("page", page);
		mav.addObject("foodList", foodList);
		
		List<Food> foods = foodService.getFoodList2();
		mav.addObject("foods", foods);
		
		mav.setViewName("views/food/food");
		
		return mav;
	}
	
	/**
	 * 到美食详情页
	 */
	@RequestMapping("web/food_detail")
	public ModelAndView toFood_detail(HttpServletRequest request,@RequestParam int fid,@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage) throws Exception{
		ModelAndView mav = new ModelAndView();
		request.getSession().setAttribute("fid", fid);
		//美食列表
		List<Food> foodList = foodService.getFoodListByID(fid);
		mav.addObject("foodList", foodList);
		String fname = "";
		for(Food food : foodList){
			fname = food.getFname();
		}
		mav.addObject("fname", fname);
		//美食点评列表
		List<FoodComment> foodComments = foodCommentService.getFoodCommentListByFID(fid,currentPage);
		PageInfo<FoodComment> page = new PageInfo<FoodComment>(foodComments);
		mav.addObject("page", page);
		mav.addObject("foodComments", foodComments);
		Long total = foodCommentService.getFoodCommentListTotalByFID(fid);
		mav.addObject("total", total);
		String username = "";
		for(FoodComment foodComment : foodComments){
			username = foodComment.getUsername();
			System.out.println(foodComment);
		}
		mav.addObject("username", username);
		//热门美食
		List<Food> hotList = foodService.gethotFoodList();
		mav.addObject("hotList", hotList);
		
		//热门景点
		List<View> viewList = viewService.getHotViewList();
		mav.addObject("viewList", viewList);
		
		//热门酒店
		List<Hotel> hotelList = hotelService.getHotHotelList();
		mav.addObject("hotelList", hotelList);
		
		mav.setViewName("views/food/food_detail");
		
		return mav;
		
		
	}
	
	
	/**
     * 添加点评
     */
    @ResponseBody
    @RequestMapping(value = "saveFComment", method = RequestMethod.POST)
    public ModelAndView saveFComment(FoodComment foodComment,HttpServletRequest request,
    		@RequestParam int fid,
    		@RequestParam(value = "fphotopic", required = false) MultipartFile uploadFile) {
    	ModelAndView mav = new ModelAndView();
    	System.out.println(foodComment);
        try {
			if (uploadFile != null) {
				if (uploadFile != null) {
					String fileName = uploadFile.getOriginalFilename();
					String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
					if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
						List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
						foodComment.setFcphoto(strList.get(0));
					}
				}
			}
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
	        String timeStr = df.format(new Date());// new Date()为获取当前系统时间
	        foodComment.setFcommenttime(timeStr);
	        foodCommentService.saveFoodComment(foodComment);
	        
        } catch (Exception e) {
            e.printStackTrace();
        }
        mav.setViewName("forward:/web/food_detail");
		return mav;   
    }
    
    /**
     * 更新点评点评
     */
    @ResponseBody
    @RequestMapping(value = "updateFComment", method = RequestMethod.POST)
    public ModelAndView updateFComment(FoodComment foodComment,HttpServletRequest request,@RequestParam int fid) {
    	ModelAndView mav = new ModelAndView();
        try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
	        String timeStr = df.format(new Date());// new Date()为获取当前系统时间
	        foodComment.setFcommenttime(timeStr);
	        foodCommentService.updateFoodComment(foodComment);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mav.setViewName("forward:/web/food_detail");
		return mav;   
    }
    
    /**
     * 更新点评图片
     */
    @ResponseBody
    @RequestMapping(value = "updateFCommentPhoto", method = RequestMethod.POST)
    public ModelAndView updateFCommentPhoto(FoodComment foodComment,HttpServletRequest request,@RequestParam int fid,
    		@RequestParam(value = "fphotopic", required = false) MultipartFile uploadFile,
    		@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage) {
    	ModelAndView mav = new ModelAndView();
        try {
        	if (uploadFile != null) {
				if (uploadFile != null) {
					String fileName = uploadFile.getOriginalFilename();
					String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
					if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
						List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
						foodComment.setFcphoto(strList.get(0));
					}
				}
			}
	        foodCommentService.updateFoodCommentPhoto(foodComment);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mav.setViewName("forward:/web/food_detail");
		return mav;   
    }


}
