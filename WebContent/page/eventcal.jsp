<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="java.text.*"%>
<%@page import="kdb.foodtruck.dto.Event" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
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
	
<link href='css/fullcalendar.css' rel='stylesheet' />
<link href='css/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='js/moment.min.js'></script>
<script src='js/jquery.min.js'></script>
<script src='js/fullcalendar.min.js'></script>


<script>

<%

List list = (List) request.getAttribute("list");

JSONArray cell = new JSONArray(); // JSONObject list 를 넣을 JSONArray

Event e = null; // 데이터를 꺼내올 BeanVO 객체 생성
SimpleDateFormat df = new SimpleDateFormat("MM-dd-yyyy");

for(int i=0; i<list.size(); i++) { // 루프를 돌려 list에 담긴 데이터를 BeanVO에 주입
	e = (Event)list.get(i); // 이제 data 에는 객체들이 차례로 담겼음
    JSONObject obj = new JSONObject(); // 다시 한번 JSONObject로 감싸기 위해 객체 선언
    obj.put( "id" , e.getFoodTruckNum());//!!!!!!!!!!!!!!!!!!!!!!!!!!!푸드트럭!!!!!!!!!!!!!!!!!!!!!!!!!!1
    obj.put("eventid",e.getEventNum());
    obj.put( "title" , e.getEventName()); // obj에 객체의 데이터를 꺼내 차례로 담는다
    obj.put( "contents" , e.getEventContents()); // ( key , value ) 형식
    obj.put( "start" , (e.getEventStart().getMonth()+1)+"-"+(e.getEventStart().getDate()+1)+"-"+(e.getEventStart().getYear()+1900));
    obj.put( "end" , (e.getEventEnd().getMonth()+1)+"-"+(e.getEventEnd().getDate()+1)+"-"+(e.getEventEnd().getYear()+1900));
    cell.add(obj); // 아까 만들어진 cell Array객체에 VO담은 객체를 주입

}

%>

	$(document).ready(function() {
		
		var today = new Date();
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,'
			},
			defaultDate: today,
			selectable: true,
			selectHelper: true,
			select: function(start, end) {
				

				bootbox.prompt('이벤트 제목:',function(response){
					var eventData;
					if(response){
						bootbox.prompt('이벤트 내용:',function(response2){
						
						eventData = {
						    id: 35,//!!!!!!!!!!!!!!!!!!!!!!!!!!!푸드트럭!!!!!!!!!!!!!!!!!!!!!!!!!!1
							title: response,
							contents: response2,
							start: start,
							end: end
						}
						

						var intitle = eventData.title;
						var incontents = eventData.contents;
						
						var instart = eventData.start;
						var inend = eventData.end;
						
						document.getElementById("foodid1").value = eventData.id;
						document.getElementById("title").value = intitle;
						document.getElementById("contents").value = incontents;
				   
						var startdate = new Date(instart);
						var enddate = new Date(inend);
						

						document.getElementById("start").value = startdate.getFullYear()+"-"+(startdate.getMonth()+1)+"-"+(startdate.getDate());
						document.getElementById("end").value = enddate.getFullYear()+"-"+(enddate.getMonth()+1)+"-"+(enddate.getDate());
						
						document.forms["add"].submit();

						
					});
					}
				});

							
			    $('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
				
				$('#calendar').fullCalendar('unselect');
			},
			eventClick: function(calEvent, jsEvent, view) {

		        bootbox.dialog({
		        	  message: calEvent.contents,
		        	  title: calEvent.title,
		        	  buttons: {
		        	    success: {
		        	      label: "OK!",
		        	      className: "btn-success"
		        	    },
		        	    danger: {
		        	      label: "Delete!",
		        	      className: "btn-danger",
		        	      callback: function() {
		        	    	  bootbox.dialog({
		        	    		  message: "삭제하시겠습니까?",
		        	    		  title: "Delete",
		        	    		  buttons:{
		        	    			  success: {
		        		        	      label: "delete!",
		        		        	      className: "btn-danger",
		        		        	      callback: function(){
		        		        	    	  document.getElementById("eventnum3").value = calEvent.eventid;
					      			        	
					      						document.forms["delete"].submit();
		        		        	      }
		        		        	    }
		        	    		  }
		        	    	  });        	
		        	      }
		        	    }
		        	  }
		        	});
		    },
			editable: true,
			eventDrop: function(event, delta, revertFunc) {

				bootbox.dialog({
  	    		  message: event.title + " 가 " + event.start.format() + " 로 변경됩니다.",
  	    		  title: "Update",
  	    		  buttons:{
  	    			  success: {
  		        	      label: "update!",
  		        	      className: "btn-success",
  		        	      callback: function(){
  		        	    
  		        	    	document.getElementById("eventnum").value = event.eventid;
  							document.getElementById("title2").value = event.title;
  							document.getElementById("contents2").value = event.contents;
  					   
  							var startdate = new Date(event.start.format());
  							var enddate = new Date(event.end.format());
  						
  							document.getElementById("start2").value = startdate.getFullYear()+"-"+(startdate.getMonth()+1)+"-"+startdate.getDate();
  							document.getElementById("end2").value = enddate.getFullYear()+"-"+(enddate.getMonth()+1)+"-"+enddate.getDate();
  							
  							document.forms["update"].submit();
  		        	      }
  		        	    }
  	    		  }
  	    	  }); 
				
		    },
			eventLimit: true, // allow "more" link when too many events
			events: <%=cell.toString()%>
		});

	});

</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
		margin-top:100px;
	}

</style>
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header page-scroll">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand page-scroll" href="../index.html"> Good
				Morning Food Truck </a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li class="hidden"><a href="#page-top"></a></li>
				<li><a class="page-scroll" href="../page/login.jsp"
					data-target="#myModal" data-toggle="modal">로그인 </a></li>
				<li><a class="page-scroll" href="../page/register.jsp"
					data-target="#myModal" data-toggle="modal">회원가입 </a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>

	<!-- Modal HTML -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>
	
<div class="row">
<div id='calendar'></div>
</div>

<form name="add" method="post" action="foodtruck?cmd=Eventadd">
<input type="hidden" name="id" id="foodid1">
<input type="hidden" name="title" id="title">
<input type="hidden" name="contents" id="contents">
<input type="hidden" name="start" id="start">
<input type="hidden" name="end" id="end">

</form>



<form name="update" method="post" action="foodtruck?cmd=Eventupdate">


<input type="hidden" name="id" id="foodid2">
<input type="hidden" name="eventnum" id="eventnum">
<input type="hidden" name="title2" id="title2">
<input type="hidden" name="contents2" id="contents2">
<input type="hidden" name="start2" id="start2">
<input type="hidden" name="end2" id="end2">

</form>

<form name="delete" method="post" action="foodtruck?cmd=Eventdelete">

<input type="hidden" name="eventnum3" id="eventnum3">

</form>



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
	
	<script src="js/bootbox.js"></script>
	

</body>
</html>
