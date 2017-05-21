<%@page import="kdb.foodtruck.dto.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal-header">
	<a class="close" data-dismiss="modal">&times;</a>
	<h3>메뉴 상세보기</h3>
</div>
<div class="modal-body">
	<% Menu menu = (Menu) request.getAttribute("menu"); %>
	<div class="panel panel-default">
	  <div class="panel-body">메뉴 이름</div>
	  <div class="panel-footer"><%=menu.getMenuName()%></div>
	</div>
	<div class="panel panel-default">
	  <div class="panel-body">메뉴 가격</div>
	  <div class="panel-footer"><%=menu.getMenuPrice()%></div>
	</div>
	<div class="panel panel-default">
	  <div class="panel-body">메뉴 종류</div>
	  <div class="panel-footer">
	  <%
	  	switch(menu.getMenuType()) {
	  	case 1 : out.print("분식"); break;
	  	case 2 : out.print("식사류"); break;
	  	case 3 : out.print("디저트류"); break;
	  	case 4 : out.print("음료"); break;
	  	case 5 : out.print("기타"); break;
	  	}
	  %>
	  </div>
	</div>
	<div class="panel panel-default">
	  <div class="panel-body">메뉴 설명</div>
	  <div class="panel-footer"><%=menu.getMenuExplain()%></div>
	</div>
	<div class="panel panel-default">
	  <div class="panel-body" >메뉴 사진</div>
	  <div id="image_preview" class="panel-footer"><img style="width:100%;" src="upload/<%=menu.getMenuPic()%>" /></div>
	</div>
</div>
<div class="modal-footer">
	<div class="delete">
		<form action="foodtruck?cmd=MenuDelete&num=<%=menu.getMenuNum()%>" method="post"></form>
	</div>
	<div class="cancle">
		<form action="foodtruck?cmd=MenuList" method="post"></form>
	</div>
	<a id="deleteBtn" class="btn btn-primary" >메뉴 삭제하기</a>
	<a class="btn" data-dismiss="modal">닫기</a>
</div>

<script>
$("#deleteBtn").click(function(){
    if(confirm("정말 삭제하시겠습니까?")) {
    	$('.delete > form').submit();
    } else {
    	$('.cancle > form').submit();
    }
});

</script>