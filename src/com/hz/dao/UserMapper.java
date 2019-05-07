package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.User;

public interface UserMapper {
	
	public List<User> findUserList();
	
	//根据用户名查找用户
	public User findUserByName(@Param("username") String username);
	
	public Long getUserListTotal();
	
	public List<User> getAdminUserList();

	public Long getAdminUserListTotal();
	
	public Long checkUser(@Param("username") String username);
	
	public void register(@Param("user") User user);
	
	public void addAdmin(@Param("user") User user);
	
	public User getUserById(@Param("id")int id);
	
	public User getUserById2(@Param("id")int id);
	
	public void updatePwd(@Param("user")User user);
	
	public void updateUser(@Param("user")User user);
	
	public void updateUser2(@Param("user")User user);
	
	public void updateAdmin(@Param("user")User user);
	
	public void updatephoto(@Param("user")User user);
	
	public User findUserByName2(@Param("username") String username);
	
	public void deleteUser(@Param("id")int id);
	
	public List<User> getUserByRId(@Param("id")int id);
	
	
}
