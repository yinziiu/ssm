package com.hz.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

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
import com.hz.model.Hotel;
import com.hz.model.View;
import com.hz.model.ViewComment;
import com.hz.model.ViewOrder;
import com.hz.model.ViewTicket;
import com.hz.service.IFoodService;
import com.hz.service.IHotelService;
import com.hz.service.IViewCommentService;
import com.hz.service.IViewOrderService;
import com.hz.service.IViewService;
import com.hz.service.IViewTicketService;
import com.hz.util.FileUtil;

@Controller
public class WebViewController {
	
	@Autowired
	private IViewService viewService;
	@Autowired 
	private IViewTicketService viewTicketService;
	@Autowired
	private IViewCommentService viewCommentService;
	@Autowired
	private IFoodService foodService;
	@Autowired
	private IViewOrderService viewOrderService;
	@Autowired
	private IHotelService hotelService;
	@Value("${SERVER_URL}")
    private String SERVER_URL;
	
	
	@RequestMapping("web/view")
	public ModelAndView listWebView(@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage){
		ModelAndView mav = new ModelAndView();
		
		//必游景点
		List<View> viewListtop5 = viewService.getbiyoutop5();
		mav.addObject("viewListtop5", viewListtop5);
		
		//热门景点
		List<View> viewrementop = viewService.getrementop();
		mav.addObject("viewrementop", viewrementop);
		
		//全部景点
		List<View> viewList= viewService.findViewList2(currentPage);
		PageInfo<View> page = new PageInfo<View>(viewList);
		Long listTotal = viewService.getViewListtotal();
		mav.addObject("viewList", viewList);
		mav.addObject("page", page);
		mav.addObject("listTotal", listTotal);
		
		mav.setViewName("views/view/view");
		
		return mav;
	}
	

	@RequestMapping("web/view_detail")
	public ModelAndView listWebView_detail(@RequestParam int vid,HttpServletRequest request,
			@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage){
		ModelAndView mav = new ModelAndView();
		request.getSession().setAttribute("vid", vid);
		//景点信息
		List<View> list = viewService.getViewDetailByID(vid);
		mav.addObject("list", list);
		String vname = "";
		String vticket = "";
		for (View view : list) {
			vname = view.getVname();
			vticket = view.getTicket();
		}
		mav.addObject("vname", vname);
		mav.addObject("vticket", vticket);
		
		//门票信息
		List<ViewTicket> viewTickets = viewTicketService.getViewTicketByID(vid);
		mav.addObject("viewTickets", viewTickets);
		
		//评论
		List<ViewComment> listVcomment = viewCommentService.getViewCommentByID(vid,currentPage);
		PageInfo<ViewComment> page = new PageInfo<ViewComment>(listVcomment);
		mav.addObject("listVcomment", listVcomment);
		Long total = viewCommentService.getViewCommentTotalByID(vid);
		mav.addObject("total", total);
		mav.addObject("page", page);
		String username = "";
		for(ViewComment viewComment : listVcomment){
			username = viewComment.getUsername();
		}
		mav.addObject("username", username);
		
		//热门景点
		List<View> viewList = viewService.getHotViewList2();
		mav.addObject("viewList", viewList);
		
		//热门美食
		List<Food> hotList = foodService.gethotFoodList();
		mav.addObject("hotList", hotList);
		
		//热门酒店
		List<Hotel> hotelList = hotelService.getHotHotelList();
		mav.addObject("hotelList", hotelList);
		
		mav.setViewName("views/view/view_detail");
		return mav;
	}
	
	/**
	 * 根据id跳转到详情页
	 *
	 */
	@RequestMapping("web/view_order")
	public ModelAndView listWebView_order(@RequestParam int id,@RequestParam int vid){
		ModelAndView mav = new ModelAndView();
		
		//门票信息
		List<ViewTicket> viewTicket = viewTicketService.getViewTicketByTID(id);
		mav.addObject("viewTicket", viewTicket);
		
		//全部门票
		List<ViewTicket> viewTickets = viewTicketService.getViewTicketByID(vid);
		mav.addObject("viewTickets", viewTickets);
		
		mav.setViewName("views/view/view_order");
		return mav;
	}
	
	@RequestMapping("web/view_order_comfrim")
	public ModelAndView listWebView_order_comfrim(@RequestParam int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		//门票信息
		ViewTicket viewTicket = viewTicketService.getViewTicketByTID2(id);
		request.getSession().setAttribute("viewTicket", viewTicket);
		mav.setViewName("views/view/view_order_comfrim");
		return mav;
	}
	
	@RequestMapping(value = "web/saveViewOrder",method = RequestMethod.POST)
	public ModelAndView saveViewOrder(ViewOrder viewOrder,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		ViewTicket viewTicket = viewTicketService.getSalesById(viewOrder.getVtid());
		System.out.println(viewTicket);
		int sales = viewTicket.getSales()+viewOrder.getOrdertotal();
		int id = viewOrder.getVid();
		ViewTicket viewTicket2 = new ViewTicket();
		viewTicket2.setId(id);
		viewTicket2.setSales(sales);
		viewTicketService.updateViewTicketSales(viewTicket2);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
        String timeStr = df.format(new Date());// new Date()为获取当前系统时间
        viewOrder.setBooktime(timeStr);
        String ordernumber = "";
        Random random = new Random();
        ordernumber+=random.nextInt(9)+1;
        for (int i = 0; i < 18-1; i++) {
        	ordernumber+=random.nextInt(10);
        }
        viewOrder.setOrdernumber(ordernumber);
        viewOrder.setStatus("2");
        viewOrderService.saveViewTicket(viewOrder);
        mav.setViewName("forward:/web/shop");
		return mav;
	}
	
