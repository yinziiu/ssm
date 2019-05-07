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

import com.hz.model.Strategy;
import com.hz.model.layer.Json;
import com.hz.service.IStrategyService;
import com.hz.util.FileUtil;

@Controller
public class StrategyController {

	@Autowired
	private IStrategyService strategyService;
	@Value("${SERVER_URL}")
	private String SERVER_URL;
	@Value("${WEB_WORK_ADDRESS}")
	private String WEB_WORK_ADDRESS;

	/**
	 * 攻略列表
	 * 
	 * @return
	 */
	@RequestMapping("getStrategyList")
	public ModelAndView getStrategyList() {
		ModelAndView mav = new ModelAndView();
		List<Strategy> strategiesList = strategyService.getStrategyList();
		Long totalList = strategyService.getStrategyListTotal();
		for (Strategy strategy : strategiesList) {
			strategy.setStphoto(WEB_WORK_ADDRESS + strategy.getStphoto());
		}
		// 放入转发参数
		mav.addObject("strategiesList", strategiesList);
		mav.addObject("totalList", totalList);
		// 放入jsp路径
		mav.setViewName("admin/strategy/strategy-list");
		return mav;
	}

	/**
	 * 添加攻略页面
	 */
	@RequestMapping("addStrategy")
	public ModelAndView addStrategy() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/strategy/strategy-list-add");
		return mav;
	}

	/**
	 * 添加攻略
	 */
	@ResponseBody
	@RequestMapping(value = "saveStrategy", method = RequestMethod.POST)
	public Json saveStrategy(Strategy strategy, HttpServletRequest request,
			@RequestParam(value = "sphoto", required = false) MultipartFile uploadFile) {
		Json j = new Json();
		try {
			if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
					List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
					strategy.setStphoto(strList.get(0));
				}
			}
			strategyService.saveStrategy(strategy);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
	}

	/**
	 * 编攻略页面
	 */
	@RequestMapping("updateStrategy")
	public ModelAndView updateStrategy(int id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Strategy strategy = strategyService.getStrategyById(id);
		request.getSession().setAttribute("strategy", strategy);
		mav.setViewName("admin/strategy/strategy-list-update");
		return mav;
	}

	/**
	 * 更新图片
	 */
	@ResponseBody
	@RequestMapping(value = "update_sphoto", method = RequestMethod.POST)
	public Json update_sphoto(Strategy strategy, HttpServletRequest request,
			@RequestParam(value = "sphoto", required = false) MultipartFile uploadFile) {
		Json j = new Json();
		try {
			if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
					Strategy strategy2 = strategyService.getStrategyById(strategy.getId());
					if (null!= strategy2.getStphoto() && "" != strategy2.getStphoto()) {
						FileUtil.deleteFile(strategy2.getStphoto(), request);
					}
					List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
					strategy.setStphoto(strList.get(0));
				}
			}
			strategyService.update_sphoto(strategy);
			j.setSuccess(true);
			j.setMsg("修改成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
	}

	/**
	 * 添加攻略
	 */
	@ResponseBody
	@RequestMapping(value = "update_Strategy", method = RequestMethod.POST)
	public Json update_Strategy(Strategy strategy, HttpServletRequest request) {
		Json j = new Json();
		try {
			strategyService.update_Strategy(strategy);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
	}

	/**
	 * 删除攻略
	 */
	@ResponseBody
	@RequestMapping(value = "deleteStrategy", method = RequestMethod.POST)
	public Json deleteStrategy(int id, HttpServletRequest request) {
		Json j = new Json();
		try {
			Strategy strategy2 = strategyService.getStrategyById(id);
			if (null!= strategy2.getStphoto() && "" != strategy2.getStphoto()) {
				FileUtil.deleteFile(strategy2.getStphoto(), request);
			}
			strategyService.deleteStrategy(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
	}

}
