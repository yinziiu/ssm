package com.hz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hz.model.ViewTicket;
import com.hz.model.layer.Json;
import com.hz.service.IViewTicketService;

@Controller
public class ViewTicketController {
	
	@Autowired
	private IViewTicketService viewTicketService;
	
	/**
	 * 后台景点门票
	 * @return
	 */
	@RequestMapping("vticket")
	public ModelAndView listWebView(){
		ModelAndView mav = new ModelAndView();
		
		List<ViewTicket> viewsTicketList  = viewTicketService.getViewTicketList_1();
		mav.addObject("viewsTicketList", viewsTicketList);
		Long totalList  = viewTicketService.getViewTicketListTotal();
		mav.addObject("totalList", totalList);
		
		mav.setViewName("admin/view/viewticket-list");
		
		return mav;
	}
	
	/**
	 * 景点列表查看门票
	 */
    @ResponseBody
	@RequestMapping("vticketList")
	public ModelAndView listTicket(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		System.out.println(id);
		List<ViewTicket> viewTickets = viewTicketService.getViewTicketList_2(id);
		mav.addObject("viewTickets", viewTickets);
		Long totalList  = viewTicketService.getViewTicketListTotal2(id);
		mav.addObject("totalList", totalList);
		request.getSession().setAttribute("id", id);
		mav.setViewName("admin/view/viewticket-list2");
		return mav;
	}
    
    /**
	 * 添加门票页
	 */
    @ResponseBody
	@RequestMapping("add_ticket")
	public ModelAndView add_ticket(int vid,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		request.getSession().setAttribute("vid", vid);
		mav.setViewName("admin/view/viewticket-add");
		return mav;
	}
    
    /**
     * 删除景点
     */
    @ResponseBody
    @RequestMapping(value = "save-view-ticket",method = RequestMethod.POST)
    public Json save_view_ticket(ViewTicket viewTicket,HttpServletRequest request){
 	   Json j = new Json();
 		try {
 			viewTicketService.saveViewTicket(viewTicket);
 			j.setObj(viewTicket);
 			j.setSuccess(true);
 			j.setMsg("删除成功！");
 		} catch (Exception e) {
 			j.setMsg("操作失败！");
 			e.printStackTrace();
 		}
 		return j;
    }
    
    /**
	 * 编辑门票页
	 */
    @ResponseBody
	@RequestMapping("update_ticket")
	public ModelAndView update_ticket(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		ViewTicket viewTicket = viewTicketService.getViewTicketById(id);
		request.getSession().setAttribute("viewTicket", viewTicket);
		mav.setViewName("admin/view/viewticket-update");
		return mav;
	}
    
    /**
     * 修改门票
     * @param viewTicket
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "update-view-ticket",method = RequestMethod.POST)
    public Json update_view_ticket(ViewTicket viewTicket,HttpServletRequest request){
 	   Json j = new Json();
 		try {
 			viewTicketService.updateViewTicket(viewTicket);
 			j.setObj(viewTicket);
 			j.setSuccess(true);
 			j.setMsg("删除成功！");
 		} catch (Exception e) {
 			j.setMsg("操作失败！");
 			e.printStackTrace();
 		}
 		return j;
    }
    
    
    /**
     * 删除景点
     */
    @ResponseBody
    @RequestMapping(value = "deleteViewTicket",method = RequestMethod.POST)
    public Json deleteViewTicket(int id,HttpServletRequest request){
 	   Json j = new Json();
 		try {
 			viewTicketService.deleteViewTicket(id);
 			j.setSuccess(true);
 			j.setMsg("删除成功！");
 		} catch (Exception e) {
 			j.setMsg("操作失败！");
 			e.printStackTrace();
 		}
 		return j;
    }
	
}
