package com.hz.service;

import java.util.List;

import com.hz.model.User;

public interface IUserService {
	
	public List<User> findUserList();
	
	public User findUserByName(String username);
	
	public Long getUserListTotal();
	
	public List<User> getAdminUserList();

	public Long getAdminUserListTotal();
	
	public Long checkUser(String username);
	
	public void register(User user);
	
	public void addAdmin(User user);
	
	public User getUserById(int id);
	
	public User getUserById2(int id);
	
	public void updatePwd(User user);
	
	public void updateUser(User user);
	
	public void updateUser2(User user);
	
	public void updateAdmin(User user);
	
	public void updatephoto(User user);
	
	public User findUserByName2(String username);
	
	public void deleteUser(int id);
	
	public List<User> getUserByRId(int id);

}
