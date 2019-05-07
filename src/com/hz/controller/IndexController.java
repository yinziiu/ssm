package com.hz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hz.model.Food;
import com.hz.model.FoodComment;
import com.hz.model.Hotel;
import com.hz.model.HotelComment;
import com.hz.model.Notes;
import com.hz.model.Strategy;
import com.hz.model.View;
import com.hz.model.ViewComment;
import com.hz.model.ViewTicket;
import com.hz.service.IFoodCommentService;
import com.hz.service.IFoodService;
import com.hz.service.IHotelCommentService;
import com.hz.service.IHotelService;
import com.hz.service.INotesService;
import com.hz.service.IStrategyService;
import com.hz.service.IViewCommentService;
import com.hz.service.IViewService;
import com.hz.service.IViewTicketService;

@Controller
public class IndexController {
	
	@Autowired 
	private IViewService viewService;
	@Autowired
	private IViewTicketService viewTicketService;
	@Autowired
	private IViewCommentService viewCommentService;
	
	@Autowired 
	private IHotelService hotelService;
	@Autowired
	private IHotelCommentService hotelCommentService;
	
	@Autowired
	private IFoodService foodService;
	@Autowired
	private IFoodCommentService foodCommentService;
	
	@Autowired
	private INotesService notesService;
	
	@Autowired
	private IStrategyService strategyService;
	
	
	

	/**
	 * 访问首页
	 * @return
	 */
	@RequestMapping("web/index")
	public ModelAndView toIndex(@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage)throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<View> viewsList  = viewService.findViewList();
		mav.addObject("viewsList", viewsList);
		List<ViewTicket> viewsTicketList  = viewTicketService.getViewTicketList();
		mav.addObject("viewsTicketList", viewsTicketList);
		List<ViewComment> viewcommentList= viewCommentService.getViewCommentList2();
		mav.addObject("viewcommentList", viewcommentList);
		
		List<Hotel> hotelList = hotelService.getHotelList2();
		mav.addObject("hotelList", hotelList);
		List<HotelComment> hotelcommentList= hotelCommentService.getHotelCommentList2();
		mav.addObject("hotelcommentList",hotelcommentList);
		
		List<Food> foodList = foodService.getFoodList();
		mav.addObject("foodList", foodList);
		List<FoodComment> foodcommentList= foodCommentService.getFoodCommentList2();
		mav.addObject("foodcommentList", foodcommentList);
		
		List<Notes> notesList = notesService.getNotesList1(currentPage);
		PageInfo<Notes> page = new PageInfo<Notes>(notesList);
        for(int i = 0;i < notesList.size();i++) {
            System.out.println(notesList.get(i));
        }
        for(int i = 0;i < notesList.size();i++) {
            System.out.println(notesList.get(i));
        }
		Long notesTotal = notesService.getNotesListTotal();
		mav.addObject("notesList", notesList);
		mav.addObject("page", page);
		mav.addObject("notesTotal", notesTotal);
		
		List<Strategy> strategiesList = strategyService.getStrategyList2();
		mav.addObject("strategiesList", strategiesList);
		
 		
		mav.setViewName("views/index");
		return mav;
	}
	
	/**
	 * 根据id查找信息
	 * @return
	 * @throws Exception
	 */
	/*@RequestMapping("web/view_detail")
	public ModelAndView toIndex_view(@RequestParam int id) throws Exception{
		ModelAndView mav = new ModelAndView();
		List<View> list = viewService.getViewDetailByID(id);
		mav.addObject("list", list);
		mav.setViewName("views/view/view_detail");
		return mav;
	}*/
	

}
