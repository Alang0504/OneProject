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
<script src="<%=basePath%>js/homePage.js"></script>
<title>首页</title>

<style type="text/css">
	.hometb{
		width: 100%;
	}
	.pagetb{
 		margin-left:30%;
		width: 40%; 
		font-size: 20px;
	}
	.headtr{
		border-radius:4px;
		height:30px;
		font-size:20px;
		background-color:#6495ED;
		color: white;
	}
	.pagebt{
		border-radius:4px;
		width:80px;
		height:30px;
		font-size:20px;
		background-color:#6495ED;
		color: white;
	}
	.mainbt{
		border-radius:4px;
		width:100px;
		height:30px;
		font-size:20px;
		background-color:#6495ED;
		color: white;
	}
</style>

</head>
<body>
	<form action="<%=basePath%>items/queryeditItems.action?id=${customer.id}" method="post">
		您好,${name },欢迎光临XX自营店
		<table border="1" class="hometb">
			<tr class="headtr" >
				<td>选择</td>
				<td>商品名称</td>
				<td>商品价格</td>
				<td>生产日期</td>
				<td>商品图片</td>
				<td>商品描述</td>
				<td>操作</td>
			</tr>		
			<c:forEach items="${page.items}" var="customer">
				<tr>
					<td>${customer.id}</td>
					<td>${customer.name }</td>
					<td>${customer.price }</td>
					<td><fmt:formatDate value="${customer.createtime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					 <td><img src="<%=basePath%>images/${customer.pic}" width=100 height=100/></td>
					<td>${customer.detail }</td>
					<td>
						<%-- <a class="pagehref" href="<%=basePath%>items/queryeditItems.action?id=${customer.id}">购买商品</a>	 --%>	
						<input class="mainbt" type="submit" value="购买商品" />		
					</td>				
				</tr>
			</c:forEach>
		</table>

		 <table border="0" class="pagetb" >
			  <tr>
			  	<td><input class="pagebt" type="button" onclick="firstPage('<%=basePath%>')" value="首页"></td>
			  	<td><input class="pagebt" type="button" onclick="prePage('<%=basePath%>')" value="上一页"></td>
			  	<td><input class="pagebt" type="button"  onclick="nextPage('<%=basePath%>',${page.totalPage})" value="下一页"></td>
			  	<td>当前页<input style="width:30px" name="pageNum" value="${page.pageNum}"  readonly="readonly"/>/${page.totalPage}</td>
			  	<td><input class="pagebt" type="button" onclick="lastPage('<%=basePath%>',${page.totalPage})" value="尾页"></td>
			  	<td><input class="pagebt" type="button" onclick="transferPage('<%=basePath%>',${page.totalPage})" value="转到"></td>
			  	<td><input name="transferNum" style="width:30px"/></td>
			  	<td>页</td>
			  </tr>
		  </table>
	</form>  		
</body>
</html>
