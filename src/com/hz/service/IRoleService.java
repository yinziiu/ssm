package com.hz.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.Role;

public interface IRoleService {
	
	public List<Role> getRoleList();
	
	public Long getRoleListTotal();
	
	public void saveRole(Role role);
	
	public void updateRole(Role role);
	
	public void deleteRole(int id);
	
	public Role getRoleById(int id);

}
