package com.hz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

import com.hz.model.Role;
import com.hz.model.User;
import com.hz.model.layer.Json;
import com.hz.service.IFoodCommentService;
import com.hz.service.IFoodService;
import com.hz.service.IHotelCommentService;
import com.hz.service.IHotelInfoService;
import com.hz.service.IHotelOrderService;
import com.hz.service.IHotelService;
import com.hz.service.INotesService;
import com.hz.service.IRoleService;
import com.hz.service.IStrategyService;
import com.hz.service.IUserService;
import com.hz.service.IViewCommentService;
import com.hz.service.IViewOrderService;
import com.hz.service.IViewService;
import com.hz.service.IViewTicketService;
import com.hz.service.IViewTypeService;
import com.hz.util.FileUtil;

@Controller
public class AdminController {

	@Autowired
	private IUserService userService;
	@Autowired
	private IRoleService roleService;
	@Autowired
	private INotesService notesService;
	@Autowired 
	private IStrategyService strategyService;
	@Autowired
	private IFoodCommentService foodCommentService;
	@Autowired
	private IFoodService foodService;
	@Autowired
	private IViewCommentService viewCommentService;
	@Autowired
	private IViewOrderService viewOrderService;
	@Autowired
	private IViewService viewService;
	@Autowired
	private IViewTicketService viewTicketServce;
	@Autowired
	private IViewTypeService viewTypeService;
	@Autowired
	private IHotelCommentService hotelCommentService;
	@Autowired
	private IHotelOrderService hotelOrderService;
	@Autowired
	private IHotelService hotelService;
	@Autowired
	private IHotelInfoService hotelInfoService;
	@Value("${SERVER_URL}")
    private String SERVER_URL;
	@Value("${WEB_WORK_ADDRESS}")
    private String WEB_WORK_ADDRESS;

