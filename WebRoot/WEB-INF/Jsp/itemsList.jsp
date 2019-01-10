<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询商品列表</title>

<style type="text/css">
	.itemsbt{
		border-radius:4px;
		width:100px;
		height:30px;
		font-size:20px;
		background-color:#9932CC;
		color: white;
	}
	.tbone{
		border-radius:4px;
		width:100px;
		height:30px;
		font-size:20px;
		background-color:#9932CC;
		color: white;
	}
	.itemstb{
		text-align: center;
	}
</style>

<script type="text/javascript">
	function deleteItemsButton(){
		//将form的action指向删除商品的地址
			document.itemsForm.action="${pageContext.request.contextPath }/items/deleteItemsList.action";
			//进行form提交
			document.itemsForm.submit();
	}
	function editItemsButton(){
			document.itemsForm.action="${pageContext.request.contextPath }/items/editItemsListquery.action";
			document.itemsForm.submit();
	}
	function addItemsButton(){
		document.itemsForm.action="${pageContext.request.contextPath }/items/insertPage.action";
		document.itemsForm.submit();
	}	
	function loginOutButton(){
		document.itemsForm.action="${pageContext.request.contextPath }/loginOut.action";
		document.itemsForm.submit();
	}	
</script>
</head>
<body> 
<form name="itemsForm" action="${pageContext.request.contextPath }/items/queryItemsList.action" method="post">
<table width="100%" border=1>
<tr>
<td>
商品名称：<input type="text" name="itemsCustom.queryName" />
</td>
<td>
商品价格范围：<input type="text" name="itemsCustom.queryMin" />至<input type="text" name="itemsCustom.queryMax" />
</td>
<td><input class="itemsbt" type="submit" value="查询"/></td>
<td><input class="itemsbt" type="button" value="添加商品" onclick="addItemsButton()" /></td>
<td><input class="itemsbt" type="button" value="批量删除" onclick="deleteItemsButton()" /></td>
<td><input class="itemsbt" type="button" value="批量修改" onclick="editItemsButton()" /></td>
<td>欢迎${adminname},退出登录请点击<input class="itemsbt" type="button" value="退出" onclick="loginOutButton()" /></td>
</tr>
</table>
<table width="100%" border=1 class="itemstb">
<tr class="tbone">
	<td>选择</td>
	<td>商品名称</td>
	<td>商品价格</td>
	<td>生产日期</td>
	<td>商品图片</td>
	<td>商品描述</td>
	<td>操作</td>
</tr>
<c:forEach items="${itemsList}" var="item">
<tr>
	<td><input type="checkbox" name="delete_id" value="${item.id }" /></td>
	<td>${item.name }</td>
	<td>${item.price }</td>
	<td><fmt:formatDate value="${item.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
 	<td><img src="${pageContext.request.contextPath }/images/${item.pic}" width=100 height=100/></td>
	<td>${item.detail }</td>
	
	<td>
		<a href="${pageContext.request.contextPath }/items/queryeditItems.action?id=${item.id}">修改</a>
		<a href="${pageContext.request.contextPath }/items/deleteItemsById.action?id=${item.id}">删除</a>
	</td>
</tr>
</c:forEach>

</table>
</form>
</body>

</html>