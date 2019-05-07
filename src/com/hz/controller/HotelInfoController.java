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
import com.hz.model.HotelFac;
import com.hz.model.HotelInfo;
import com.hz.model.HotelRoomInfo;
import com.hz.model.HotelRoomType;
import com.hz.model.HotelService1;
import com.hz.model.HotelStory;
import com.hz.model.HotelType;
import com.hz.model.layer.Json;
import com.hz.service.IHotelCommentService;
import com.hz.service.IHotelInfoService;
import com.hz.util.FileUtil;

/**
 * 酒店房间类型
 * 酒店基本信息
 * 酒店服务
 * 酒店设施
 * 基本设施
 * 酒店故事
 * @author ASUS
 *
 */
@Controller 
public class HotelInfoController {
	
	@Autowired
	private IHotelInfoService hotelInfoService;
	@Autowired
	private IHotelCommentService hotelCommentService;
	@Value("${SERVER_URL}")
    private String SERVER_URL;
	
   
   /**
    * 酒店类型列表
    * @return
    */
	@ResponseBody
   @RequestMapping("getHotelType")
   public ModelAndView listHotelType(){
		ModelAndView mav = new ModelAndView();
		List<HotelType> HotelTypeList = hotelInfoService.getHotelType();
		mav.addObject("HotelTypeList", HotelTypeList);
		Long totalList = hotelInfoService.getHotelTypeTotal();
		mav.addObject("totalList", totalList);
		mav.setViewName("admin/hotel/hotel-type");
		return mav;
	}
   
   /**
    * 跳转到添加酒店类型页面
    */
   @RequestMapping("HotelType_add")
   public ModelAndView addHotelType(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/hotel/hotel-type-add");
		return mav;
   }
   
