package com.ssm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.ssm.mapper.UserCustomMapper;
import com.ssm.mapper.UserMapper;
import com.ssm.pojo.UserCustom;
import com.ssm.service.UserService;

public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserCustomMapper userCustomMapper;
	@Autowired
	private UserMapper userMapper;
//	用户登录功能验证
	public UserCustom findUser(UserCustom userCustom) throws Exception {
		// TODO Auto-generated method stub		
		return userCustomMapper.findUser(userCustom);
	}
	
//	根据用户名查看个人信息
	public UserCustom findUserName(String name) throws Exception {
		// TODO Auto-generated method stub		
		return userCustomMapper.findUserName(name);
	}
//	修改用户信息
	public void updateUser(UserCustom userCustom) throws Exception {
		// TODO Auto-generated method stub
		userMapper.updateByPrimaryKey(userCustom);
	}
//	查看用户订单
	public UserCustom findUserofOrder(int id) throws Exception {
		// TODO Auto-generated method stub		
		return userCustomMapper.findUserofOrder(id);
	}
//	修改密码
	public void updatePasswordByName(UserCustom userCustom) throws Exception {		
		// TODO Auto-generated method stub
		userCustomMapper.updatePasswordByName(userCustom);
	}

}
