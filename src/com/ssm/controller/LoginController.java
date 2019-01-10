package com.ssm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.pojo.Admin;
import com.ssm.pojo.UserCustom;
import com.ssm.service.AdminService;
import com.ssm.service.ItemsService;
import com.ssm.service.UserService;

@Controller
public class LoginController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private UserService userService;
	@RequestMapping("/loginAdmin")
	public String loginAdmin(UserCustom userCustom,Admin admin,Model model,HttpSession session,String identity)throws Exception{
		Admin admin1 = null;
		UserCustom user = null;
		if(identity.equals("普通会员")){
			user = userService.findUser(userCustom);
		}
		if(identity.equals("管理员")){
			admin1 = adminService.findAdmin(admin);
		}
//		Admin admin1 = adminService.findAdmin(admin);
		if(admin1!=null){
			String adminname=admin1.getUsername();
//			将admin1存入对象
			session.setAttribute("adminname", admin1);
//			将用户名存入session
			session.setAttribute("admin", adminname);
			return "redirect:items/queryItemsList.action";
		}
		if(user!=null){
			String username=user.getUsername();
			session.setAttribute("user", user);
			session.setAttribute("username", username);
			return "redirect:user/mainPage.action";
		}
		model.addAttribute("message", "用户名或密码错误,请重新登录!");
		return "login";
	}
	
	@RequestMapping("/loginPage")
	public String loginAdmin(){
		return "login";
	}
	
//	退出登录
	@RequestMapping("/loginOut")
	public String loginOut(HttpSession session)throws Exception{
//		清空session
		session.invalidate();
		return "login";
	}

}
