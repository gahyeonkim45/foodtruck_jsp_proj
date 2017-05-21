<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Navigation -->
   <!-- Navigation -->
   <%
   Object customerNum = session.getAttribute("customerNum");
   Object ownerNum = session.getAttribute("ownerNum");
   %>
   
   
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <%
                	String url = "";
            		if(ownerNum!=null) {
            			url = "foodtruck?cmd=Owner";
            		} else {
            			url = "foodtruck?cmd=MainAction";
            		}
                %>
                <a class="navbar-brand page-scroll" href="<%=url%>"> Good Morning Food Truck </a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                    <%
                    	String login = "";
            	
                    	if(customerNum!=null) {
                    		login = (String) session.getAttribute("id")+"고객님";
                    %>
                    	<a class="page-scroll" href="foodtruck?cmd=MemberUpdateForm" data-target="#myModal" data-toggle="modal"><%=login %></a>
                    
                    <%
                    	} else if(ownerNum!=null) {
                    		login = (String) session.getAttribute("id")+"업주님";
                    %>
                    	<a class="page-scroll" href="./page/MemberUpdate.jsp"><%=login %></a>
                    <%
                    	} else {
                    		login ="로그인";
                    %>
                    	<a class="page-scroll" href="foodtruck?cmd=LoginForm" data-target="#myModal" data-toggle="modal"><%=login %></a>
                    <%
                    	}
                    %>
                    </li>
                    <li>
                    <%
                    	String register = "";
                    	if(!login.equals("로그인")) {
                    		register = "로그아웃";
                    %>
                        <a class="page-scroll" href="foodtruck?cmd=LogoutForm" data-target="#myModal" data-toggle="modal"><%=register %></a>
                    <%
                    	} else {
                    		register = "회원가입";
                    %>
                        <a class="page-scroll" href="foodtruck?cmd=MemberRegisterForm" data-target="#myModal" data-toggle="modal"><%=register %></a>
                    <%
                    	}
                    %>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>