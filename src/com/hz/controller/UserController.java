package com.hz.controller;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

import com.github.pagehelper.PageInfo;
import com.hz.model.FoodComment;
import com.hz.model.HotelComment;
import com.hz.model.HotelOrder;
import com.hz.model.Notes;
import com.hz.model.User;
import com.hz.model.ViewComment;
import com.hz.model.ViewOrder;
import com.hz.service.IFoodCommentService;
import com.hz.service.IHotelCommentService;
import com.hz.service.IHotelOrderService;
import com.hz.service.INotesService;
import com.hz.service.IUserService;
import com.hz.service.IViewCommentService;
import com.hz.service.IViewOrderService;
import com.hz.util.FileUtil;


@Controller
@RequestMapping("")
public class UserController {
	
	@Autowired
	private IUserService userService;
	@Autowired
	private INotesService notesService;
	@Autowired
	private IFoodCommentService foodCommentService;
	@Autowired
	private IViewCommentService viewCommentService;
	@Autowired
	private IHotelCommentService hotelCommentService;
	@Autowired
	private IViewOrderService viewOrderService;
	@Autowired
	private IHotelOrderService hotelOrderService;
	@Value("${SERVER_URL}")
    private String SERVER_URL;
	
	
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
	 * 访问前台登录页面
	 * @return
	 */
	@RequestMapping("web/login")
	public ModelAndView toWebLogin()throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("views/login");
		return mav;
	}
	
	/**
	 * 用户登录
	 */
	@ResponseBody
	@RequestMapping(value="weblogin",method = RequestMethod.POST)
	public ModelAndView login(@RequestParam String username,@RequestParam String password,
			                    HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		User dbuser = userService.findUserByName(username);
		if (dbuser!=null) {
			if (dbuser.getPassword().equals(password)) {
				request.getSession().setAttribute("dbuser", dbuser);
				mav.setViewName("forward:/web/index");	
			}else{
				request.getSession().setAttribute("msg", "用户名或密码错误");
				// 放入jsp路径
				mav.setViewName("views/login");
			}
		}else{
			request.getSession().setAttribute("msg", "用户名或密码错误");
			// 放入jsp路径
			mav.setViewName("views/login");
		}
		return mav; 
	}
	
	 /**
     * 用户注销
     *
     * @return
     */
	@RequestMapping(value = "/logout")
    public String logout(HttpSession session, HttpServletResponse response) {
        User user = (User) session.getAttribute("dbuser");
        if (user!=null) {
        	session.removeAttribute("dbuser");
		}
        return "redirect:/web/index";
    }
	
	/**
	 * 用户信息页面
	 */
	@RequestMapping(value = "/web/userinfo")
    public ModelAndView UserInfo() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("views/personal/info");
		return mav;
    }
	
	/**
	 * 修改用户信息
	 */
	@RequestMapping(value = "/web/updateuserinfo")
    public ModelAndView UpdateUserInfo(User user,HttpServletRequest reques) {
		ModelAndView mav = new ModelAndView();
		User User = userService.getUserById(user.getId());
		System.out.println("-----------"+User);
		if (User!=null) {
			userService.updateUser(user);
			User dbuser = userService.getUserById(user.getId());
			reques.getSession().setAttribute("dbuser", dbuser);
			mav.setViewName("views/personal/info");
		}
		return mav;
    }
	
	/**
	 * 用户头像页面
	 */
	@RequestMapping(value = "/web/useravatar")
    public ModelAndView UserAvatar() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("views/personal/avatar");
		return mav;
    }
	
	/**
	 * 修改头像
	 */
	@RequestMapping(value = "web/updateuseravatar")
    public ModelAndView updateUserAvatar(User user,HttpServletRequest request,
   			@RequestParam(value = "myphoto", required = false) MultipartFile uploadFile) {
		ModelAndView mav = new ModelAndView();
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
		} catch (Exception e) {
	         e.printStackTrace();
		}
		mav.setViewName("forward:/web/useravatar");
		return mav;
    }
	
	
	/**
	 * 用户修改密码页面
	 */
	@RequestMapping(value = "/web/updatepwd")
    public ModelAndView Updatepwd() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("views/personal/updatepwd");
		return mav;
    }
	
	@RequestMapping(value = "/web/updatepwd2",method = RequestMethod.POST)
    public ModelAndView Updatepwd2(User user,@RequestParam String pwd,@RequestParam String pwd2,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		User dbuser = userService.findUserByName(user.getUsername());
		if (dbuser!=null) {
			if (dbuser.getPassword().equals(user.getPassword())) {
				if (pwd.equals(pwd2)) {
					user.setPassword(pwd);
					userService.updatePwd(user);
					request.getSession().removeAttribute("dbuser");
					mav.setViewName("views/login");
				}else {
					request.getSession().setAttribute("msg1", "新密码与确认密码不一样");
					// 放入jsp路径
					mav.setViewName("views/personal/updatepwd");
				}
			}else{
				request.getSession().setAttribute("msg2", "旧密码错误");
				// 放入jsp路径
				mav.setViewName("views/personal/updatepwd");
			}
		}
		return mav;
    }

	
	/**
	 * 访问前台注册页面
	 * @return
	 */
	@RequestMapping("web/register")
	public ModelAndView toRegister()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("views/register");
		return mv;
	}
	
	/**
	 * 用户注册
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "register",method = RequestMethod.POST)
	public ModelAndView toRegister(HttpServletRequest request,User user,
			@RequestParam(value = "myphoto", required = false) MultipartFile uploadFile) throws Exception{
		ModelAndView mav = new ModelAndView();
		try {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");
			String time = sdf.format(new Date());
			user.setBirthday(time);
			
			User user2 = userService.findUserByName(user.getUsername());
			if (user2!=null) {
				request.getSession().setAttribute("msg", "用户名已存在");
				mav.setViewName("views/register");
			}else{
				if (uploadFile != null) {
					String fileName = uploadFile.getOriginalFilename();
					String suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
					if (StringUtils.isNotBlank(fileName) && FileUtil.checkPic(suffix)) {
						List<String> strList = FileUtil.saveFile(uploadFile, request, SERVER_URL);
						user.setPhoto(strList.get(0));
					}
				}
				userService.register(user);
				mav.setViewName("views/index");
			}
		} catch (Exception e) {
			e.printStackTrace();	
		}
		return mav;
	}
	
	/**
	 * 访问个人中心
	 * @return
	 */
	@RequestMapping("web/personal")
	public ModelAndView toPersonal(HttpServletRequest request,@RequestParam int id )throws Exception{
		ModelAndView mav = new ModelAndView();
		
		//用户信息
		User user = userService.getUserById(id);
		request.getSession().setAttribute("user", user);
		
		//个人游记
		List<Notes> notes = notesService.getNotesByUId(id);
		mav.addObject("notes", notes);
		Long notestotal = notesService.getNotesTotalByUId(id);
		mav.addObject("notestotal", notestotal);
		
		//个人景点点评
		List<ViewComment> viewComments = viewCommentService.getViewCommentByUId(id);
		mav.addObject("viewComments", viewComments);
		Long vcommenttotal = viewCommentService.getViewCommentTotalByUId(id);
		mav.addObject("vcommenttotal", vcommenttotal);
		
		//个人酒店点评
		List<HotelComment> hotelComments = hotelCommentService.getHotelCommentByUId(id);
		mav.addObject("hotelComments", hotelComments);
		Long hcommenttotal = hotelCommentService.getHotelCommentTotalByUId(id);
		mav.addObject("hcommenttotal", hcommenttotal);
		
		//个人美食点评
		List<FoodComment> foodComments = foodCommentService.getFoodCommentByUId(id);
		mav.addObject("foodComments", foodComments);
		Long fcommenttotal = foodCommentService.getFoodCommentTotalByUId(id);
		mav.addObject("fcommenttotal", fcommenttotal);
		
		
		mav.setViewName("views/personal/personal");
		return mav;
	}
	
	/**
	 * 访问我的游记
	 * @return
	 */
	@RequestMapping("web/mynotes")
	public ModelAndView toMyNotes(HttpServletRequest request,@RequestParam int id,@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage )throws Exception{
		ModelAndView mav = new ModelAndView();
		request.getSession().setAttribute("uid", id);
		//个人游记
		List<Notes> notes = notesService.getNotesByUId(id);
		mav.addObject("notes", notes);
		Long notestotal = notesService.getNotesTotalByUId(id);
		mav.addObject("notestotal", notestotal);
		List<Notes> noteslist = notesService.getNotes2ByUId(id,currentPage);
		PageInfo<Notes> page = new PageInfo<Notes>(noteslist);
		mav.addObject("page", page);
		mav.addObject("noteslist", noteslist);
		int all = 0;
		int readnum = 0;
		for(Notes notes2 : notes){
			readnum = notes2.getNreadnum();
			all+=readnum;
		}
		mav.addObject("all", all);
		
		mav.setViewName("views/personal/mynotes");
		return mav;
	}
	
	/**
	 * 访问我的游记
	 * @return
	 */
	@RequestMapping("web/mynotes_detail")
	public ModelAndView toMyNotes_detail(HttpServletRequest request,@RequestParam int id,@RequestParam int uid,@RequestParam(value = "currentPage",required=false,defaultValue="1")Integer currentPage )throws Exception{
		ModelAndView mav = new ModelAndView();
		
		//个人游记
		List<Notes> notes = notesService.getNotesListById(id);
		mav.addObject("notes", notes);
		List<Notes> noteslist1 = notesService.getNotes2ByUId(uid,currentPage);
		mav.addObject("noteslist1", noteslist1);
		int all = 0;
		int readnum = 0;
		for(Notes notes2 : notes){
			readnum = notes2.getNreadnum();
			all+=readnum;
		}
		mav.addObject("all", all);
		
		mav.setViewName("views/personal/mynotes_detail");
		return mav;
	}
	
	/**
	 * 访问景点订单
	 * @return
	 */
	@RequestMapping("web/myvieworder")
	public ModelAndView toMyViewOrder(HttpServletRequest request,@RequestParam int id )throws Exception{
		ModelAndView mav = new ModelAndView();
		
		List<ViewOrder> viewOrders = viewOrderService.getViewOrderListByUID(id);
		for(ViewOrder order : viewOrders){
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
			float price = order.getTprice();
			order.setTprice((float)ordernum*price);
		}
		mav.addObject("viewOrders", viewOrders);
		
		mav.setViewName("views/personal/myvieworder");
		return mav;
	}
	
	/**
	 * 访问景点订单
	 * @return
	 */
	@RequestMapping("web/myvieworder_detail")
	public ModelAndView toMyViewOrder_detail(HttpServletRequest request,@RequestParam int id )throws Exception{
		ModelAndView mav = new ModelAndView();
		
		//订单详情
		List<ViewOrder> viewOrders = viewOrderService.getViewOrderListById(id);
		float price = 0;
		for(ViewOrder order : viewOrders){
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
			System.out.println(order);
		}
		mav.addObject("viewOrders", viewOrders);
		mav.addObject("price", price);
		
		mav.setViewName("views/personal/view_order_detail");
		return mav;
	}
	
	/**
	 * 访问酒店订单
	 * @return
	 */
	@RequestMapping("web/myhotelorder")
	public ModelAndView toMyHotelOrder(HttpServletRequest request,@RequestParam int id )throws Exception{
		ModelAndView mav = new ModelAndView();
		List<HotelOrder> hotelOrders = hotelOrderService.getHotelOrderListByUId(id);
		float price = 0;
		long daysBetween = 0;
		for (HotelOrder order : hotelOrders) {
			if (order.getStatus().equals("1")) {
				order.setStatus("已关闭");
			}
			if (order.getStatus().equals("2")) {
				order.setStatus("待支付");
			}
			if (order.getStatus().equals("3")) {
				order.setStatus("已完成");
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
		
		mav.addObject("hotelOrders", hotelOrders);
		
		mav.setViewName("views/personal/myhotelorder");
		return mav;
	}
	
	/**
	 * 访问酒店订单
	 * @return
	 */
	@RequestMapping("web/myhotelorder_detail")
	public ModelAndView toMyHotelOrder_detail(HttpServletRequest request,@RequestParam int id )throws Exception{
		ModelAndView mav = new ModelAndView();
		List<HotelOrder> hotelOrders = hotelOrderService.getHotelOrderListById(id);
		float price = 0;
		long daysBetween = 0;
		for (HotelOrder order : hotelOrders) {
			if (order.getStatus().equals("1")) {
				order.setStatus("已关闭");
			}
			if (order.getStatus().equals("2")) {
				order.setStatus("待支付");
			}
			if (order.getStatus().equals("3")) {
				order.setStatus("已完成");
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
		mav.addObject("hotelOrders", hotelOrders);
		
		mav.setViewName("views/personal/hotel_order_detail");
		return mav;
	}
	
	
	/**
	 * 访问景点点评
	 * @return
	 */
	@RequestMapping("web/myvcomment")
	public ModelAndView toMyvcomment(HttpServletRequest request,@RequestParam int id )throws Exception{
		ModelAndView mav = new ModelAndView();
		//个人景点点评
		List<ViewComment> viewComments = viewCommentService.getViewComment2ByUId(id);
		mav.addObject("viewComments", viewComments);
		Long vcommenttotal = viewCommentService.getViewCommentTotalByUId(id);
		mav.addObject("vcommenttotal", vcommenttotal);
		
		mav.setViewName("views/personal/vcomment");
		return mav;
	}
	
	/**
	 * 访问酒店点评
	 * @return
	 */
	@RequestMapping("web/myhcomment")
	public ModelAndView toMyhcomment(HttpServletRequest request,@RequestParam int id )throws Exception{
		ModelAndView mav = new ModelAndView();
		
		//个人酒店点评
		List<HotelComment> hotelComments = hotelCommentService.getHotelComment2ByUId(id);
		mav.addObject("hotelComments", hotelComments);
		Long hcommenttotal = hotelCommentService.getHotelCommentTotalByUId(id);
		mav.addObject("hcommenttotal", hcommenttotal);
		
		mav.setViewName("views/personal/hcomment");
		return mav;
	}
	
	/**
	 * 访问美食点评
	 * @return
	 */
	@RequestMapping("web/myfcomment")
	public ModelAndView toMyfcomment(HttpServletRequest request,@RequestParam int id )throws Exception{
		ModelAndView mav = new ModelAndView();
		
		//个人美食点评
		List<FoodComment> foodComments = foodCommentService.getFoodComment2ByUId(id);
		mav.addObject("foodComments", foodComments);
		Long fcommenttotal = foodCommentService.getFoodCommentTotalByUId(id);
		mav.addObject("fcommenttotal", fcommenttotal);
				
		mav.setViewName("views/personal/fcomment");
		return mav;
	}
	
	
	

}
