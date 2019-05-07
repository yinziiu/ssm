package com.hz.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hz.model.Role;

public interface RoleMapper {
	
	public List<Role> getRoleList();
	
	public Long getRoleListTotal();
	
	public void saveRole(@Param("role") Role role);
	
	public void updateRole(@Param("role") Role role);
	
	public void deleteRole(@Param("id")int id);
	
	public Role getRoleById(@Param("id")int id);

}
