$(function() {

	
//	$(".btnDelete").click(function(){
//		//先发送一个是否确定删除的对话框。
//		//ajax方式删除，并返回删除是否成功。
//		//刷新页面
//		
//		var pageNum = $("input[name='pageNum']").val();
//		if(confirm("确认删除"))
//			window.location.href="deleteAwardAndPunishment.action?id=" + this.name+"&pageNum="+pageNum; 
//		return false;
//	});

})
var action="user/pageItemsList.action"

function firstPage(bashPath){
	pageNum=$("input[name='pageNum']").val();
	if(pageNum==1)
		alert("当前已是第一页")
	else
		window.location.href=bashPath+action+"?pageNum="+1; 
}

function prePage(bashPath){
	pageNum=$("input[name='pageNum']").val();
	if(pageNum==1)
		alert("当前已是第一页")
	else{
		pageNum=parseInt(pageNum)-1
		window.location.href=bashPath+action+"?pageNum="+pageNum; 
	}
}

function nextPage(bashPath,last){
	pageNum=$("input[name='pageNum']").val();
	if(pageNum==last)
		alert("当前已是最后一页")
	else{
		pageNum=parseInt(pageNum)+1
		window.location.href=bashPath+action+"?pageNum="+pageNum;  
	}
		
}

function lastPage(bashPath,last){
	pageNum=$("input[name='pageNum']").val();
	if(pageNum==last)
		alert("当前已是最后一页")
	else{
		pageNum=last
		window.location.href=bashPath+action+"?pageNum="+pageNum; 
	}
}

function transferPage(bashPath,last){
	pageNum=$("input[name='transferNum']").val();
	if(pageNum<1||pageNum>last)
		pageNum=last
		window.location.href=bashPath+action+"?pageNum="+pageNum; 
}
