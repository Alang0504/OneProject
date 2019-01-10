<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>修改密码页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<style type="text/css">
		.eidtpasswordtb{
			width: 300px;
			height: 200px;
			font-size: 20px;
		}
		.propertd{
			border-radius:4px;
			font-size:20px;
			background-color:#6495ED;
			color: white;
		}
		.valuetd{
			border-radius:4px;
			font-size:20px;
			background-color:#F0FFFF;
		}
		.editlabel{
			width: 150px;
			font-size: 20px;
		}
		.editbt{
			border-radius:4px;
			font-size:20px;
			background-color:#F0FFFF;
		}
		.buttonbt{
			text-align: center;
		}
	</style>

	<script type="text/javascript">
		function check(){
			var password = document.all("password").value;
			var passwordConfirm = document.all("passwordConfirm").value;
			if(password!=passwordConfirm){
				alert("新密码和确认密码不一致,请重新输入!");
				return false;
			}
			return true;
		}
		
		function retrunmain(){
			window.location.href="${pageContext.request.contextPath }/user/mainPage.action";
		}
		
	</script>

  </head>
  
  <body>
    <form action="${pageContext.request.contextPath }/user/editPasswordSubimt.action" method="post" onsubmit="return check()">
    	<table border="1" class="eidtpasswordtb">
    		<tr>
    			<td class="propertd">用户名:</td><td class="valuetd"><input class="editlabel" type="text" name="username" value="${userCustom.username }" readonly="readonly" /></td>
    		</tr>
    		<tr>
    			<td class="propertd">新密码:</td><td class="valuetd"><input class="editlabel" type="password" name="password" /></td>
    		</tr>
    		<tr>
    			<td class="propertd">确认密码:</td><td class="valuetd"><input class="editlabel" type="password" name="passwordConfirm" /></td>
    		</tr>
    		<tr>
    			<td class="buttonbt"><input class="editbt" type="submit" value="提交" /></td>
    			<td class="buttonbt"><input class="editbt" type="button" value="返回主界面" onclick="retrunmain()" /></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
