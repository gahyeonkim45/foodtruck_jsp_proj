<%@page import="kdb.foodtruck.dto.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<div class="modal-header"> 
	<a class="close" data-dismiss="modal">×</a> 
	<h3>회원 정보 수정</h3> 
</div> 
<%
List<Customer> user = (List<Customer>) request.getAttribute("user");
Customer me = user.get(0);
%>
<div class="modal-body"> 
	<form action="./foodtruck?cmd=MemberUpdate" method="post"> 
		<div class="form-group"> 
			<label class="control-label" for="inputDefault">이름</label> 
			<input type="text" name="name" class="form-control" id="inputDefault" value="<%=me.getCustomerName()%>"> 
		</div> 
		<div class="form-group"> 
			<label class="control-label" for="inputDefault">이메일</label> 
			<input type="text" name="email" class="form-control" id="inputDefault" value="<%=me.getCustomerEmail()%>" readonly /> 
		</div> 
		<div class="form-group"> 
			<label class="control-label" for="inputDefault">비밀번호</label> 
			<input type="text" name="pwd" class="form-control" id="inputDefault" value="<%=me.getCustomerPwd()%>"> 
		</div> 
		<div class="form-group"> 
			<label class="control-label" for="inputDefault">휴대폰 번호</label> 
			<input type="number" name="pnum" class="form-control" value="<%=me.getCustomerPnum()%>" id="inputDefault"> 
		</div> 
		<div class="form-group"> 
			<label class="control-label" for="inputDefault">관심 지역</label> 
			<input type="text" name="addr" class="form-control" id="inputDefault" value="<%=me.getCustomerAddr()%>"> 
		</div>
		<div class="form-group"> 
		     <label for="select" class="control-label">생년월일</label> 
		     <input type="date" name="bdate" class="form-control" id="inputBdate" value="<%=me.getCustomerBdate()%>" placeholder="BirthDate"> 
		</div>
		<input type="hidden" value="<%=me.getCustomerGender()%>" name="gender"/>
	</form> 
</div> 
<div class="modal-footer"> 
	<a class="btn btn-primary" onclick="$('.modal-body > form').submit();">수정 완료</a> 
	<a class="btn" data-dismiss="modal">취소</a> 
</div>