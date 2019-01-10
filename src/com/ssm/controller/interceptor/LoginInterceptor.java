package com.ssm.controller.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.ssm.pojo.Admin;
import com.ssm.pojo.UserCustom;

public class LoginInterceptor implements HandlerInterceptor{
	
//	执行handler之前执行;用于用户认证校验、用户权限校验
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {
		// TODO Auto-generated method stub
//		得到请求的Url
		String url = request.getRequestURI();
		
//		判断是否是公开地址,对于公开地址不进行拦截
		if((url.indexOf("loginAdmin.action")>=0) || (url.indexOf("loginPage.action")>=0)){
			return true;
		}
		HttpSession session = request.getSession();
		Admin admin = (Admin) session.getAttribute("adminname");
		UserCustom user = (UserCustom) session.getAttribute("user");
		if(admin!=null){
			return true;
		}
		if(user!=null){
			return true;
		}
		request.setAttribute("message", "您还没有登录，请先登录!");
		request.getRequestDispatcher("/WEB-INF/Jsp/login.jsp").forward(request, response);
		return false;
	}
	
//	在执行handler返回modandview之前执行
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler, ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

//	在执行handler之后
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}



}
