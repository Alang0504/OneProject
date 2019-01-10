<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看个人信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		.querytb{
			width: 300px;
			height: 200px;
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
		.querybt{
			border-radius:4px;
			font-size:20px;
			background-color:#F0FFFF;
		}
	</style>

  </head>
  
  <body>
  <form action="${pageContext.request.contextPath }/user/queryUserOfOrders.action" method="post">
	    <input type="hidden" name="id" value="${userCustom.id }" >
	    <table border="1" class="querytb">
	    	<tr>
	    		<td class="propertd">姓名:</td>
	    		<td class="valuetd">${userCustom.username }</td>
	    	</tr>
	    	<tr>
	    		<td class="propertd">出生日期:</td>
	    		<td class="valuetd"><fmt:formatDate value="${userCustom.birthday }" pattern="yyyy-MM-dd"/></td>
	    	</tr>
	    	<tr>
	    		<td class="propertd">性别:</td>
	    		<td class="valuetd">${userCustom.sex }</td>
	    	</tr>
	    	<tr>
	    		<td class="propertd">籍贯:</td>
	    		<td class="valuetd">${userCustom.address }</td>
	    	</tr>
	    	<tr>
	    		<td colspan="2" align="center" ><input class="querybt" type="submit" value="我的订单" /></td>
	    	</tr>
	    </table>
   </form>
  </body>
</html>
