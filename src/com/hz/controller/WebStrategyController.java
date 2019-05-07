package com.hz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.hz.model.Strategy;
import com.hz.model.View;
import com.hz.service.IStrategyService;
import com.hz.service.IViewService;

@Controller
public class WebStrategyController {
	
	@Autowired
	private IStrategyService strategyService;
	@Autowired 
	private IViewService viewService;
	
	
	@RequestMapping("web/strategy")
	public ModelAndView listWebStrategy(@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage){
		ModelAndView mav = new ModelAndView();
		
		List<Strategy> strategiesList = strategyService.getStrategyList3(currentPage);
		Long listTotal = strategyService.getStrategyListTotal();
		PageInfo<Strategy> page = new PageInfo<Strategy>(strategiesList);
		mav.addObject("strategiesList", strategiesList);
		mav.addObject("listTotal", listTotal);
		mav.addObject("page", page);
		
		List<View> vname = viewService.getViewName();
		mav.addObject("vname",vname);
		
		mav.setViewName("views/strategy/strategy");
		
		return mav;
	}
	
	/**
	 * 根据id跳转到详情页面
	 * 
	 */
	@RequestMapping("web/strategy_detail")
	public ModelAndView ToStrtaegy_detail(@RequestParam int id){
		ModelAndView mav = new ModelAndView();
		
		List<Strategy> strategies = strategyService.getStrategyListById(id);
		mav.addObject("strategies",strategies);
		
		List<Strategy> strategieList = strategyService.getStrategyList5();
		mav.addObject("strategieList",strategieList);
		
		mav.setViewName("views/strategy/strategy_detail");
		
		return mav;
	}
	
	

}
