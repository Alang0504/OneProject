<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>插入商品信息页面</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		.insertdiv{
			border: 1px solid gray;
			height: 500px;
			width: 500px;
			margin-left: 680px;
			margin-top: 150px;
		}
		.itemstb{
			margin-left: 80px;
			margin-top: 30px;
			font-size: 20px;
		}
		.insertlabel{
			width: 200px;
			height: 30px;
			font-size: 20px;
		}
		.biglabel{
			width: 200px;
			height: 80px;
			font-size: 20px;
		}
		.submbt{
			border-radius:4px;
			width:100px;
			height:30px;
			font-size:20px;
			background-color:#9932CC;
			color: white;
			margin-left: 200px;
			margin-top: 20px;
		}
		.errors{
			color: red;
			text-align: center;
		}
	</style>
  </head>
  
  <body>
    <form action="${pageContext.request.contextPath }/items/insertItems.action" method="post">
   	 	<div class="insertdiv">
   	 	<p class="errors">
	   	 	<c:forEach items="${errors }" var="error">
	  		${error.defaultMessage }<br/>
	 		</c:forEach>
 		</p>
    	<table class="itemstb" >
    		<tr>
    			<td>商品名称：</td>
    			<td><input class="insertlabel" type="text" name="name" value="${itemsCustom.name }" placeholder="请输入商品名称" /></td>
    		</tr>
    		<tr>
    			<td>商品价格：</td>
    			<td><input class="insertlabel" type="text"  name="price" value="${itemsCustom.price }"  placeholder="请输入商品价格" /></td>
    		</tr>
    		<tr>
    			<td>商品描述：</td>
    			<td><textarea class="biglabel" name="detail" rows="5" cols="25"  value="${itemsCustom.detail }" placeholder="请输入商品描述"  ></textarea></td>
<%--     			<td><input class="insertlabel" type="text" name="detail" value="${itemsCustom.detail }" placeholder="请输入商品描述" /></td> --%>
    		</tr>
    		<tr>
    			<td>商品生产日期：</td>
    			<td><input type="datetime" name="createtime" value="${itemsCustom.createtime }" class="insertlabel" placeholder="请输入商品生产日期"  /></td>
<%--     			<td><input class="insertlabel" type="text" name="createtime" value="${itemsCustom.createtime }" placeholder="请输入商品生产日期" /></td> --%>
    		</tr>
    	</table>
    			<input class="submbt" type="submit" value="提交" />
    	</div>
    </form>
  </body>
</html>
