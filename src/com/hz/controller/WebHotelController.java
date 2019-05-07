package com.hz.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hz.model.HotelRoomInfo;
import com.github.pagehelper.PageInfo;
import com.hz.model.Hotel;
import com.hz.model.HotelComment;
import com.hz.model.HotelFac;
import com.hz.model.HotelInfo;
import com.hz.model.HotelOrder;
import com.hz.model.HotelRoomType;
import com.hz.model.HotelService1;
import com.hz.model.HotelStory;
import com.hz.model.Notes;
import com.hz.service.IHotelCommentService;
import com.hz.service.IHotelInfoService;
import com.hz.service.IHotelOrderService;
import com.hz.service.IHotelService;


@Controller
public class WebHotelController {
	
	@Autowired 
	private IHotelService hotelService;
	@Autowired
	private IHotelInfoService hotelInfoService;
	@Autowired
	private IHotelOrderService hotelOrderService;
	@Autowired
	private IHotelCommentService hotelCommentService;
	
	/**
	*字符串的日期格式的计算
	*/
	public static int daysBetween(String smdate,String bdate) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(sdf.parse(smdate));
		long time1 = cal.getTimeInMillis();
		cal.setTime(sdf.parse(bdate));
		long time2 = cal.getTimeInMillis();
		long between_days=(time2-time1)/(1000*3600*24);
		return Integer.parseInt(String.valueOf(between_days));
	}
	
	
	@RequestMapping("web/hotel")
	public ModelAndView toHotel(@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage)throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<Hotel> hotelList = hotelService.getHotelList3(currentPage);
		PageInfo<Hotel> page = new PageInfo<Hotel>(hotelList);
		mav.addObject("page", page);
		mav.addObject("hotelList", hotelList);
		
		Long listTotal = hotelService.getHotelListTotal();
		mav.addObject("listTotal",listTotal);
 		
		mav.setViewName("views/hotel/hotel");
		return mav;
	}
	
	/**
	 * 酒店详情页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("web/hotel_detail")
	public ModelAndView toHotel_detail(@RequestParam int hid,@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage,
			HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		request.getSession().setAttribute("hid", hid);
		//酒店信息
		List<Hotel> hotelList = hotelService.getHotelListById(hid);
		mav.addObject("hotelList", hotelList);
		
		//房型
		List<HotelRoomType> hotelRooms = hotelInfoService.getRoomListById(hid);
		mav.addObject("hotelRooms", hotelRooms);
		
		//基本信息
		List<HotelInfo> hotelInfos = hotelInfoService.getHotelInfoListById(hid);
		mav.addObject("hotelInfos", hotelInfos);
		
		//酒店服务
		List<HotelService1> hotelService1s = hotelInfoService.getHotelServiceListById(hid);
		mav.addObject("hotelService1s", hotelService1s);
		
		//酒店设施
		List<HotelFac> hotelFacs = hotelInfoService.getHotelFacListById(hid);
		mav.addObject("hotelFacs", hotelFacs);
		
		//房间设施
		List<HotelRoomInfo> hRoomInfos = hotelInfoService.getHotelRoomInfoListById(hid);
		mav.addObject("hRoomInfos", hRoomInfos);
		
		//酒店故事
		List<HotelStory> hotelStories = hotelInfoService.getHotelStoryListById(hid);
		mav.addObject("hotelStories", hotelStories);
		
		//酒店点评
		List<HotelComment> hotelComments = hotelCommentService.getHotelCommentListById(hid,currentPage);
		PageInfo<HotelComment> page = new PageInfo<HotelComment>(hotelComments);
		mav.addObject("page", page);
		mav.addObject("hotelComments", hotelComments);
		Long listTotal = hotelCommentService.getHotelCommentListTotalById(hid);
		mav.addObject("listTotal", listTotal);
		mav.setViewName("views/hotel/hotel_detail");
		return mav;
	}
	
	@RequestMapping("web/hotel_order")
	public ModelAndView hotel_order(@RequestParam int id,HttpServletRequest request)throws Exception{
		ModelAndView mav = new ModelAndView();
		HotelRoomType hotelRoomType = hotelInfoService.getHotelRoomById(id);
		System.out.println(hotelRoomType);
		int id1 = hotelRoomType.getId();
		int hid = hotelRoomType.getHid();
		String hname = hotelRoomType.getHname();
		String address = hotelRoomType.getAddress();
		Float hprice = hotelRoomType.getHprice();
		String htype = hotelRoomType.getHtype();
		int hnum = hotelRoomType.getHnum();	
		int roomtotal = hotelRoomType.getRoomtotal();
		String roomphoto = hotelRoomType.getRoomphoto();
		request.getSession().setAttribute("hotelOrder", hotelRoomType);
		request.getSession().setAttribute("id1", id1);
		request.getSession().setAttribute("hid", hid);
		request.getSession().setAttribute("hname", hname);
		request.getSession().setAttribute("address", address);
		request.getSession().setAttribute("hprice", hprice);
		request.getSession().setAttribute("htype", htype);
		request.getSession().setAttribute("hnum", hnum);
		request.getSession().setAttribute("roomphoto", roomphoto);
		request.getSession().setAttribute("roomtotal", roomtotal);
		mav.setViewName("views/hotel/hotel_order_comfrim");
		return mav;
	}
	
	@RequestMapping(value = "web/saveHotelOrder",method = RequestMethod.POST)
	public ModelAndView saveHotelOrder(HotelOrder hotelOrder,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println(hotelOrder);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
        String timeStr = df.format(new Date());// new Date()为获取当前系统时间
	    hotelOrder.setBooktime(timeStr);
	    String hordernum = "";
        Random random = new Random();
        hordernum+=random.nextInt(9)+1;
        for (int i = 0; i < 18-1; i++) {
        	hordernum+=random.nextInt(10);
        }
        hotelOrder.setHordernum(hordernum);
        hotelOrder.setStatus("2");    
	    hotelOrderService.saveHotelOrder(hotelOrder);
		mav.setViewName("forward:/web/hotel");
		return mav;
	}
	
	@RequestMapping(value = "web/payHotelOrder")
	public ModelAndView payHotelOrder(@RequestParam int id,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<HotelOrder> hotelOrders = hotelOrderService.getHotelOrderListById(id);
		float price = 0;
		long daysBetween = 0;
		for (HotelOrder order : hotelOrders) {
			if (order.getStatus().equals("1")) {
				order.setStatus("已关闭");
			}
			if (order.getStatus().equals("2")) {
				order.setStatus("待支付");
			}
			if (order.getStatus().equals("3")) {
				order.setStatus("已完成");
			}
			// 房间数
			int ordernum = order.getRoomnum();
			// 单价
			price = order.getHprice();
			// 多少晚
			try {
				daysBetween = daysBetween(order.getCheckintime(),order.getCheckouttime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			System.out.println(daysBetween);
			order.setHprice((float) ordernum * price * daysBetween);
		}

		mav.addObject("price", price);
		mav.addObject("daysBetween", daysBetween);
		mav.addObject("hotelOrders", hotelOrders);
		mav.addObject("hotelOrders", hotelOrders);
		mav.setViewName("views/hotel/hotel_order_pay");
		return mav;
	}
	
	@RequestMapping(value = "web/updateStatus",method = RequestMethod.POST)
	public ModelAndView updateStatus(HotelOrder hotelOrder,HttpServletRequest request,int id) {
		ModelAndView mav = new ModelAndView();
		id = hotelOrder.getUid();
		hotelOrder.setStatus("3");
		hotelOrderService.updateStatus(hotelOrder);
		mav.setViewName("forward:/web/myhotelorder");
		return mav;
	}
	
	@RequestMapping(value = "web/quxiaoStatus",method = RequestMethod.POST)
	public ModelAndView quxiaoStatus(HotelOrder hotelOrder,HttpServletRequest request,int id) {
		ModelAndView mav = new ModelAndView();
		id = hotelOrder.getUid();
		hotelOrder.setStatus("1");
		hotelOrderService.updateStatus(hotelOrder);
		mav.setViewName("forward:/web/myhotelorder");
		return mav;
	}
	
	@RequestMapping(value = "web/deleteHotelOrder")
	public ModelAndView deleteHotelOrder(HotelOrder hotelOrder,HttpServletRequest request,int id) {
		ModelAndView mav = new ModelAndView();
		hotelOrderService.deleteHotelOrder(id);
		mav.setViewName("forward:/web/myhotelorder");
		return mav;
	}

}
