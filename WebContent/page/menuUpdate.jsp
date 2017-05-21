<%@page import="kdb.foodtruck.dto.Menu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal-header">
	<a class="close" data-dismiss="modal">&times;</a>
	<h3>메뉴 수정하기</h3>
</div>
<div class="modal-body update">
	<%
	Menu menu = (Menu) request.getAttribute("menu");
	%>
	<form enctype="multipart/form-data" action="foodtruck?cmd=MenuUpdate" method="post" class="modal-body">
		<div class="form-group">
			<label class="control-label" for="inputDefault">메뉴 이름</label>
			<input name="name" type="text" class="form-control" id="inputDefault" value="<%=menu.getMenuName()%>">
			<input type="hidden" name="num" value="<%=menu.getMenuNum()%>">
		</div>
		<div class="form-group">
			<label class="control-label" for="inputDefault">메뉴 가격</label>
			<input name="price" type="text" class="form-control" id="inputDefault" value="<%=menu.getMenuPrice()%>">
		</div>
		<div class="form-group">
			<label class="control-label" for="inputDefault">메뉴 종류</label>
			<input name="type" type="text" class="form-control" id="inputDefault" value="<%=menu.getMenuType()%>">
		</div>
		<div class="form-group">
	      	<label for="textArea" class="col-lg-2 control-label" for="inputDefault">메뉴 설명</label>
	        <input value="<%=menu.getMenuExplain()%>" name="explain" class="form-control" id="inputDefault"></textarea>
	    </div>
		<div class="form-group">
			<label class="control-label" for="image">메뉴 사진</label>
			<input name="image" type="file" class="form-control" id="image" >
			<input name="oldimage" type="hidden" value="<%=menu.getMenuPic()%>">
		</div>
		<div class="form-group">
			<div id="image_preview">
				<a></a>
				<img style="width:100%;" src="upload/<%=menu.getMenuPic() %>" /><br />
			</div>
		</div>
	</form>
</div>
<div class="modal-footer">
	<a class="btn btn-primary" onclick="$('.update > form').submit();">메뉴 등록 완료</a>
	<a class="btn" data-dismiss="modal">닫기</a>
</div>