<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="kdb.foodtruck.dto.Event" %>
<%
 
    request.setCharacterEncoding("UTF-8");
 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>이벤트 관리</title>

<!-- Bootstrap Core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/earlyaccess/hanna.css">
<link href="./css/sb-admin.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="./font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">

<!-- ajax -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Custom Fonts -->
<link href="./font-awesome/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Kaushan+Script'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700'
	rel='stylesheet' type='text/css'>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
		        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		    <![endif] -->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600'
	rel='stylesheet' type='text/css'>
<link
	href="//netdna.bootstrapcdn.com/font-awesome/3.1.1/css/font-awesome.css"
	rel="stylesheet">

<style>
#myModal {
	margin-left: auto;
	margin-right: auto;
	text-align: center;
}

.modal-content {
	width: 50%;
}
</style>

</head>

<body>
	<%@include file="./header.jsp"%>

	<!-- Modal HTML -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>

	<!-- 이벤트목록 header -->
	<div class="row">
		<h3>이벤트 목록</h3>
		<a data-toggle="modal" href="#shortModal" class="tablebutton3"> 추가
		</a>
		<hr />

		<br /> <br />
		<div class="table-responsive de">
				<table class="table table-bordered table-hover text-center">
					<thead>
						<tr>
						    <th>번호</th>
							<th>이름</th>
							<th>내용</th>
							<th>기간</th>
							<th>삭제</th>
							<th>수정</th>
						</tr>
					</thead>
					<tbody>

						<%
							List<Event> list = (List<Event>)request.getAttribute("list");

				         if(list.size()!=0){
							for (int i = 0; i < list.size(); i++) {
								Event e = list.get(i);
								
						%>
						<tr>
						    <td><%= i+1 %></td>
							<td><%=e.getEventName()%></td>
							<td><%=e.getEventContents()%></td>

							<td><%=e.getEventStart()%> ~ <%=e.getEventEnd()%></td>
							                     <td><%request.setAttribute("eventnum", e.getEventNum()); %>
                        <%request.setAttribute("eventname", e.getEventName()); %>
                        <%request.setAttribute("eventend", e.getEventEnd()); %>
                        <%request.setAttribute("eventcontents", e.getEventContents()); %>
                        <a data-toggle="modal"
                        href="#shortModal4"
                        class="tablebutton2"> 수정 </a></td>
						</tr>
						<%
							}
				         }
						%>

					</tbody>
				</table>
		</div>
	</div>
	<!-- /이벤트목록 header -->

	<!-- 모달1 -->
	<div id="shortModal" class="modal modal-wide fade">
		<div class="modal-dialog">
			<div class="modal-body">
				<div class="testbox3">
					<form method="post" action="foodtruck?cmd=Eventadd">
						<br /> 
						<input type="hidden" name="foodid"/>
						<label id="tableicon" for="name">
							<i class="icon-user "></i>
						</label>
						<input type="text" name="name" placeholder="이름" />
						<label id="tableicon" for="name">
							<i class="icon-envelope"></i>
						</label>
						<input type="text" name="content" placeholder="내용" />
						<label id="tableicon" for="name">
							<i class="icon-shield"></i>
						</label>
						<input type="date" name="end" placeholder="마감일" /><br />
						<h5>&nbsp;&nbsp;마감일을 기입하세요.(시작일 : 오늘)</h5>
						<input type="submit" class="tablebutton" value="Register" />
					</form>
				</div>
			</div>
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- /모달1 -->

	<!-- 모달2 -->
	<div id="shortModal3" class="modal modal-wide fade">
		<div class="modal-dialog">
			<div class="modal-body">
				<div class="testbox2">
					<br /> <br />
					<h4>삭제하시겠습니까?</h4>
					<br />
					<form method="post" action="foodtruck?cmd=Eventdelete">
						<input type="hidden" name="eventnum" value="<%= request.getAttribute("eventnum")%>">
						<input type="submit" class="tablebutton3" value="OK" />
					</form>
				</div>
			</div>
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- /모달2 -->
	
	<!-- 모달1 -->
	<div id="shortModal4" class="modal modal-wide fade">
		<div class="modal-dialog">
			<div class="modal-body">
				<div class="testbox3">
					<form method="post" action="foodtruck?cmd=Eventupdate">
						<br />
	              <input type="hidden" name="eventnum" value="<%= request.getAttribute("eventnum")%>">
                  <label id="tableicon" for="name">
                  <i class="icon-user "></i>
                  </label> 
                  <input type="text" name="name" value="<%= request.getAttribute("eventname")%>" />
                  <label id="tableicon" for="name">
                  <i class="icon-envelope"></i>
                  </label> 
                  <input type="text" name="content" value="<%= request.getAttribute("eventcontents")%>" />
                  <label id="tableicon" for="name"> <i class="icon-shield"></i>
                  </label>
                   <input type="date" name="end" value="<%= request.getAttribute("eventend")%>" /><br />
                  <h5>&nbsp;&nbsp;마감일을 기입하세요.(시작일 : 오늘)</h5>
                  <input type="submit" class="tablebutton" value="Update" />
					</form>
				</div>
			</div>
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	<!-- /모달1 -->
	


	<!-- jQuery -->
	<script src="./js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="./js/bootstrap.min.js"></script>

	<!-- Plugin JavaScript -->
	<script
		src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	<script src="./js/classie.js"></script>
	<script src="./js/cbpAnimatedHeader.js"></script>

	<!-- Contact Form JavaScript -->
	<script src="./js/jqBootstrapValidation.js"></script>


	<!-- Custom Theme JavaScript -->
	<script src="./js/agency.js"></script>

</body>
</html>