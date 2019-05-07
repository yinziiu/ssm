package com.hz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.hz.model.ViewTicket;
import com.hz.service.IViewTicketService;

@Controller
public class WebViewTicketController {
	
	@Autowired
	private IViewTicketService viewTicketService;
	
	@RequestMapping("web/shop")
	public ModelAndView listWebView(@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage){
		ModelAndView mav = new ModelAndView();
		
		//按浏览排行
		List<ViewTicket> viewsTicketList  = viewTicketService.getViewShopping(currentPage);
		PageInfo<ViewTicket> page = new PageInfo<ViewTicket>(viewsTicketList);
		mav.addObject("viewsTicketList", viewsTicketList);
		mav.addObject("page", page);
		
		//热卖
		List<ViewTicket> viewsTicketList2  = viewTicketService.getViewShopping2();
		mav.addObject("viewsTicketList2", viewsTicketList2);
		
		mav.setViewName("views/view/view_shopping");
		
		return mav;
	}
	
	@RequestMapping("web/FindTicket")
	public ModelAndView ServiceTicket(@RequestParam String tname,@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage){
		ModelAndView mav = new ModelAndView();
		List<ViewTicket> viewTickets = viewTicketService.getTicketListByTname(tname,currentPage);
		PageInfo<ViewTicket> page = new PageInfo<ViewTicket>(viewTickets);
		mav.addObject("viewTickets", viewTickets);
		mav.addObject("page", page);
		//热卖
		List<ViewTicket> viewsTicketList2  = viewTicketService.getViewShopping2();
		mav.addObject("viewsTicketList2", viewsTicketList2);
		//按浏览排行
		mav.setViewName("views/view/view_shopping2");
		return mav;
	}
}
