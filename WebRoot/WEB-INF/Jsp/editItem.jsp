<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改商品信息</title>
	<style type="text/css">
		.updatetb{
			width: 600px;
			height: 300px;
			margin-left: 600px;
			margin-top: 100px;
			font-size: 20px;
		}
		.updatelabel{
			width: 200px;
			height: 25px;
			font-size: 20px;
		}
		.bigtext{
			width: 200px;
			height: 120px;
			font-size: 20px;
		}
		.updatebt{
			border-radius:4px;
			width:200px;
			height:50px;
			font-size:20px;
			background-color:#ffb700;
			color: white;
		}
	</style>
	
	<script type="text/javascript">
		function check(){
			var name = document.all("name").value;
			var price = document.all("price").value;
			var createtime = document.all("createtime").value;
			if(name==""){
				alert("商品名称不能为空!");
				return false;
			}
			if(price==""){
				alert("商品价格不能为空!");
				return false;
			}
			if(createtime==""){
				alert("生产日期不能为空!");
				return false;
			}
			return true;
		}
	</script>
</head>
<body> 
<form id="itemForm" action="${pageContext.request.contextPath }/items/editItems.action" method="post" enctype="multipart/form-data" onsubmit="return check()">
<input type="hidden" name="id" value="${itemsCustom.id }"/>
<table width="100%" border=1 class="updatetb">
<tr>
	<td>商品名称</td>
	<td><input class="updatelabel" type="text" name="name" value="${itemsCustom.name }"/></td>
</tr>
<tr>
	<td>商品价格</td>
	<td><input class="updatelabel" type="text" name="price" value="${itemsCustom.price }"/></td>
</tr>
<tr>
	<td>商品生产日期</td>
	<td><input class="updatelabel" type="datetime" name="createtime" value="<fmt:formatDate value="${itemsCustom.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>"/></td>
</tr>
<tr>
	<td>商品图片</td>
	<td>
		<c:if test="${itemsCustom.pic !=null}">
			<img src="${pageContext.request.contextPath }/images/${itemsCustom.pic}" width=100 height=100/>
			<br/>
			<input name="pic" type="hidden" value="${itemsCustom.pic}" />
		</c:if>
		<input type="file"  name="pictureFile"/> 
	</td>
</tr>
<tr>
	<td>商品简介</td>
	<td>
	<textarea class="bigtext" rows="5" cols="25" name="detail">${itemsCustom.detail }</textarea>
	</td>
</tr>
<tr>
<td colspan="2" align="center"><input class="updatebt" type="submit" value="提交"/>
</td>
</tr>
</table>

</form>
</body>

</html>