package com.ssm.service;

import com.ssm.pojo.UserCustom;

public interface UserService {
//	用户登录功能验证
	public UserCustom findUser(UserCustom userCustom)throws Exception;
//	根据用户名查看个人信息
	public UserCustom findUserName(String name)throws Exception;
//	修改用户信息
	public void updateUser(UserCustom userCustom)throws Exception;
//	查看用户订单
	public UserCustom findUserofOrder(int id)throws Exception;
//	修改密码
	public void updatePasswordByName(UserCustom userCustom)throws Exception;
}
