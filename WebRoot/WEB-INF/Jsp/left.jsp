<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>左页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		.maintd{
			border-radius:4px;
			width:200px;
			height:50px;
			background-color:#6495ED;
			color: white;
		}
		.mainhref{
			font-size: 20px;
			color: white;
			text-align: center;
		}
	</style>
	
  </head>
  
  <body>
	<form action="" name="userForm">
		<table>
			<tr>
				<td class="maintd"><a class="mainhref" target="right" href="${pageContext.request.contextPath }/user/pageItemsList.action">首页</a></td>
			</tr>
			<tr>
				<td class="maintd"><a class="mainhref" target="right" href="${pageContext.request.contextPath }/user/queryUser.action" >查看个人信息</a></td>
			</tr>
			<tr>
				<td class="maintd"><a class="mainhref" target="right" href="${pageContext.request.contextPath }/user/updateUserPage.action" >修改个人信息</a></td>
			</tr>
    		<tr>
    			<td class="maintd"><a class="mainhref" target="_top" href="${pageContext.request.contextPath }/user/editPasswordPage.action" >修改密码</a></td>
    		</tr>			
			<tr>
    			<td class="maintd"><a class="mainhref" target="_top" href="${pageContext.request.contextPath }/loginOut.action" >退出登录</a></td>
    		</tr>
		</table>
	</form>
  </body>
</html>
