package com.hz.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hz.dao.UserMapper;
import com.hz.model.User;
import com.hz.service.IUserService;

@Service
public class UserService implements IUserService{
	
	@Autowired
	UserMapper userMapper;

	@Override
	public List<User> findUserList() {
		return userMapper.findUserList();
	}
	
	@Override
	public User findUserByName(String username) {
		return userMapper.findUserByName(username);
	}

	@Override
	public Long getUserListTotal() {
		return userMapper.getUserListTotal();
	}

	@Override
	public List<User> getAdminUserList() {
		return userMapper.getAdminUserList();
	}

	@Override
	public Long getAdminUserListTotal() {
		return userMapper.getAdminUserListTotal();
	}

	
	@Override
	public void register(User user) {
		//封装属性生日
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");
		String time = sdf.format(new Date());
		user.setBirthday(time);
		userMapper.register(user);
	}

	@Override
	public Long checkUser(String username) {
		return userMapper.checkUser(username);
	}

	@Override
	public User getUserById(int id) {
		return userMapper.getUserById(id);
	}

	@Override
	public void updatePwd(User user) {
		 userMapper.updatePwd(user);
	}

	@Override
	public void updateUser(User user) {
		userMapper.updateUser(user);
	}
	
	@Override
	public void updateUser2(User user) {
		userMapper.updateUser2(user);
	}
	
	@Override
	public User findUserByName2(String username) {
		return userMapper.findUserByName2(username);
	}

	@Override
	public void deleteUser(int id) {
		userMapper.deleteUser(id);
	}

	@Override
	public List<User> getUserByRId(int id) {
		return userMapper.getUserByRId(id);
	}

	@Override
	public void addAdmin(User user) {
		userMapper.addAdmin(user);
	}
	
	@Override
	public User getUserById2(int id) {
		return userMapper.getUserById2(id);
	}
	
	@Override
	public void updateAdmin(User user) {
		userMapper.updateAdmin(user);
	}
	
	@Override
	public void updatephoto(User user) {
		userMapper.updatephoto(user);
	}
	

}
