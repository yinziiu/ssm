package com.hz.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hz.model.HotelOrder;
import com.hz.model.ViewOrder;
import com.hz.service.IHotelOrderService;

@Controller
public class HotelOrderController {

	@Autowired
	private IHotelOrderService hotelOrderService;

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

	/**
	 * 订单列表
	 * 
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping("getHotelOrderList")
	public ModelAndView listUser() throws ParseException {
		ModelAndView mav = new ModelAndView();
		List<HotelOrder> hotelorderList = hotelOrderService.getHotelOrderList();
		Long totalList = hotelOrderService.getHotelOrderListtotal();
		float price = 0;
		long daysBetween = 0;
		for (HotelOrder order : hotelorderList) {
			if (order.getStatus().equals("1")) {
				order.setStatus("已关闭");
			}
			if (order.getStatus().equals("2")) {
				order.setStatus("待支付");
			}
			if (order.getStatus().equals("3")) {
				order.setStatus("待出行");
			}
			if (order.getStatus().equals("4")) {
				order.setStatus("已使用");
			}
			// 房间数
			int ordernum = order.getRoomnum();
			// 单价
			price = order.getHprice();
			// 多少晚
			daysBetween = daysBetween(order.getCheckintime(),order.getCheckouttime());
			System.out.println(daysBetween);
			order.setHprice((float) ordernum * price * daysBetween);
		}

		mav.addObject("price", price);
		mav.addObject("daysBetween", daysBetween);
		mav.addObject("hotelorderList", hotelorderList);
		mav.addObject("totalList", totalList);
		// 放入jsp路径
		mav.setViewName("admin/order/hotelorder-list");
		return mav;
	}

}
