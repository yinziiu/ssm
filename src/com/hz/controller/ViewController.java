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

import com.hz.model.View;
import com.hz.model.ViewImages;
import com.hz.model.ViewType;
import com.hz.model.layer.Json;
import com.hz.service.IViewService;
import com.hz.service.IViewTicketService;
import com.hz.service.IViewTypeService;
import com.hz.util.FileUtil;

@Controller
public class ViewController {

	@Autowired
	private IViewService viewService;
	@Autowired
	private IViewTypeService viewTypeService;
	@Autowired
	private IViewTicketService viewTicketService;
	@Value("${SERVER_URL}")
	private String SERVER_URL;
	@Value("${WEB_WORK_ADDRESS}")
	private String WEB_WORK_ADDRESS;

	/**
	 * 景点列表
	 * 
	 * @return
	 */
	@RequestMapping("getViewList")
	public ModelAndView listView(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<View> viewList = viewService.findViewList();
		Long totalList = viewService.getViewListtotal();
		// 放入转发参数
		mav.addObject("viewList", viewList);
		mav.addObject("totalList", totalList);
		// 放入jsp路径
		mav.setViewName("admin/view/view-list");
		return mav;
	}

	/**
	 * 显示景点描述
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("show_intro")
	public ModelAndView show_intro(int id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String intro = viewService.getViewIntroById(id);
		request.getSession().setAttribute("intro", intro);
		mav.setViewName("admin/view/show_intro");
		return mav;
	}

	/**
	 * 显示景点门票描述
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("show_ticket")
	public ModelAndView show_ticket(int id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String ticket = viewService.getViewTicketById(id);
		request.getSession().setAttribute("ticket", ticket);
		mav.setViewName("admin/view/show_ticket");
		return mav;
	}

	/**
	 * 显示景点门票描述
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("show_traffic")
	public ModelAndView show_traffic(int id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String traffic = viewService.getViewTrafficById(id);
		request.getSession().setAttribute("traffic", traffic);
		mav.setViewName("admin/view/show_traffic");
		return mav;
	}
	
	

	/**
	 * 转跳到添加景点页面
	 * 
	 * @return
	 */
	@RequestMapping("addview")
	public ModelAndView AddView(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<ViewType> viewTypes = viewTypeService.getViewTypeList();
		request.getSession().setAttribute("viewTypes", viewTypes);
		mav.setViewName("admin/view/view-add");
		return mav;
	}

	/**
	 * 添加景点
	 */
	@ResponseBody
	@RequestMapping(value = "saveView", method = RequestMethod.POST)
	public Json saveView(View view, @RequestParam(value = "vphoto", required = false) MultipartFile uploadFile,
			HttpServletRequest request) {
		Json json = new Json();
		try {
			System.out.println(uploadFile);
			if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
					List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
					view.setViewphoto(strList.get(0));
				}
			}
			viewService.saveView(view);
			json.setSuccess(true);
			json.setMsg("添加成功");
			json.setObj(view);
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}

	/**
	 * 转跳到编辑景点页面
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "updateView")
	public ModelAndView updateView(int id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		View views = viewService.getViewListById(id);
		request.getSession().setAttribute("views", views);
		List<ViewType> viewTypes = viewTypeService.getViewTypeList();
		request.getSession().setAttribute("viewTypes", viewTypes);
		mav.setViewName("admin/view/view-update");
		return mav;
	}

	/**
	 * 更新景点图片
	 */
	@ResponseBody
	@RequestMapping(value = "update_vphoto")
	public Json update_vphoto(View view, HttpServletRequest request,
			@RequestParam(value = "vphoto", required = false) MultipartFile uploadFile) {
		Json json = new Json();
		try {
			if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
					View view2 = viewService.getViewListById(view.getId());
					if (null != view2.getViewphoto() && "" != view2.getViewphoto()) {
						// 删除图片文件
						FileUtil.deleteFile(view2.getViewphoto(), request);
					}
					List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
					view.setViewphoto(strList.get(0));
				}
			}
			viewService.update_vphoto(view);
			json.setSuccess(true);
			json.setMsg("添加成功");
			json.setObj(view);
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
	
	/**
	 * 更新景点信息
	 */
	@ResponseBody
	@RequestMapping(value = "update_View")
	public Json update_vphoto(View view, HttpServletRequest request) {
		Json json = new Json();
		try {
			View view2 = viewService.getViewListById(view.getId());
			if (null != view2.getViewphoto() && "" != view2.getViewphoto()) {
				// 删除图片文件
				FileUtil.deleteFile(view2.getViewphoto(), request);
			}
			viewService.updateView(view);
			json.setSuccess(true);
			json.setMsg("添加成功");
			json.setObj(view);
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}

	/**
	 * 删除景点
	 */
	@ResponseBody
	@RequestMapping(value = "deleteView", method = RequestMethod.POST)
	public Json deleteView(int id, HttpServletRequest request) {
		Json j = new Json();
		try {
			viewService.deleteView(id);
			j.setSuccess(true);
			j.setMsg("删除成功！");
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
	}
	
	/**
	 * 显示景点门票描述
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("view_img_add")
	public ModelAndView view_img_add(int id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<ViewImages> viewImages = viewService.getViewImages(id);
		System.out.println(viewImages);
		String viewphoto = "";
		for(ViewImages viewImages2 : viewImages){
			viewphoto = viewImages2.getViewphoto();
		}
		request.getSession().setAttribute("viewphoto", viewphoto);
		request.getSession().setAttribute("viewphoto", viewphoto);
		request.getSession().setAttribute("vid", id);
		mav.setViewName("admin/view/view-images");
		return mav;
	}
	@ResponseBody
	@RequestMapping("add_img")
	public ModelAndView add_img(int vid, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println(vid);
		request.getSession().setAttribute("vid", vid);
		mav.setViewName("admin/view/view-images-add");
		return mav;
	}
	/**
	 * 添加图片
	 * 
	 */
	@ResponseBody
	@RequestMapping(value = "AddViewPhoto", method = RequestMethod.POST)
	public Json AddViewPhoto(ViewImages viewImages, @RequestParam(value = "viphoto", required = false) MultipartFile uploadFile,
		HttpServletRequest request) {
	Json json = new Json();
	try {
		System.out.println(uploadFile);
		if (uploadFile != null) {
			String fileName = uploadFile.getOriginalFilename();
			String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
			if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
				List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
				viewImages.setViewimg(strList.get(0));
			}
		}
		viewService.saveViewPhoto(viewImages);
		json.setSuccess(true);
		json.setMsg("添加成功");
		json.setObj(viewImages);
	} catch (Exception e) {
		json.setMsg("操作失败！");
		e.printStackTrace();
	}
	return json;
}

	

}