	/**
	 * 访问后台登录页面
	 * 
	 * @return
	 */
	@RequestMapping("admin/login")
	public ModelAndView toLogin() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/login");
		return mav;
	}

	/**
	 * 访问后台首页
	 * @return
	 */
	@RequestMapping("/Index")
	public ModelAndView toIndex() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/index");
		return mav;
	}
	
	/**
	 * 访问后台首页
	 * @return
	 */
	@RequestMapping("/welcome")
	public ModelAndView toWelcome(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		Long viewTotal = viewService.getViewListtotal();
		request.getSession().setAttribute("viewTotal", viewTotal);
		Long hotelTotal = hotelService.getHotelListTotal();
		request.getSession().setAttribute("hotelTotal", hotelTotal);
		Long foodTotal = foodService.getFoodListTotal();
		request.getSession().setAttribute("foodTotal", foodTotal);
		Long strategyTotal = strategyService.getStrategyListTotal();
		request.getSession().setAttribute("strategyTotal", strategyTotal);
		Long notesTotal = notesService.getNotesListTotal();
		request.getSession().setAttribute("notesTotal", notesTotal);
		Long vieworderTotal = viewOrderService.getViewOrderListtotal();
		request.getSession().setAttribute("vieworderTotal", vieworderTotal);
		Long hotelorderTotal = hotelOrderService.getHotelOrderListtotal();
		request.getSession().setAttribute("hotelorderTotal", hotelorderTotal);
		Long viewcommentTotal = viewCommentService.getViewCommentListtotal();
		request.getSession().setAttribute("viewcommentTotal", viewcommentTotal);
		Long hotelcommentTotal = hotelCommentService.getHotelCommentListtotal();
		request.getSession().setAttribute("hotelcommentTotal", hotelcommentTotal);
		Long foodcommentTotal = foodCommentService.getFoodCommentListtotal();
		request.getSession().setAttribute("foodcommentTotal", foodcommentTotal);
		Long userTotal = userService.getUserListTotal();
		request.getSession().setAttribute("userTotal", userTotal);
		Long adminTotal = userService.getAdminUserListTotal();
		request.getSession().setAttribute("adminTotal", adminTotal);
		Long hotelTotal1 = hotelInfoService.getHotelTypeTotal();
		request.getSession().setAttribute("hotelTotal1", hotelTotal1);
		Long hotelTotal2 = hotelInfoService.getHotelRoomTypeTotal();
		request.getSession().setAttribute("hotelTotal2", hotelTotal2);
		Long hotelTotal3 = hotelInfoService.getHotelInfoTotal();
		request.getSession().setAttribute("hotelTotal3", hotelTotal3);
		Long hotelTotal4 = hotelInfoService.getHotelServiceTotal();
		request.getSession().setAttribute("hotelTotal4", hotelTotal4);
		Long hotelTotal5 = hotelInfoService.getHotelFacTotal();
		request.getSession().setAttribute("hotelTotal5", hotelTotal5);
		Long hotelTotal6 = hotelInfoService.getHotelRoomInfoTotal();
		request.getSession().setAttribute("hotelTotal6", hotelTotal6);
		Long hotelTotal7 = hotelInfoService.getHotelStoryTotal();
		request.getSession().setAttribute("hotelTotal7", hotelTotal7);
		Long viewType = viewTypeService.getViewTypeListTotal();
		request.getSession().setAttribute("viewType", viewType);
		Long viewticket = viewTicketServce.getViewTicketListTotal();
		request.getSession().setAttribute("viewticket", viewticket);
		
		String s1 = request.getServerName();
		String s2 = request.getServletPath();
		int s3 = request.getServerPort();
		String s4 = request.getProtocol();
		String s5 = request.getRequestURI();
		request.getSession().setAttribute("s1", s1);
		request.getSession().setAttribute("s2", s2);
		request.getSession().setAttribute("s3", s3);
		request.getSession().setAttribute("s4", s4);
		request.getSession().setAttribute("s5", s5);
		mav.setViewName("admin/welcome");
		return mav;
	}


	/**
	 * 管理员登录
	 */
	@ResponseBody
	@RequestMapping(value = "adminlogin", method = RequestMethod.POST)
	public ModelAndView AdminLogin(@RequestParam String username, @RequestParam String password,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		User adminuser = userService.findUserByName2(username);
		System.out.println(adminuser);
		if (adminuser != null) {
			if (adminuser.getPassword().equals(password)) {
				request.getSession().setAttribute("adminuser", adminuser);
				mav.setViewName("forward:/Index");
			} else {
				request.getSession().setAttribute("msg", "用户名或密码错误");
				// 放入jsp路径
				mav.setViewName("admin/login");
			}
		} else {
			request.getSession().setAttribute("msg", "用户名或密码错误");
			// 放入jsp路径
			mav.setViewName("admin/login");
		}
		return mav;
	}
	
	/**
	 * 访问信息页面
	 * 
	 * @return
	 */
	@RequestMapping("admin/info")
	public ModelAndView toAdminInfo() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin-info");
		return mav;
	}
	
	/**
     * 退出
     *
     * @return
     */
	@RequestMapping(value = "admin/logout")
    public String logout(HttpSession session, HttpServletResponse response) {
        User user = (User) session.getAttribute("dbuser");
        if (user!=null) {
        	session.removeAttribute("dbuser");
		}
        return "redirect:/admin/login";
    }

	/**
	 * 管理员列表
	 * 
	 * @return
	 */
	@RequestMapping("getAdminList")
	public ModelAndView listAdmin() {
		ModelAndView mav = new ModelAndView();
		List<User> adminList = userService.getAdminUserList();
		Long totalList = userService.getAdminUserListTotal();
		for (User user : adminList) {
			if (user.getSex().equals("1")) {
				user.setSex("女");
			} else if (user.getSex().equals("0")) {
				user.setSex("男");
			} else if (user.getSex().equals("2")) {
				user.setSex("保密");
			}
			user.setPhoto(WEB_WORK_ADDRESS+user.getPhoto());
		}
		// 放入转发参数
		mav.addObject("adminList", adminList);
		mav.addObject("totalList", totalList);
		// 放入jsp路径
		mav.setViewName("admin/admin_/admin-list");
		return mav;
	}
	
	/**
	 * 跳转到添加管理员页面
	 */
	@RequestMapping("AddAdmin")
	public ModelAndView AddAdmin(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<Role> roles = roleService.getRoleList();
		request.getSession().setAttribute("roles", roles);
		mav.setViewName("admin/admin_/admin-add");
		return mav;
	}
	

    /**
     * 添加管理员
     */
    @ResponseBody
    @RequestMapping(value = "saveAdmin", method = RequestMethod.POST)
    public Json saveAdmin(User user,@RequestParam(value = "myphoto", required = false) MultipartFile uploadFile,
			HttpServletRequest request) {
    	System.out.println(user);
    	Json json = new Json();
        try {
			if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
					List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
					user.setPhoto(strList.get(0));
				}
			}
        	User user2 = userService.findUserByName(user.getUsername());
        	if (user2==null) {
    			userService.addAdmin(user);
    			json.setSuccess(true);
                json.setMsg("添加成功");
                json.setObj(user);
			}else{
				userService.updateUser2(user);
				json.setSuccess(true);
                json.setMsg("添加成功");
                json.setObj(user);
			}
            
        } catch (Exception e) {
            json.setMsg("操作失败！");
            e.printStackTrace();
        }
        return json;       
    }
    
    /**
	 * 跳转到编辑管理员页面
	 */
	@RequestMapping("UpdateAdmin")
	public ModelAndView UpdateAdmin(int id,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		User user = userService.getUserById2(id);
		request.getSession().setAttribute("user", user);
		mav.setViewName("admin/admin_/admin-update");
		return mav;
	}
	

	/**
   	 * 更新管理员信息
   	 */
    @ResponseBody
   	@RequestMapping(value="update_Admin")
   	public Json update_Admin(User user,HttpServletRequest request) {
   		Json json = new Json();
   		System.out.println(user);
   		try {
			userService.updateAdmin(user);
			json.setSuccess(true);
            json.setMsg("添加成功");
            json.setObj(user);
		} catch (Exception e) {
			 json.setMsg("操作失败！");
	         e.printStackTrace();
		}
    	return json;
   	}
    
    /**
	 * 更新头像
	 */
	@ResponseBody
   	@RequestMapping(value="update_aphoto")
   	public Json update_aphoto(User user,HttpServletRequest request,
   			@RequestParam(value = "myphoto", required = false) MultipartFile uploadFile) {
   		Json json = new Json();
   		System.out.println(user);
   		try {
   			if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName)&& FileUtil.checkPic(suffix)) {
					User user2 = userService.getUserById2(user.getId());
					if (null != user2.getPhoto() && "" != user2.getPhoto()) {
						// 删除图片文件
						FileUtil.deleteFile(user2.getPhoto(),request);
					}
					List<String> strList = FileUtil.saveFile(uploadFile,request, SERVER_URL);
					user.setPhoto(strList.get(0));
				}
			}
			userService.updatephoto(user);
			json.setSuccess(true);
            json.setMsg("添加成功");
            json.setObj(user);
		} catch (Exception e) {
			 json.setMsg("操作失败！");
	         e.printStackTrace();
		}
    	return json;
   	}
    
    /**
   	 * 删除管理员信息
   	 */
    @ResponseBody
   	@RequestMapping(value="deleteAdmin")
   	public Json deleteAdmin(int id,HttpServletRequest request) {
   		Json json = new Json();
   		try {
			User user2 = userService.getUserById2(id);
			if (null != user2.getPhoto() && "" != user2.getPhoto()) {
				// 删除图片文件
				FileUtil.deleteFile(user2.getPhoto(),request);
			}
			userService.deleteUser(id);
			json.setSuccess(true);
            json.setMsg("添加成功");
		} catch (Exception e) {
			 json.setMsg("操作失败！");
	         e.printStackTrace();
		}
    	return json;
   	}
    

	/**
	 * 用户列表
	 * 
	 * @return
	 */
	@RequestMapping("getUserList")
	public ModelAndView listUser() {
		ModelAndView mav = new ModelAndView();
		List<User> userList = userService.findUserList();
		Long totalList = userService.getUserListTotal();
		for (User user : userList) {
			if (user.getSex().equals("1")) {
				user.setSex("女");
			} else if (user.getSex().equals("0")) {
				user.setSex("男");
			} else if (user.getSex().equals("2")) {
				user.setSex("保密");
			}
			user.setPhoto(WEB_WORK_ADDRESS+user.getPhoto());
		}
		// 放入转发参数
		mav.addObject("userList", userList);
		mav.addObject("totalList", totalList);
		// 放入jsp路径
		mav.setViewName("admin/user/user-list");
		return mav;
	}

	/**
	 * 跳转到添加用户页面
	 */
	@RequestMapping("AddUser")
	public ModelAndView AddUser() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/user/user-add");
		return mav;
	}
	

    /**
     * 添加用户
     */
    @ResponseBody
    @RequestMapping(value = "saveUser", method = RequestMethod.POST)
    public Json saveUser(User user,@RequestParam(value = "myphoto", required = false) MultipartFile uploadFile,
			HttpServletRequest request) {
    	System.out.println(user);
    	Json json = new Json();
        try {
        	if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
					List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
					user.setPhoto(strList.get(0));
				}
			}
        	User user2 = userService.findUserByName(user.getUsername());
        	if (user2==null) {
    			userService.register(user);
    			json.setSuccess(true);
                json.setMsg("添加成功");
                json.setObj(user);
			}else{
				userService.updateUser2(user);
				json.setSuccess(true);
                json.setMsg("添加成功");
                json.setObj(user);
			}
            
        } catch (Exception e) {
            json.setMsg("操作失败！");
            e.printStackTrace();
        }
        return json;       
    }
    
    /**
	 * 跳转到编辑用户页面
	 */
    @ResponseBody
	@RequestMapping(value="updateUser")
	public ModelAndView updateUser(int id,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println(id);
		User user = userService.getUserById(id);
		request.getSession().setAttribute("user", user);
		mav.setViewName("admin/user/user-update");
		return mav;
	}
    
    
    /**
   	 * 跳转到编辑用户页面
   	 */
       @ResponseBody
   	@RequestMapping(value="update_User")
   	public Json update_User(User user,HttpServletRequest request) {
   		Json json = new Json();
   		System.out.println(user);
   		try {
			userService.updateUser2(user);
			json.setSuccess(true);
            json.setMsg("添加成功");
            json.setObj(user);
		} catch (Exception e) {
			 json.setMsg("操作失败！");
	         e.printStackTrace();
		}
    	return json;
   	}
       
    
    /**
     * 删除用户
     */
    @ResponseBody
    @RequestMapping(value = "deleteUser",method = RequestMethod.POST)
    public Json deleteHotelType(int id,HttpServletRequest request){
 	   Json j = new Json();
 		try {
 			//查询是否有点评和订单，有则不可以删除
 			Long VTotal = viewCommentService.getViewCommentTotalByUId(id);
 			Long HTotal = hotelCommentService.getHotelCommentTotalByUId(id);
 			Long FTotal = foodCommentService.getFoodCommentTotalByUId(id);
 			Long Vorder = viewOrderService.getViewOrderTotalByUID(id);
 			Long Horder = hotelOrderService.getHotelOrderTotalByUId(id);
 			
 			if (VTotal==0 || HTotal==0 || VTotal==0 || FTotal==0 || Vorder==0 || Horder==0  ) {
				User user = userService.getUserById(id);
				if (null != user.getPhoto() && "" != user.getPhoto()) {
					// 删除图片文件
					FileUtil.deleteFile(user.getPhoto(), request);
				}
				userService.deleteUser(id);
	 			j.setSuccess(true);
	 			j.setMsg("删除成功！");
 			}
 		} catch (Exception e) {
 			j.setMsg("操作失败！");
 			e.printStackTrace();
 		}
 		return j;
    }
    
    
    /**
	 * 更新头像
	 */
	@ResponseBody
   	@RequestMapping(value="update_photo")
   	public Json update_photo(User user,HttpServletRequest request,
   			@RequestParam(value = "myphoto", required = false) MultipartFile uploadFile) {
   		Json json = new Json();
   		System.out.println(user);
   		try {
   			if (uploadFile != null) {
				String fileName = uploadFile.getOriginalFilename();
				String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
				if (StringUtils.isNotBlank(fileName)&& FileUtil.checkPic(suffix)) {
					User user2 = userService.getUserById(user.getId());
					if (null != user2.getPhoto() && "" != user2.getPhoto()) {
						// 删除图片文件
						FileUtil.deleteFile(user2.getPhoto(),request);
					}
					List<String> strList = FileUtil.saveFile(uploadFile,request, SERVER_URL);
					user.setPhoto(strList.get(0));
				}
			}
			userService.updatephoto(user);
			json.setSuccess(true);
            json.setMsg("添加成功");
            json.setObj(user);
		} catch (Exception e) {
			 json.setMsg("操作失败！");
	         e.printStackTrace();
		}
    	return json;
   	}
    

}
