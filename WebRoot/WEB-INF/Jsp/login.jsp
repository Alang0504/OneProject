<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<style type="text/css">
	
		.loginDiv{
			border: 1px solid gray;
			height: 300px;
			width: 500px;
			margin-left: 680px;
			margin-top: 150px;
		}
		.tb{
			margin-left: 100px;
			font-size: 25px;
		}
		.message{
			text-align: center;
			font-size: 20px;
			color: red;
		}
		.loginquery{
			width: 150px;
			height: 30px;
			font-size: 20px;
			margin-bottom: 20px;
		}
		.textLabel{
 			width: 200px;
			height: 30px;
		}
		.loginbt{
 			border-radius:4px;
			width:300px;
			height:50px;
			font-size:20px;
			margin-top:20px;
			background-color:#ffb700;
			color: white;
		}
	</style>

	<script type="text/javascript">
		function check(){
			var name = document.all("adminname").value;
			var pw = document.all("password").value;
			if(name==""){
				alert("用户名不能为空!");
				return false;
			}
			if(pw==""){
				alert("密码不能为空!");
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body>
    <form action="${pageContext.request.contextPath }/loginAdmin.action" method="post" onsubmit="return check()">
    	<div class="loginDiv">
    		<p class="message">${message}</p>
	   	 	<table class="tb">
	   	 		<tr>
	   	 			<td colspan="2" align="center" >
	   	 				<select class="loginquery" name="identity" >
	   	 					<option>普通会员</option>
	   	 					<option>管理员</option>
	   	 				</select>
	   	 			</td>
	   	 		</tr>	   	 	
	    		<tr>
	    			<td>用户名：</td><td><input class="textLabel" name="username" type="text" placeholder="请输入用户名" /></td>
	    		</tr>
	    		<tr>
	    			<td>密码：</td><td><input class="textLabel" name="password" type="password" placeholder="请输入密码" /></td>
	    		</tr>
	    		<tr><td colspan="2" align="center" ><input class="loginbt" type="submit" value="登录" /></td></tr>
	    	</table>
    	</div>
    </form>
  </body>
</html>
