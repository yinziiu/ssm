package com.hz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hz.dao.RoleMapper;
import com.hz.model.Role;
import com.hz.service.IRoleService;

@Service
public class RoleService implements IRoleService {
	
	@Autowired
	private RoleMapper roleMapper;

	@Override
	public List<Role> getRoleList() {
		return roleMapper.getRoleList();
	}

	@Override
	public Long getRoleListTotal() {
		return roleMapper.getRoleListTotal();
	}

	@Override
	public void saveRole(Role role) {
		roleMapper.saveRole(role);
	}

	@Override
	public void updateRole(Role role) {
		roleMapper.updateRole(role);
	}

	@Override
	public void deleteRole(int id) {
		roleMapper.deleteRole(id);
	}

	@Override
	public Role getRoleById(int id) {
		return roleMapper.getRoleById(id);
	}

}
