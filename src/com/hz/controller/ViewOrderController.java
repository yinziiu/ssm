package com.hz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hz.model.ViewOrder;
import com.hz.model.layer.Json;
import com.hz.service.IViewOrderService;

@Controller
public class ViewOrderController {
	
	@Autowired 
	private IViewOrderService viewOrderService;
	
	/**
    * 订单列表
    * @return
    */
   @RequestMapping("getViewOrderList")
   public ModelAndView getViewOrderList(){
		ModelAndView mav = new ModelAndView();
		List<ViewOrder> vieworderList= viewOrderService.getViewOrderList();
		Long totalList = viewOrderService.getViewOrderListtotal();
		// 放入转发参数
		float price = 0;
		for(ViewOrder order : vieworderList){
			if (order.getStatus().equals("1")) {
				order.setStatus("已关闭");
			}
			if (order.getStatus().equals("2")) {
				order.setStatus("待支付");
			}
			if (order.getStatus().equals("3")) {
				order.setStatus("已完成");
			}
			int ordernum = order.getOrdertotal();
			price = order.getTprice();
			order.setTprice((float)ordernum*price);
		}
		mav.addObject("vieworderList", vieworderList);
		mav.addObject("price", price);
		mav.addObject("totalList", totalList);
		// 放入jsp路径
		mav.setViewName("admin/order/vieworder-list");
		return mav;
	}
   
   /**
    * 删除景点订单
    */
   @ResponseBody
   @RequestMapping(value = "deleteViewOrder",method = RequestMethod.POST)
   public Json deleteViewOrder(int id,HttpServletRequest request){
	   Json j = new Json();
		try {
			viewOrderService.deleteViewOrder(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
   /**
    * 转跳到景点订单更新页面
    */
   @ResponseBody
   @RequestMapping(value = "updateViewOrder")
   public ModelAndView updateViewOrder(int id,HttpServletRequest request){
	   ModelAndView mav = new ModelAndView();
	   ViewOrder viewOrders = viewOrderService.getViewOrderListById2(id);
	   if (viewOrders.getStatus().equals("1")) {
		   viewOrders.setStatus("已关闭");
	   }else if (viewOrders.getStatus().equals("2")) {
		   viewOrders.setStatus("待支付");
	   }else if (viewOrders.getStatus().equals("3")) {
		   viewOrders.setStatus("已完成");
	   }
	   int ordernum = viewOrders.getOrdertotal();
	   float price = viewOrders.getTprice();
	   viewOrders.setTprice((float)ordernum*price);
	   
	   request.getSession().setAttribute("price", price);
	   request.getSession().setAttribute("viewOrders", viewOrders);
	   mav.setViewName("admin/order/vieworder-update");
	   return mav;
   }
   
   /**
    * 删除景点订单
    */
   @ResponseBody
   @RequestMapping(value = "update_ViewOrder",method = RequestMethod.POST)
   public Json deleteViewOrder(ViewOrder viewOrder,HttpServletRequest request){
	   Json j = new Json();
		try {
			viewOrderService.UpdateViewOrder(viewOrder);
			j.setSuccess(true);
			j.setMsg("更新成功！");
			j.setObj(viewOrder);
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }
   
}
