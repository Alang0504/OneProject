<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script src="<%=basePath%>js/customerListAll.js"></script>
<title>分页查询所有商品信息</title>
<script type="text/javascript">
	function deleteItemsButton(){
		//将form的action指向删除商品的地址
		document.itemsForm.action="<%=basePath%>items/deleteItemsList.action";
		//进行form提交
		document.itemsForm.submit();
	}
	function editItemsButton(){
		document.itemsForm.action="<%=basePath%>items/editItemsListquery.action";
		document.itemsForm.submit();
	}
</script>
</head>
<body>
	<form action="<%=basePath%>items/queryCountItems.action" method="post">
		查询条件：
		<table width="100%" border=1>
		<tr>
		<td>
		商品类别：<input type="text" name="itemsCustom.queryName" />
		</td>
		<td>
		商品价格范围：<input type="text" name="itemsCustom.queryMin" />至<input type="text" name="itemsCustom.queryMax" />
		</td>
		<td><input type="submit" value="查询"/></td>
		<td><a href="<%=basePath%>items/insertPage.action">添加</a></td>
		<td><input type="button" value="批量删除" onclick="deleteItemsButton()" /></td>
		<td><input type="button" value="批量修改" onclick="editItemsButton()" /></td>
		</tr>
		</table>
		商品列表：
		<table border="1">
			<tr>
				<td>选择</td>
				<td>商品名称</td>
				<td>商品价格</td>
				<td>生产日期</td>
				<td>商品图片</td>
				<td>商品描述</td>
				<td>操作1</td>
				<td>操作2</td>
			</tr>		
			<c:forEach items="${page.items}" var="customer">
				<tr>
					<td>${customer.id}</td>
					<td>${customer.name }</td>
					<td>${customer.price }</td>
					<td><fmt:formatDate value="${customer.createtime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					 <td><img src="<%=basePath%>images/${customer.pic}" width=100 height=100/></td>
					<td>${customer.detail }</td>
					<td><a href="<%=basePath%>items/queryeditItems.action?id=${customer.id}">修改</a></td>
					<td><a href="<%=basePath%>items/deleteItemsById.action?id=${customer.id}">删除</a></td>					
				</tr>
			</c:forEach>
		</table>

		 <table border="0" >
			  <tr>
			  	<td><input type="button" onclick="firstPage('<%=basePath%>')" value="首页"></td>
			  	<td><input type="button" onclick="prePage('<%=basePath%>')" value="上一页"></td>
			  	<td><input type="button"  onclick="nextPage('<%=basePath%>',${page.totalPage})" value="下一页"></td>
			  	<td>当前页<input style="width:30px" name="pageNum" value="${page.pageNum}"  readonly="readonly"/>/${page.totalPage}</td>
			  	<td><input type="button" onclick="lastPage('<%=basePath%>',${page.totalPage})" value="尾页"></td>
			  	<td><input type="button" onclick="transferPage('<%=basePath%>',${page.totalPage})" value="转到"></td>
			  	<td><input name="transferNum" style="width:30px"/></td>
			  	<td>页</td>
			  </tr>
		  </table>  		
	</form>


</body>
</html>