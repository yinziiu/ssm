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

import com.hz.model.Hotel;
import com.hz.model.HotelType;
import com.hz.model.User;
import com.hz.model.layer.Json;
import com.hz.service.IHotelInfoService;
import com.hz.service.IHotelService;
import com.hz.util.FileUtil;

@Controller
public class HotelController {
	
	@Autowired
	private IHotelService hotelService;
	@Autowired
	private IHotelInfoService hotelInfoService;
	@Value("${SERVER_URL}")
    private String SERVER_URL;
	@Value("${WEB_WORK_ADDRESS}")
    private String WEB_WORK_ADDRESS;
	
	/**
    * 酒店列表
    * @return
    */
   @RequestMapping("getHotelList")
   public ModelAndView HotelList(){
		ModelAndView mav = new ModelAndView();
		List<Hotel> hotelList= hotelService.getHotelList();
		Long totalList = hotelService.getHotelListTotal();
		for( Hotel hotel :hotelList){
			hotel.setHphoto(WEB_WORK_ADDRESS+hotel.getHphoto());
		}
		// 放入转发参数
		mav.addObject("hotelList", hotelList);
		mav.addObject("totalList", totalList);
		// 放入jsp路径
		mav.setViewName("admin/hotel/hotel-list");
		return mav;
	}
   
   /**
    * 添加酒店
    */
   @RequestMapping("addHotel")
   public ModelAndView addHotel(HttpServletRequest request){
	   ModelAndView mav = new ModelAndView();
	   List<HotelType> hotelTypes = hotelInfoService.getHotelType();
	   request.getSession().setAttribute("hotelTypes", hotelTypes);
	   mav.setViewName("admin/hotel/hotel-list-add");
	   return mav;
   }
   
   /**
    * 添加酒店
    */
   @ResponseBody
   @RequestMapping(value = "saveHotel",method = RequestMethod.POST)
   public Json deleteHotel(Hotel hotel,HttpServletRequest request,
		   @RequestParam(value = "hotelphoto", required = false) MultipartFile uploadFile){
	   Json j = new Json();
		try {
			if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
					List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
					hotel.setHphoto(strList.get(0));
				}
			}
			hotelService.saveHotel(hotel);
			j.setSuccess(true);
			j.setMsg("添加成功！");
			j.setObj(hotel);
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
   /**
    * 编辑酒店
    */
   @RequestMapping("updateHotel")
   public ModelAndView updateHotel(int id,HttpServletRequest request){
	   ModelAndView mav = new ModelAndView();
	   Hotel hotel = hotelService.getHotelById(id);
	   request.getSession().setAttribute("hotel", hotel);
	   List<HotelType> hotelTypes = hotelInfoService.getHotelType();
	   request.getSession().setAttribute("hotelTypes", hotelTypes);
	   mav.setViewName("admin/hotel/hotel-list-update");
	   return mav;
   }
   
   /**
    * 编辑酒店图片
    */
   @ResponseBody
   @RequestMapping(value = "update_hotelphoto",method = RequestMethod.POST)
   public Json update_hotelphoto(Hotel hotel,HttpServletRequest request,
		   @RequestParam(value = "hotelphoto", required = false) MultipartFile uploadFile){
	   Json j = new Json();
		try {
			if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName)&& FileUtil.checkPic(suffix)) {
					Hotel hotel2 = hotelService.getHotelById(hotel.getId());
					if (null != hotel2.getHphoto() && "" != hotel2.getHphoto()) {
						// 删除图片文件
						FileUtil.deleteFile(hotel2.getHphoto(),request);
					}
					List<String> strList = FileUtil.saveFile(uploadFile,request, SERVER_URL);
					hotel.setHphoto(strList.get(0));
				}
			}
			hotelService.update_hotelphoto(hotel);
			j.setSuccess(true);
			j.setMsg("编辑成功！");
			j.setObj(hotel);
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
   /**
    * 编辑酒店
    */
   @ResponseBody
   @RequestMapping(value = "update_Hotel",method = RequestMethod.POST)
   public Json update_Hotel(Hotel hotel,HttpServletRequest request){
	   Json j = new Json();
		try {
			hotelService.update_Hotel(hotel);
			j.setSuccess(true);
			j.setObj(hotel);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
   
   /**
    * 删除酒店
    */
   @ResponseBody
   @RequestMapping(value = "deleteHotel",method = RequestMethod.POST)
   public Json deleteHotel(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			Hotel hotel2 = hotelService.getHotelById(id);
			if (null != hotel2.getHphoto() && "" != hotel2.getHphoto()) {
				// 删除图片文件
				FileUtil.deleteFile(hotel2.getHphoto(),request);
			}
			hotelService.deleteHotel(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   

}
