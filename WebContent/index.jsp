<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String url = "";
	if(session.getAttribute("ownerNum")!=null)
		url = "foodtruck?cmd=Owner";
	else
		url = "foodtruck?cmd=MainAction";
	
	response.sendRedirect(url);
%>