   /**
    * 添加酒店类型
    */
   @ResponseBody
   @RequestMapping(value = "savaHotelType",method = RequestMethod.POST)
   public Json saveHotelType(HotelType hotelType,HttpServletRequest request){
	   Json json = new Json();
		try {
			hotelInfoService.saveHotelType(hotelType);
			json.setObj(hotelType);
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
   @RequestMapping(value = "updateHotelType")
   public ModelAndView updateHotelType(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		HotelType hotelType2 = hotelInfoService.getHotelTypeById(id);
		request.getSession().setAttribute("hotelType2", hotelType2);
		mav.setViewName("admin/hotel/hotel-type-update");
		return mav;
   }
   
   /**
    * 编辑酒店类型
    */
   @ResponseBody
   @RequestMapping(value = "update_HotelType",method = RequestMethod.POST)
   public Json update_HotelType(HotelType hotelType,HttpServletRequest request){
	   Json json = new Json();
	   System.out.println(hotelType);
		try {
			hotelInfoService.saveHotelType(hotelType);
			json.setObj(hotelType);
			json.setSuccess(true);
			json.setMsg("添加成功");
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
   @RequestMapping(value = "deleteHotelType",method = RequestMethod.POST)
   public Json deleteHotelType(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			hotelInfoService.deleteHotelType(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
////////////////////////////////////////////////////////////////////////////
   
   /**
    * 酒店房型
    * @return
    */
   @ResponseBody
   @RequestMapping("getHotelRoomType")
   public ModelAndView listHotelRoomType(){
		ModelAndView mav = new ModelAndView();
		List<HotelRoomType> HotelRoomType = hotelInfoService.getHotelRoomType();
		mav.addObject("HotelRoomType", HotelRoomType);
		Long totalList = hotelInfoService.getHotelRoomTypeTotal();
		mav.addObject("totalList", totalList);
		mav.setViewName("admin/hotel/hotel-roomtype");
		return mav;
	}
   
   /**
    * 酒店房型
    * @return
    */
   @ResponseBody
   @RequestMapping("getHotelRoomType2")
   public ModelAndView listHotelRoomType2(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<HotelRoomType> HotelRoomType = hotelInfoService.getHotelRoomType2(id);
		request.getSession().setAttribute("HotelRoomType", HotelRoomType);
		Long totalList = hotelInfoService.getHotelRoomTypeTotal2(id);
		request.getSession().setAttribute("totalList", totalList);
		request.getSession().setAttribute("id", id);
		mav.setViewName("admin/hotel/hotel-roomtype2");
		return mav;
	}
   
   /*@ResponseBody
   @RequestMapping("getHotelRoomPhoto")
   public ModelAndView getHotelRoomPhoto(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<HotelRoomType> HotelRoomType = hotelInfoService.getHotelRoomPhoto(id);
		String fileUrls = "";
		String[] fileurlArr = null;
		for(HotelRoomType hotelRoomType2 : HotelRoomType){
			fileUrls = hotelRoomType2.getRoomphoto();
			if (null != fileUrls   &&  "" != fileUrls) {
               fileurlArr = fileUrls.split(",");
            }
		}
		request.getSession().setAttribute("fileurlArr", fileurlArr);
		mav.setViewName("admin/hotel/room-picture-show");
		return mav;
	}*/
   
   /**
    * 跳转到添加酒店房型页面
    */
   @RequestMapping("HotelRoomType_add")
   public ModelAndView addHotelRoomType(int hid,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		request.getSession().setAttribute("hid", hid);
		mav.setViewName("admin/hotel/hotel-roomtype-add");
		return mav;
   }
   
   /**
    * 添加酒店房型
    */
   @ResponseBody
   @RequestMapping(value = "savaHotelRoomType",method = RequestMethod.POST)
   public Json saveHotelRoomType(HotelRoomType hotelRoomType,HttpServletRequest request,
		   @RequestParam(value = "rphoto", required = false) MultipartFile uploadFile){
	   Json json = new Json();
		try {
			if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
					List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
					hotelRoomType.setRoomphoto(strList.get(0));
				}
			}
			HotelRoomType hotelRoomType2 = hotelInfoService.CheckHotelRoomType(hotelRoomType);
			if (hotelRoomType2==null) {
				hotelInfoService.saveHotelRoomType(hotelRoomType);
				json.setObj(hotelRoomType);
				json.setSuccess(true);
				json.setMsg("添加成功");
			}else {
				hotelInfoService.updateHotelRoomType(hotelRoomType);
				json.setObj(hotelRoomType);
				json.setSuccess(true);
				json.setMsg("编辑成功");
			}
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 跳转编辑酒酒店房型页面
    */
   @ResponseBody
   @RequestMapping(value = "updateHotelRoomType")
   public ModelAndView updateHotelRoomType(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		HotelRoomType hotelRoomInfo =hotelInfoService.getHotelRoomTypeById(id);
		request.getSession().setAttribute("hotelRoomInfo", hotelRoomInfo);
		mav.setViewName("admin/hotel/hotel-roomtype-update");
		return mav;
   }
   
   /**
    * 编辑酒店房型图片
    */
   @ResponseBody
   @RequestMapping(value = "update_HotelRoomPhoto",method = RequestMethod.POST)
   public Json update_HotelRoomPhoto(HotelRoomType hotelRoomType,HttpServletRequest request,
		   @RequestParam(value = "rphoto", required = false) MultipartFile uploadFile){
	   Json json = new Json();
		try {
			if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName)&& FileUtil.checkPic(suffix)) {
					HotelRoomType hotelRoomType2 = hotelInfoService.getHotelRoomTypeById(hotelRoomType.getId());
					if (null != hotelRoomType2.getRoomphoto() && "" != hotelRoomType2.getRoomphoto()) {
						// 删除图片文件
						FileUtil.deleteFile(hotelRoomType2.getRoomphoto(),request);
					}
					List<String> strList = FileUtil.saveFile(uploadFile,request, SERVER_URL);
					hotelRoomType.setRoomphoto(strList.get(0));
				}
			}
			hotelInfoService.updateHotelRoomPhoto(hotelRoomType);
			json.setObj(hotelRoomType);
			json.setSuccess(true);
			json.setMsg("编辑成功");
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 编辑酒店房型
    */
   @ResponseBody
   @RequestMapping(value = "update_HotelRoomType",method = RequestMethod.POST)
   public Json update_HotelRoomType(HotelRoomType hotelRoomType,HttpServletRequest request){
	   Json json = new Json();
		try {
			hotelInfoService.updateHotelRoomType(hotelRoomType);
			json.setObj(hotelRoomType);
			json.setSuccess(true);
			json.setMsg("编辑成功");
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 删除酒店房型
    */
   @ResponseBody
   @RequestMapping(value = "deleteHotelRoomType",method = RequestMethod.POST)
   public Json deleteHotelRoomType(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			hotelInfoService.deleteHotelRoomType(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
////////////////////////////////////////////////////////////////////////////
   
   /**
    * 酒店基本信息列表
    * @return
    */
   @RequestMapping("getHotelInfo")
   public ModelAndView listHotelInfo(){
		ModelAndView mav = new ModelAndView();
		List<HotelInfo> HotelInfo = hotelInfoService.getHotelInfo();
		mav.addObject("HotelInfo", HotelInfo);
		Long totalList = hotelInfoService.getHotelInfoTotal();
		mav.addObject("totalList", totalList);
		mav.setViewName("admin/hotel/hotel-info");
		return mav;
	}
   
   /**
    * 酒店基本信息列表
    * @return
    */
   @RequestMapping("getHotelInfo2")
   public ModelAndView listHotelInfo(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<HotelInfo> HotelInfo = hotelInfoService.getHotelInfo2(id);
		request.getSession().setAttribute("HotelInfo", HotelInfo);
		Long totalList = hotelInfoService.getHotelInfoTotal2(id);
		request.getSession().setAttribute("totalList", totalList);
		request.getSession().setAttribute("id", id);
		mav.setViewName("admin/hotel/hotel-info2");
		return mav;
	}
   
   /**
    * 跳转到添加基本信息列表页面
    */
   @RequestMapping("HotelInfo_add")
   public ModelAndView addHotelInfo(int hid,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		request.getSession().setAttribute("hid", hid);
		mav.setViewName("admin/hotel/hotel-info-add");
		return mav;
   }
   
   /**
    * 添加基本信息列表
    */
   @ResponseBody
   @RequestMapping(value = "savaHotelInfo",method = RequestMethod.POST)
   public Json saveHotelInfo(HotelInfo hotelInfo,HttpServletRequest request){
	   Json json = new Json();
		try {
			hotelInfoService.saveHotelInfo(hotelInfo);
			json.setObj(hotelInfo);
			json.setSuccess(true);
			json.setMsg("添加成功");
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 跳转编辑基本信息列表页面
    */
   @ResponseBody
   @RequestMapping(value = "updateHotelInfo")
   public ModelAndView updateHotelInfo(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		HotelInfo hotelInfo = hotelInfoService.getHotelInfoById(id);
		request.getSession().setAttribute("hotelInfo", hotelInfo);
		mav.setViewName("admin/hotel/hotel-info-update");
		return mav;
   }
   
   /**
    * 编辑基本信息列表
    */
   @ResponseBody
   @RequestMapping(value = "update_HotelInfo",method = RequestMethod.POST)
   public Json update_HotelInfo(HotelInfo hotelInfo,HttpServletRequest request){
	   Json json = new Json();
		try {
			hotelInfoService.updateHotelInfo(hotelInfo);
			json.setObj(hotelInfo);
			json.setSuccess(true);
			json.setMsg("编辑成功");
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 删除酒店基本信息列表
    */
   @ResponseBody
   @RequestMapping(value = "deleteHotelInfo",method = RequestMethod.POST)
   public Json deleteHotelInfo(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			hotelInfoService.deleteHotelInfo(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
/////////////////////////////////////////////////////////////////////
   
   /**
    * 酒店服务
    * @return
    */
   @RequestMapping("getHotelService")
   public ModelAndView listHotelService(){
		ModelAndView mav = new ModelAndView();
		List<HotelService1> serviceList = hotelInfoService.getHotelService();
		mav.addObject("serviceList", serviceList);
		Long totalList = hotelInfoService.getHotelServiceTotal();
		mav.addObject("totalList", totalList);
		mav.setViewName("admin/hotel/hotel-service");
		return mav;
	}
   
   /**
    * 酒店服务
    * @return
    */
   @RequestMapping("getHotelServiceByHid")
   public ModelAndView listHotelService(int hid,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<HotelService1> serviceList = hotelInfoService.getHotelServiceByHid(hid);
		mav.addObject("serviceList", serviceList);
		Long totalList = hotelCommentService.getHotelCommentListTotalById(hid);
		mav.addObject("totalList", totalList);
		request.getSession().setAttribute("hid", hid);
		mav.setViewName("admin/hotel/hotel-service2");
		return mav;
	}
   
   /**
    * 跳转到酒店添加服务页面
    */
   @RequestMapping("HotelService_add")
   public ModelAndView addHotelService2(int hid,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		request.getSession().setAttribute("hid", hid);
		mav.setViewName("admin/hotel/hotel-service-add");
		return mav;
   }
   
   /**
    * 添加酒店服务
    */
   @ResponseBody
   @RequestMapping(value = "savaHotelService",method = RequestMethod.POST)
   public Json saveHotelService(HotelService1 hotelService1,HttpServletRequest request){
	   Json json = new Json();
		try {
			hotelInfoService.saveHotelService(hotelService1);
			json.setObj(hotelService1);
			json.setSuccess(true);
			json.setMsg("编辑成功");
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 跳转编辑酒店服务页面
    */
   @ResponseBody
   @RequestMapping(value = "updateHotelService")
   public ModelAndView updateHotelService(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		HotelService1 hotelService1 = hotelInfoService.getHotelServiceById(id);
		request.getSession().setAttribute("hotelService1", hotelService1);
		mav.setViewName("admin/hotel/hotel-service-update");
		return mav;
   }
   
   /**
    * 编辑酒店服务
    */
   @ResponseBody
   @RequestMapping(value = "update_HotelService",method = RequestMethod.POST)
   public Json update_HotelService(HotelService1 hotelService1,HttpServletRequest request){
	   Json json = new Json();
		try {
			hotelInfoService.updateHotelService(hotelService1);
			json.setObj(hotelService1);
			json.setSuccess(true);
			json.setMsg("添加成功");
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 删除酒店服务
    */
   @ResponseBody
   @RequestMapping(value = "deleteHotelService",method = RequestMethod.POST)
   public Json deleteHotelService(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			hotelInfoService.deleteHotelService(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
   
////////////////////////////////////////////////////////////
   
   /**
    * 酒店设备
    * @return
    */
   @RequestMapping("getHotelFac")
   public ModelAndView listHotelFac(){
		ModelAndView mav = new ModelAndView();
		List<HotelFac> HotelFacList = hotelInfoService.getHotelFac();
		mav.addObject("HotelFacList", HotelFacList);
		Long totalList = hotelInfoService.getHotelFacTotal();
		mav.addObject("totalList", totalList);
		mav.setViewName("admin/hotel/hotel-fac");
		return mav;
	}
   
   @RequestMapping("getHotelFac2")
   public ModelAndView listHotelFac(int hid,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<HotelFac> HotelFacList = hotelInfoService.getHotelFacByHId(hid);
		mav.addObject("HotelFacList", HotelFacList);
		Long totalList = hotelInfoService.getHotelFacTotalByHId(hid);
		mav.addObject("totalList", totalList);
		request.getSession().setAttribute("hid", hid);
		mav.setViewName("admin/hotel/hotel-fac2");
		return mav;
	}
   
   /**
    * 跳转到添加酒酒店设备页面
    */
   @RequestMapping("HotelFac_add")
   public ModelAndView addHotelFac(int hid,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		request.getSession().setAttribute("hid", hid);
		mav.setViewName("admin/hotel/hotel-fac-add");
		return mav;
   }
   
   /**
    * 添加酒店设备
    */
   @ResponseBody
   @RequestMapping(value = "savaHotelFac",method = RequestMethod.POST)
   public Json saveHotelFac(HotelFac hotelFac,HttpServletRequest request){
	   Json json = new Json();
		try {
			hotelInfoService.saveHotelFac(hotelFac);
			json.setObj(hotelFac);
			json.setSuccess(true);
			json.setMsg("添加成功");
			
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 跳转编辑酒店设备页面
    */
   @ResponseBody
   @RequestMapping(value = "updateHotelFac")
   public ModelAndView updateHotelFac(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		HotelFac hotelFac = hotelInfoService.getHotelFacById(id);
		request.getSession().setAttribute("hotelFac", hotelFac);
		mav.setViewName("admin/hotel/hotel-fac-update");
		return mav;
   }
   
   /**
    * 编辑酒店设备
    */
   @ResponseBody
   @RequestMapping(value = "update_HotelFac",method = RequestMethod.POST)
   public Json update_HotelFac(HotelFac hotelFac,HttpServletRequest request){
	   Json json = new Json();
		try {
			hotelInfoService.saveHotelFac(hotelFac);
			json.setObj(hotelFac);
			json.setSuccess(true);
			json.setMsg("添加成功");
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 删除酒店设备
    */
   @ResponseBody
   @RequestMapping(value = "deleteHotelFac",method = RequestMethod.POST)
   public Json deleteHotelFac(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			hotelInfoService.deleteHotelFac(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
/////////////////////////////////////////////////////////////////////////////////   
   
   /**
    * 房间设备
    * @return
    */
   @RequestMapping("getHotelRoomInfo")
   public ModelAndView listHotelRoomInfo(){
		ModelAndView mav = new ModelAndView();
		List<HotelRoomInfo> HotelRoomInfoList = hotelInfoService.getHotelRoomInfo();
		mav.addObject("HotelRoomInfoList", HotelRoomInfoList);
		Long totalList = hotelInfoService.getHotelRoomInfoTotal();
		mav.addObject("totalList", totalList);
		mav.setViewName("admin/hotel/hotel-roominfo");
		return mav;
	}
   
   /**
    * 房间设备
    * @return
    */
   @RequestMapping("getHotelRoomInfo2")
   public ModelAndView listHotelRoomInfo2(int hid,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<HotelRoomInfo> HotelRoomInfoList = hotelInfoService.getHotelRoomInfoByHId(hid);
		mav.addObject("HotelRoomInfoList", HotelRoomInfoList);
		Long totalList = hotelInfoService.getHotelRoomInfoTotalByHId(hid);
		mav.addObject("totalList", totalList);
		request.getSession().setAttribute("hid", hid);
		mav.setViewName("admin/hotel/hotel-roominfo2");
		return mav;
	}
   
   /**
    * 跳转到添加房间设备页面
    */
   @RequestMapping("HotelRoomInfo_add")
   public ModelAndView addHotelRoomInfo(int hid,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		request.getSession().setAttribute("hid", hid);
		mav.setViewName("admin/hotel/hotel-roominfo-add");
		return mav;
   }
   
   
   /**
    * 添加房间设备
    */
   @ResponseBody
   @RequestMapping(value = "savaHotelRoomInfo",method = RequestMethod.POST)
   public Json saveHotelRoomInfo(HotelRoomInfo hotelRoomInfo,HttpServletRequest request){
	   Json json = new Json();
		try {
			hotelInfoService.saveHotelRoomInfo(hotelRoomInfo);
			json.setObj(hotelRoomInfo);
			json.setSuccess(true);
			json.setMsg("添加成功");
			
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 跳转编辑房间设备页面
    */
   @ResponseBody
   @RequestMapping(value = "updateHotelRoomInfo")
   public ModelAndView updateHotelRoomInfo(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		HotelRoomInfo hotelRoomInfo = hotelInfoService.getHotelRoomInfoById(id);
		request.getSession().setAttribute("hotelRoomInfo", hotelRoomInfo);
		mav.setViewName("admin/hotel/hotel-roominfo-update");
		return mav;
   }
   
   /**
    * 编辑房间设备
    */
   @ResponseBody
   @RequestMapping(value = "update_HotelRoomInfo",method = RequestMethod.POST)
   public Json update_HotelRoomInfo(HotelRoomInfo hotelRoomInfo,HttpServletRequest request){
	   Json json = new Json();
		try {
			hotelInfoService.saveHotelRoomInfo(hotelRoomInfo);
			json.setObj(hotelRoomInfo);
			json.setSuccess(true);
			json.setMsg("添加成功");
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 删除房间设备
    */
   @ResponseBody
   @RequestMapping(value = "deleteHotelRoomInfo",method = RequestMethod.POST)
   public Json deleteHotelRoomInfo(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			hotelInfoService.deleteHotelRoomInfo(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
/////////////////////////////////////////////////////////////////////////////////////   
   /**
    * 酒店攻略
    * @return
    */
   @RequestMapping("getHotelStory")
   public ModelAndView listHotelStory(){
		ModelAndView mav = new ModelAndView();
		List<HotelStory> HotelStoryList = hotelInfoService.getHotelStory();
		mav.addObject("HotelStoryList", HotelStoryList);
		Long totalList = hotelInfoService.getHotelStoryTotal();
		mav.addObject("totalList", totalList);
		mav.setViewName("admin/hotel/hotel-story");
		return mav;
	}
   
   /**
    * 酒店攻略2
    * @return
    */
   @RequestMapping("getHotelStory2")
   public ModelAndView listHotelStory2(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		List<HotelStory> HotelStoryList = hotelInfoService.getHotelStoryById2(id);
		request.getSession().setAttribute("HotelStoryList", HotelStoryList);
		Long totalList = hotelInfoService.getHotelStoryTotal2(id);
		request.getSession().setAttribute("totalList", totalList);
		request.getSession().setAttribute("id", id);
		mav.setViewName("admin/hotel/hotel-story2");
		return mav;
	}
   
   /**
    * 跳转到添加酒店攻略页面
    */
   @RequestMapping("HotelStory_add")
   public ModelAndView addHotelStory(int hid,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		request.getSession().setAttribute("hid", hid);
		mav.setViewName("admin/hotel/hotel-story-add");
		return mav;
   }
   
   /**
    * 添加酒店攻略
    */
   @ResponseBody
   @RequestMapping(value = "savaHotelStory",method = RequestMethod.POST)
   public Json saveHotelStory(HotelStory hotelStory,HttpServletRequest request){
	   Json json = new Json();
		try {
			hotelInfoService.saveHotelStory(hotelStory);
			json.setObj(hotelStory);
			json.setSuccess(true);
			json.setMsg("添加成功");
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 跳转编辑酒店攻略页面
    */
   @ResponseBody
   @RequestMapping(value = "updateHotelStory")
   public ModelAndView updateHotelStory(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		HotelStory hotelStory = hotelInfoService.getHotelStoryById(id);
		request.getSession().setAttribute("hotelStory", hotelStory);
		mav.setViewName("admin/hotel/hotel-story-update");
		return mav;
   }
   
   /**
    * 编辑酒店攻略
    */
   @ResponseBody
   @RequestMapping(value = "update_HotelStory",method = RequestMethod.POST)
   public Json update_HotelStory(HotelStory hotelStory,HttpServletRequest request){
	   Json json = new Json();
		try {
			hotelInfoService.updateHotelStory(hotelStory);
			json.setObj(hotelStory);
			json.setSuccess(true);
			json.setMsg("编辑成功");
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 删除酒店攻略
    */
   @ResponseBody
   @RequestMapping(value = "deleteHotelStory",method = RequestMethod.POST)
   public Json deleteHotelStory(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			hotelInfoService.deleteHotelStory(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
   

}
