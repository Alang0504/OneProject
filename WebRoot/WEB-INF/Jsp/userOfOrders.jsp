<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户订单页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		.ordertb{
			width: 100%;
		}
		.headtr{
			border-radius:4px;
			font-size:20px;
			background-color:#6495ED;
			color: white;
		}
	</style>

  </head>
  
  <body>
  	
	<table border="1" class="ordertb">
		<tr class="headtr" >
			<td>订单Id</td>
	    	<td>订单号</td>
	    	<td>订单创建时间</td>
		</tr>
	    <c:forEach items="${listOrders}" var="orders">
	    	<tr>
	    		<td>${orders.id }</td>
	    		<td>${orders.number }</td>
	    		<td><fmt:formatDate value="${orders.createtime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	    	</tr>
	    </c:forEach>
	</table>

  </body>
</html>
