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
		.tboneline{
			border-radius:4px;
			font-size:25px;
			background-color:#6495ED;
			color: white;
		}
		.updatelistbt{
			border-radius:4px;
			width:100px;
			height:30px;
			font-size:20px;
			background-color:#6495ED;
			color: white;
		}
		.idlabel{
			width: 15px;
			height: 25px;
			font-size: 25px;
		}
		.updatelistlabel{
			width: 200px;
			height: 25px;
			font-size: 20px;
		}
		.bigtext{
			width: 200px;
			height: 80px;
			font-size: 20px;
		}
	</style>
</head>
<body> 
<form name="itemsForms" action="${pageContext.request.contextPath }/items/editItemsListSubmit.action" method="post" enctype="multipart/form-data">
<table width="100%" border=1>
<tr class="tboneline" >
	<td>商品ID</td>
	<td>商品名称</td>
	<td>商品价格</td>
	<td>商品图片</td>
	<td>生产日期</td>
	<td>商品简介</td>
</tr>
<c:forEach items="${itemsList}" var="item" varStatus="s">
<tr>

	<td><input class="idlabel" type="text" readonly="readonly" name="itemsListCustom[${s.index }].id" value="${item.id }"/></td>
	<td><input class="updatelistlabel" type="text" name="itemsListCustom[${s.index }].name" value="${item.name }" /></td>
	<td><input class="updatelistlabel" type="text" name="itemsListCustom[${s.index }].price" value="${item.price }" /></td>
	<td>
		<c:if test="${item.pic !=null}">
			<img name="itemsListCustom[${s.index }].pic" src="${pageContext.request.contextPath }/images/${item.pic}" width=100 height=100/>
			<br/>
			<input name="itemsListCustom[${s.index }].pic" type="hidden" value="${item.pic}" />
		</c:if>
		<input type="file"  name="itemsListCustom[${s.index }].pictureFile"/> 
	</td>
	<td><input class="updatelistlabel" type="text" name="itemsListCustom[${s.index }].createtime" value="<fmt:formatDate value="${item.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>" /></td>
	<td><textarea class="bigtext" rows="5" cols="25" name="itemsListCustom[${s.index }].detail">${item.detail }</textarea></td>
<%-- 	<td><input name="itemsListCustom[${s.index }].detail" value="${item.detail }" /></td> --%>
</tr>
</c:forEach>
<tr>
	<td colspan="5"  align="center" ><input class="updatelistbt" type="submit" value="提交" /></td>
</tr>
</table>
</form>
</body>

</html>