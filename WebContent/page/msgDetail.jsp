<%@page import="kdb.foodtruck.dto.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Message msg = (Message) request.getAttribute("msg");
%>
<div class="modal-header"> 
	<a class="close" data-dismiss="modal">×</a> 
	<h3><strong>제목 : </strong><%=msg.getMsgtitle()%></h3> 
</div>
<div class="modal-body">
	<form action="foodtruck?cmd=DeleteMsg&msgnum=<%=msg.getMsgnum()%>"></form>
	<%=msg.getMsgcontent() %>
</div>
<div class="modal-footer">
	<strong>보내는이: </strong><%=msg.getMsgsendername()%>(<%=msg.getMsgsenderemail()%>)<br/>
	<strong>보낸 날짜: </strong><%=msg.getMsgdate()%><hr/>
	<a class="btn btn-primary" onclick="$('.modal-body > form').submit();">삭제하기</a> 
	<a class="btn" data-dismiss="modal">Close</a> 
</div>