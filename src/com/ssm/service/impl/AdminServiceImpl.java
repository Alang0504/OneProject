package com.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssm.mapper.AdminMapper;
import com.ssm.pojo.Admin;
import com.ssm.service.AdminService;

public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper adminMapeer;
//	查看用户名密码是否真确
	public Admin findAdmin(Admin admin) throws Exception {
		// TODO Auto-generated method stub
		return adminMapeer.findAdmin(admin);
	}

}
