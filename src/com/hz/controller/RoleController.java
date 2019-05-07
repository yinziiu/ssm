package com.hz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.hz.model.Role;
import com.hz.model.User;
import com.hz.model.layer.Json;
import com.hz.service.IRoleService;
import com.hz.service.IUserService;

@Controller
public class RoleController {
	
	@Autowired
	private IRoleService roleService;
	@Autowired
	private IUserService userService;
	
	/**
	 * 角色列表
	 * @return
	 */
	@RequestMapping("getRoleList")
	public ModelAndView listUser() {
		ModelAndView mav = new ModelAndView();
		List<Role> rolesList = roleService.getRoleList();
		Long totalList = roleService.getRoleListTotal();
		// 放入转发参数
		mav.addObject("rolesList", rolesList);
		mav.addObject("totalList", totalList);
		// 放入jsp路径
		mav.setViewName("admin/admin_/role-list");
		return mav;
	}
	
	/**
	 * 跳转到添加角色页面
    */
   @RequestMapping("role_add")
   public ModelAndView addrole(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_/role-add");
		return mav;
   }
	   
   /**
    * 添加角色
    */
   @ResponseBody
   @RequestMapping(value = "savarole",method = RequestMethod.POST)
   public Json saverole(Role role,HttpServletRequest request){
	   Json json = new Json();
	   System.out.println(role.getName());
		try {
			roleService.saveRole(role);
			json.setObj(role);
			json.setSuccess(true);
			json.setMsg("添加成功");
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 跳转编辑角色页面
    */
   @ResponseBody
   @RequestMapping(value = "updaterole")
   public ModelAndView updaterole(int id,HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		Role role = roleService.getRoleById(id);
		request.getSession().setAttribute("role", role);
		mav.setViewName("admin/admin_/role-update");
		return mav;
   }
   
   /**
    * 编辑酒店类型
    */
   @ResponseBody
   @RequestMapping(value = "update_role",method = RequestMethod.POST)
   public Json update_role(Role role,HttpServletRequest request){
	   Json json = new Json();
	   System.out.println(role.getName());
	   System.out.println(role.getId());
		try {
			roleService.updateRole(role);
			json.setObj(role);
			json.setSuccess(true);
			json.setMsg("编辑成功");
		} catch (Exception e) {
			json.setMsg("操作失败！");
			e.printStackTrace();
		}
		return json;
	}
   
   /**
    * 删除角色
    */
   @ResponseBody
   @RequestMapping(value = "deleteRole",method = RequestMethod.POST)
   public Json deleterole(int id,HttpServletRequest request){
	   Json j = new Json();
	   System.out.println(id);
		try {
			List<User> users = userService.getUserByRId(id);
			System.out.println(users.size());
			if (users.size()>0) {
				System.out.println("操作失败");
				j.setMsg("存在用户,操作失败！");
			}else{
				roleService.deleteRole(id);
				System.out.println("删除成功");
				j.setSuccess(true);
				j.setMsg("删除成功！");
			}
		} catch (Exception e) {
			j.setMsg("操作失败！");
			e.printStackTrace();
		}
		return j;
   }

}
