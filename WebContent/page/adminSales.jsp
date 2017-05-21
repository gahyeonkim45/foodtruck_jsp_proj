<%@page import="kdb.foodtruck.dto.Sales"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <meta charset="utf-8" />
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	    <meta name="description" content="" />
	    <meta name="author" content="" />
	    
	    <!--[if IE]>
	       <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	       <![endif]-->
	       
	   <title>고객 평가</title>
	   
	   <!-- FONT AWESOME ICONS  -->
	  	<link href="css/font-awesome.css" rel="stylesheet" />
	   
	   <!-- BOOTSTRAP CORE STYLE  -->
	   <link href="css/bootstrap.min.css" rel="stylesheet" />
	   
	   <!-- CUSTOM STYLE  -->
	   <link href="css/admin-main.css" rel="stylesheet" />
	   
	   <!-- ajax -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
	   
	   <!-- Custom Fonts -->
	   <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	   <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
	   <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	   <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
	   
	    <!-- HTML5 Shiv and Respond.js for IE8 support of HTML5 elements and media queries -->
	   <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	   <!--[if lt IE 9]>
	       <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	       <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	   <![endif]-->
	
	</head>
	
	<body>
	
		<%
		List<Sales>	alist = (List<Sales>) request.getAttribute("aList");
		List<Sales> wList = (List<Sales>) request.getAttribute("wList");
		%>
	
		<!-- HEADER START-->
	    <%@include file="./header.jsp"%>
	    <!-- HEADER END-->
	    
	    <!-- Modal HTML START -->
	    <div id="myModal" class="modal fade">
	        <div class="modal-dialog">
	            <div class="modal-content">
	            </div>
	        </div>
	    </div>
	    <!-- Modal HTML END -->
	    
	    <!-- HEADER2 START-->
	    <div class="navbar navbar-inverse set-radius-zero">
	        <div class="container">
	            <div class="left-div">
	            	<h1>매출관리</h1>
	            </div>
	        </div>
	    </div>
	    <!-- HEADER2 END-->
	    
	    <!-- MENU SECTION START-->
	    <section class="menu-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-md-12">
	                    <div class="navbar-collapse collapse ">
	                        <ul id="menu-top" class="nav navbar-nav navbar-right">
	                            <li><a href="foodtruck?cmd=Owner">Today</a></li>
	                            <li><a href="foodtruck?cmd=OwnerCustomerForm">고객평가</a></li>
	                            <li><a class="menu-top-active" href="foodtruck?cmd=SalesRegisterForm">매출관리</a></li>
	                            <li><a href="foodtruck?cmd=MenuList">메뉴관리</a></li>
	                            <li><a href="foodtruck?cmd=Eventlist">이벤트관리</a></li>
	                            <li><a href="foodtruck?cmd=OwnerUpdateForm">정보수정</a></li>
	                        </ul>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </section>
	    <!-- MENU SECTION END-->
	    
	    <!-- CONTENT-WRAPPER START -->
	    <div class="content-wrapper">
	    
		    <!-- CONTAINER START -->
	        <div class="container">
	        	<div class="row">
	        		<div class="col-md-12">
	        			<span>
	        				<a data-toggle="modal" data-target="#registerModal" class="btn btn-danger btn-lg">매출 등록</a>
                    		<a data-toggle="modal" data-target="#updateModal" class="btn btn-default btn-lg">매출 수정</a>
	        			</span>
	        		</div>
	        	</div>
	        
	        	<!-- 일간 매출 -->
	        	<div class="row">
	        	
	        		<!-- 일간 매출 통계 헤더 -->
					<div class="col-md-12">
                        <h1 class="page-head-line">일간 매출 통계</h1>
                    </div>
                    <!-- /일간 매출 통계 헤더 -->
                    
                    <!-- 일간 매출 그래프 -->
                    <div class="col-md-12">
	                    <div class="panel panel-default">
	                    	<div class="panel-heading">
                    			일간 매출 그래프
                    			<div class="btn-group">
									<button id="title" data-toggle="dropdown" class="btn btn-default dropdown-toggle">월 선택<span class="caret"></span></button>
									<ul class="dropdown-menu">
								  	<% 
									  	for(int i=0; i<12; i++) {
									%>
										<li><a id="day<%=i%>" href="#" month=<%=i+1%>><%=i+1%>월</a></li>
									<%
									  }
									%>
									</ul>
								</div>
	                    	</div>
                    		<div class="panel-body">
	                    			<div id="chart_div_day"> </div>
	                    	</div>
                    		<div class="panel-footer">
                    			※ 해당 월의 일간 매출 그래프입니다.
                    		</div>
	                    </div>
                    </div>
                    <!-- 일간 매출 그래프 -->
                    
	        	</div>
	        	<!-- /일간 매출 -->
	        
				<!-- 주별 매출 -->
				<div class="row">
				
					<!-- 주간 매출 통계 헤더 -->
					<div class="col-md-12">
                        <h1 class="page-head-line">주간 매출 통계</h1>
                    </div>
                    <!-- /주간 매출 통계 헤더 -->
                    
                    <!-- 주간 매출 테이블 -->
					<div class="col-md-6">
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
	                            	주간 매출 목록
	                        </div>
	                        <div class="panel-body">
	                            <div class="table-responsive">
	                                <table class="table">
	                                    <thead>
	                                        <tr>
	                                            <th>#</th>
	                                            <th>요일</th>
	                                            <th>매출</th>
	                                            <th>전날 대비</th>
	                                            <th>비고</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                    	<%
	                                    		for(int i=0; i<wList.size(); i++) {
	                                    	%>
	                                        <tr>
	                                            <td><%=i+1%></td>
	                                            <td><%=wList.get(i).dateToString()%></td>
	                                            <td><%=wList.get(i).getSalesValue()%></td>
                                            <%
                                            	int diff = 0;
                                            	String ex = "-";
                                            	if(i!=0) {
                                            		diff = wList.get(i).getSalesValue() - wList.get(i-1).getSalesValue();
                                            		if(diff<0){
                                            			ex="↓("+diff+")";
                                            		} else if(diff>0) {
                                            			ex="↑("+diff+")";
                                            		}
                                            	}
                                            %>
	                                            <td><%=diff%></td>
	                                            <td><%=ex%></td>
	                                        </tr>
	                                        <%
	                                    		}
	                                        %>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                        <div class="panel-footer">
	                            	※ 해당주의 일요일부터 토요일까지 매출 목록입니다.
	                        </div>
	                    </div>
	                </div>
	                <!-- /주간 매출 테이블 -->
	                
	                <!-- 주간 매출 그래프 -->
	                <div class="col-md-6">
                        <div class="panel panel-default">
	                        <div class="panel-heading">
		                            	주간 매출 막대 그래프
	                        </div>
	                        <div class="panel-body">
							  	<div id="chart_div_week"> </div>
	                        </div>
                         	<div class="panel-footer">
                         		※ 금주의 매출 대비 해당 요일의 %입니다.
                         	</div>
                         </div>
	                </div>
	                <!-- /주간 매출 그래프 -->
	                
				</div>
				<!-- /주별 매출 -->
				
				<!-- 월별 매출 -->
				<div class="row">
					<!-- 월간 매출 통계 헤더 -->
					<div class="col-md-12">
                        <h1 class="page-head-line">월간 매출 통계</h1>
                    </div>
                    <!-- /월간 매출 통계 헤더 -->
                    
                    <div class="col-md-12">
                    	<div class="panel panel-default">
                    		<div class="panel-heading">
                    			월간 매출 그래프
                    		</div>
                    		<div class="panel-body">
                    			<div id="chart_div_month"> </div>
                    		</div>
                    		
                    		<div class="panel-footer">
                    			※ 금년도의 월간 매출 그래프입니다.
                    		</div>
                    	</div>
                    </div>
                    
				</div>
				<!-- /월별 매출 -->
				
	        </div>
	        <!-- CONTAINER END -->
	        
        </div>
        <!-- CONTENT-WRAPPER END -->
	    
	    <!-- FOOTER START -->
	    <footer>
	        <div class="container">
	            <div class="row">
	                <div class="col-md-12">
	                    &copy; 2015 YourCompany | By : <a href="http://www.designbootstrap.com/" target="_blank">DesignBootstrap</a>
	                </div>
	            </div>
	        </div>
	    </footer>
	    <!-- FOOTER END -->
	    
	    <!-- Modal area -->
	    <!-- 매출 등록 모달 -->
		<div id="registerModal" class="modal modal-wide fade">
			<div class="modal-dialog">
				<div class="modal-content">
	            	<div class="modal-header">
	            		매출 등록하기
	            	</div>
	            	<div class="modal-body">
	                     <form action="./foodtruck?cmd=SalesRegister" method="post">
		                     <div class="form-body pal">
	                            <div class="form-group">
								  <label class="control-label" for="inputDefault">오늘의 매출</label>
								  <input name="sale" type="text" class="form-control" id="inputDefault" placeholder="숫자만 입력해주세요.">
								</div>
		                     </div>
		                     <div class="form-actions text-right pal">
		                         <button type="submit" class="btn btn-primary">등록 완료</button>
		                         <button type="reset" class="btn btn-primary">등록 취소</button>
		                     </div>
	                     </form>
	                 </div>
	             </div>
			</div><!-- modal-dialog -->
		</div><!-- registerModal -->
		
		<!-- 매출 수정 모달 -->
		<div id="updateModal" class="modal modal-wide fade">
			<div class="modal-dialog">
				<div class="modal-content">
	            	<div class="modal-header">
	            		매출 수정하기
	            	</div>
	            	<div class="modal-body">
	                     <form action="./foodtruck?cmd=SalesUpdate" method="post">
		                     <div class="form-body pal">
	                            <div class="form-group">
								  <label class="control-label" for="inputDefault">수정할 날짜</label>
								  <input name="date" type="date" class="form-control" id="inputDefault">
								</div>
								<div class="form-group">
								  <label class="control-label" for="inputDefault">수정 금액</label>
								  <input name="sale" type="text" class="form-control" id="inputDefault">
								</div>
		                     </div>
		                     <div class="form-actions text-right pal">
		                         <button type="submit" class="btn btn-primary">수정 완료</button>
		                         <button type="reset" class="btn btn-primary">수정 취소</button>
		                     </div>
	                     </form>
	                 </div>
	             </div>
			</div><!-- modal-dialog -->
		</div><!-- updateModal -->
	    <!-- /.Modal area -->
	    
	    
	    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	    
	    <!-- BOOTSTRAP SCRIPTS  -->
	    <script src="js/bootstrap.js"></script>
	    
	    <!-- jQuery -->
	    <script src="js/jquery.js"></script>
	    
	    <!-- Plugin JavaScript -->
	    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	    <script src="js/classie.js"></script>
	    <script src="js/cbpAnimatedHeader.js"></script>
	
	    <!-- Custom Theme JavaScript -->
	    <script src="js/agency.js"></script>
	    
	    <!-- CORE JQUERY SCRIPTS -->
    	<script src="js/jquery-1.11.1.js"></script>
		
		<script>
		// 월별차트
    	// Load the Visualization API and the piechart package.
	    google.load('visualization', '1', {'packages':['corechart']});
	      
	    // Set a callback to run when the Google Visualization API is loaded.
	    google.setOnLoadCallback(drawChart);
	    
	    var current = (new Date()).getMonth()+1;
	      
	    function drawChart() {
	      var jsonData = $.ajax({
	          url: "./foodtruck?cmd=SalesMonth",
	          dataType:"json",
	          async: false
	      }).responseText;
	      
	      var jsonData2 = $.ajax({
	          url: "./foodtruck?cmd=SalesDay&month="+current,
	          dataType:"json",
	          async: false
	      }).responseText;
	      
	      var jsonData3 = $.ajax({
	          url: "./foodtruck?cmd=SalesWeek",
	          dataType:"json",
	          async: false
	      }).responseText;
	          
	      // Create our data table out of JSON data loaded from server.
	      var data = new google.visualization.DataTable(jsonData);
	      var data2 = new google.visualization.DataTable(jsonData2);
	      var data3 = new google.visualization.DataTable(jsonData3);
	      
	      var options0 = {
	    	        width: 1100,
	    	        height: 200,
	    	        legend: { position: "none" },
	    	        colors: ['#18709C']
	    	      };
	      
	      // Instantiate and draw our chart, passing in some options.
	      var chart = new google.visualization.LineChart(document.getElementById('chart_div_month'));
	      chart.draw(data, options0);
	      
	      var options = {
	    	        width: 1100,
	    	        height: 300,
	    	        bar: {groupWidth: "70%"},
	    	        legend: { position: "none" },
	    	        colors: ['#EF4089']
	    	      };
	      
	      var chart2 = new google.visualization.ColumnChart(document.getElementById('chart_div_day'));
	      chart2.draw(data2, options);
	      
	      var options2 = {
	    	        width: 500,
	    	        height: 200,
	    	        bar: {groupWidth: "60%"},
	    	        legend: { position: "none" },
	    	        colors:['#19BDC4']
	    	      };
   	      var chart3 = new google.visualization.BarChart(document.getElementById("chart_div_week"));
   	      chart3.draw(data3, options2);
	    }
	    
	    $('.dropdown-menu li a').click(function() {
			$("#title").text($(this).text());
	    	var month = $(this).attr("month");
	    	console.log(month);
	    	var jsonData = $.ajax({
		          url: "./foodtruck?cmd=SalesDay&month="+month,
		          dataType:"json",
		          async: false
		      }).responseText;
	    	
	    	var data = new google.visualization.DataTable(jsonData);
	    	
	    	var options = {
	    			width: 1100,
	    	        height: 300,
	    	        bar: {groupWidth: "70%"},
	    	        legend: { position: "none" },
	    	        colors: ['#EF4089']
	    	      };
	      
	      var chart = new google.visualization.ColumnChart(document.getElementById('chart_div_day'));
	      chart.draw(data, options);
	    });
	    
		</script>
	
	</body>
</html>