	@RequestMapping("web/payViewOrder")
	public ModelAndView toMyViewOrder_detail(HttpServletRequest request,@RequestParam int id )throws Exception{
		ModelAndView mav = new ModelAndView();
		
		//订单详情
		ViewOrder viewOrders = viewOrderService.getViewOrderListById2(id);
		float price = 0;
		if (viewOrders.getStatus().equals("1")) {
			viewOrders.setStatus("已关闭");
		}
		if (viewOrders.getStatus().equals("2")) {
			viewOrders.setStatus("待支付");
		}
		if (viewOrders.getStatus().equals("3")) {
			viewOrders.setStatus("已完成");
		}
		int ordernum = viewOrders.getOrdertotal();
		price = viewOrders.getTprice();
		viewOrders.setTprice((float)ordernum*price);
		System.out.println(viewOrders);
		
		mav.addObject("viewOrders", viewOrders);
		mav.addObject("price", price);
		request.getSession().setAttribute("id", id);
		mav.setViewName("views/view/view_order_pay");
		return mav;
	}
	
	@RequestMapping("web/payViewOrderend")
	public ModelAndView payViewOrderend(HttpServletRequest request, ViewOrder viewOrder,@RequestParam int id)throws Exception{
		ModelAndView mav = new ModelAndView();
		id = viewOrder.getId();
		viewOrder.setStatus("3");
		viewOrderService.updateStatus(viewOrder);
		mav.setViewName("forward:/web/myvieworder");
		return mav;
	}
	
	@RequestMapping("web/quxiaoViewOrder")
	public ModelAndView quxiaoViewOrder(HttpServletRequest request, ViewOrder viewOrder,@RequestParam int id)throws Exception{
		ModelAndView mav = new ModelAndView();
		id = viewOrder.getId();
		viewOrder.setStatus("1");
		viewOrderService.updateStatus(viewOrder);
		mav.setViewName("forward:/web/myvieworder");
		return mav;
	}
	
	@RequestMapping("web/deleteViewOrderend")
	public ModelAndView deleteViewOrderend(HttpServletRequest request,@RequestParam int id)throws Exception{
		ModelAndView mav = new ModelAndView();
		viewOrderService.deleteViewOrder(id);
		mav.setViewName("forward:/web/myvieworder");
		return mav;
	}
	
	/**
     * 添加点评
     */
    @ResponseBody
    @RequestMapping(value = "saveVComment", method = RequestMethod.POST)
    public ModelAndView saveVComment(ViewComment viewComment,HttpServletRequest request,
    		@RequestParam int vid,
    		@RequestParam(value = "vphotopic", required = false) MultipartFile uploadFile) {
    	ModelAndView mav = new ModelAndView();
    	System.out.println(viewComment);
        try {
			if (uploadFile != null) {
				if (uploadFile != null) {
					String fileName = uploadFile.getOriginalFilename();
					String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
					if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
						List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
						viewComment.setVphoto(strList.get(0));
					}
				}
			}
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
	        String timeStr = df.format(new Date());// new Date()为获取当前系统时间
	        viewComment.setVcommenttime(timeStr);
			viewCommentService.saveViewComment(viewComment);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mav.setViewName("forward:/web/view_detail");
		return mav;   
    }
    
    /**
     * 更新点评点评
     */
    @ResponseBody
    @RequestMapping(value = "updateVComment", method = RequestMethod.POST)
    public ModelAndView updateVComment(ViewComment viewComment,HttpServletRequest request,@RequestParam int vid) {
    	ModelAndView mav = new ModelAndView();
    	System.out.println(viewComment);
        try {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
	        String timeStr = df.format(new Date());// new Date()为获取当前系统时间
	        viewComment.setVcommenttime(timeStr);
			viewCommentService.updateViewComment(viewComment);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mav.setViewName("forward:/web/view_detail");
		return mav;   
    }
    
    
    /**
     * 更新点评图片
     */
    @ResponseBody
    @RequestMapping(value = "updateVCommentPhoto", method = RequestMethod.POST)
    public ModelAndView updateFCommentPhoto(ViewComment viewComment,HttpServletRequest request,@RequestParam int vid,
    		@RequestParam(value = "vphotopic", required = false) MultipartFile uploadFile,
    		@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage) {
    	ModelAndView mav = new ModelAndView();
        try {
        	System.out.println(uploadFile);
        	if (uploadFile != null) {
				if (uploadFile != null) {
					String fileName = uploadFile.getOriginalFilename();
					String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
					if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
						List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
						viewComment.setVphoto(strList.get(0));
					}
				}
			}
	        viewCommentService.updateViewCommentPhoto(viewComment);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mav.setViewName("forward:/web/view_detail");
		return mav;   
    }

    

	
}
