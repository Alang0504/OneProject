package com.ssm.service;

import com.ssm.pojo.Admin;

public interface AdminService {
//	查看用户名密码是否正确
	public Admin findAdmin(Admin admin)throws Exception;
}
