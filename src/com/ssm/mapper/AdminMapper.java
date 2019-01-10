package com.ssm.mapper;

import com.ssm.pojo.Admin;

public interface AdminMapper {
//	查看用户名密码是否正确
	public Admin findAdmin(Admin admin)throws Exception;
}
