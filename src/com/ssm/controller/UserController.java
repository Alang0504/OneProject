package com.ssm.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssm.pojo.ItemsVo;
import com.ssm.pojo.Orders;
import com.ssm.pojo.Page;
import com.ssm.pojo.UserCustom;
import com.ssm.service.ItemsService;
import com.ssm.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ItemsService itemsService;
	
	@RequestMapping("/leftPage")
	public String leftPage()throws Exception{
		return "left";
	}
	
	@RequestMapping("/rightPage")
	public String rightPage()throws Exception{
		return "right";
	}
	
	@RequestMapping("/mainPage")
	public String mainPage()throws Exception{
		return "usermain";
	}
	
//	查看个人信息
	@RequestMapping("/queryUser")
	public String queryUser(Model model,HttpSession session)throws Exception{
		String name = (String) session.getAttribute("username");
		UserCustom userCustom = userService.findUserName(name);
		model.addAttribute("userCustom", userCustom);
		return "queryUser";
	}
	
//	进入修改个人信息界面
	@RequestMapping("/updateUserPage")
	public String updateUserPage(Model model,HttpSession session)throws Exception{
		String name = (String) session.getAttribute("username");
		UserCustom userCustom = userService.findUserName(name);
		model.addAttribute("userCustom", userCustom);
		return "editUser";
	}
	
//	提交修改个人信息
	@RequestMapping("/editUser")
	public String editUser(UserCustom userCustom)throws Exception{
		userService.updateUser(userCustom);		
		return "redirect:queryUser.action";
	}
	
//	查看用户订单
	@RequestMapping("/queryUserOfOrders")
	public String queryUserOfOrders(Model model,Integer id) throws Exception{
		UserCustom userCustom = userService.findUserofOrder(id);
		List<Orders> listOrders = userCustom.getListOrders();
		model.addAttribute("listOrders", listOrders);
		return "userOfOrders";
		
	}
	
//	进入修改密码页面
	@RequestMapping("/editPasswordPage")
	public String editPasswordPage(Model model,HttpSession session)throws Exception{
		String name = (String) session.getAttribute("username");
		UserCustom userCustom = userService.findUserName(name);
		model.addAttribute("userCustom", userCustom);
		return "editPassword";
	}
	
//	提交修改密码
	@RequestMapping("/editPasswordSubimt")
	public String editPasswordSubimt(UserCustom userCustom) throws Exception{
		userService.updatePasswordByName(userCustom);
		return "redirect:editLoginOut.action";
	}
	
	
//	修改密码后退出登录
	@RequestMapping("/editLoginOut")
	public String loginOut(HttpSession session,Model model)throws Exception{
//		清空session
		session.invalidate();
		model.addAttribute("message", "身份验证过期,请重新登录!");		
		return "login";
	}

//	分页根据条件查询商品信息
	@RequestMapping("/pageItemsList")///pageItemsList
	public String pageItemsList(Model model,ItemsVo itemsVo,Page page,HttpSession session)throws Exception{	
//				List<ItemsCustom> itemsList= itemsService.findItemsByName(itemsVo);
//				model.addAttribute("itemsList", itemsList);
				page = itemsService.findItemsListPage(itemsVo, page);
				model.addAttribute("page", page);
				String name = (String) session.getAttribute("username");
				model.addAttribute("name", name);
				return "homePage";						
	}
	
	
//	自定义属性编辑器,只在该类中生效
	@InitBinder
	public void initBinder(WebDataBinder binder) throws Exception {
		// Date.class必须是与controler方法形参pojo属性一致的date类型，这里是java.util.Date
		binder.registerCustomEditor(Date.class, new CustomDateEditor(
				new SimpleDateFormat("yyyy-MM-dd"), true));
	}
}
