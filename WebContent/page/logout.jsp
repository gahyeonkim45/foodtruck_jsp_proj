<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal-header">
	<a class="close" data-dismiss="modal">&times;</a>
	<h3>로그아웃</h3>
</div>
<div class="modal-body">
	<form action="foodtruck?cmd=Logout" method="post" class="modal-body">
		<div class="form-group">
			<label class="control-label">정말로 로그아웃을 하시겠습니까?</label>
		</div>
	</form>
</div>
<div class="modal-footer">
	<a class="btn btn-primary" onclick="$('.modal-body > form').submit();">로그아웃하기</a>
	<a class="btn" data-dismiss="modal">닫기</a>
</div>