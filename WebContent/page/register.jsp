
<%@ page language="java" contentType="text/html; charset=UTF-8" 
   pageEncoding="UTF-8"%> 
  
<div class="modal-header"> 
	<a class="close" data-dismiss="modal">×</a> 
	<h3>회원가입하기</h3> 
</div> 
<div class="modal-body"> 
	<form action="./foodtruck?cmd=MemberRegister" method="post"> 
		<div class="form-group"> 
			<label class="control-label" for="inputDefault">이름</label> 
			<input type="text" name="name" class="form-control" id="inputDefault"> 
		</div> 
		<div class="form-group"> 
			<label class="control-label" for="inputDefault">이메일</label> 
			<input type="text" name="email" class="form-control" id="inputDefault"> 
		</div> 
		<div class="form-group"> 
			<label class="control-label" for="inputDefault">비밀번호</label> 
			<input type="text" name="pwd" class="form-control" id="inputDefault"> 
		</div> 
		<div class="form-group"> 
			<label class="control-label" for="inputDefault">휴대폰 번호</label> 
			<input type="number" name="PhoneNumber" class="form-control" id="inputDefault"> 
		</div> 
		<div class="form-group"> 
			<label class="control-label" for="inputDefault">관심 지역</label> 
			<input type="text" name="Addr" class="form-control" id="inputDefault"> 
		</div> 
		<div class="form-group"> 
		     <label for="select" class="control-label">생년월일</label> 
		       <input type="date" name="Bdate" class="form-control" id="inputBdate" placeholder="BirthDate"> 
		</div> 
		
		<!-- 성별 입력 -->   
		<div class="form-group" > 
			<label for="select" class="control-label">성별</label> 
			<input type="radio" name="Gender" value="f"> 여성 
			<input type="radio" name="Gender"  value="m" > 남성 
		</div> 
	</form> 
</div> 
<div class="modal-footer"> 
	<a class="btn btn-primary" onclick="$('.modal-body > form').submit();">가입하기</a> 
	<a class="btn" data-dismiss="modal">Close</a> 
</div>