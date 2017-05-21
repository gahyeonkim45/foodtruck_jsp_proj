<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="kdb.foodtruck.dto.Search"%>
<%@page import="kdb.foodtruck.dto.CustomerReview"%>
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
	   <script src="js/d3.js"></script> 
       <script src="js/d3.layout.cloud.js"></script>
       <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/hanna.css">
	
	</head>
	
	<body>
	
		<%
	    List<CustomerReview> crlist = (List<CustomerReview>) request.getAttribute("crlist");
	    List<CustomerReview> crNewlist = (List<CustomerReview>) request.getAttribute("crNewlist");
	    List<Search> slist = (List<Search>) request.getAttribute("slist");
	    
	    String ownerName = session.getAttribute("id").toString();
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
	            	<h1>고객 평가</h1>
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
	                            <li><a class="menu-top-active" href="foodtruck?cmd=OwnerCustomerForm">고객평가</a></li>
	                            <li><a href="foodtruck?cmd=SalesRegisterForm">매출관리</a></li>
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
	        		<div class="col-md-6">
	        			<h4 class="page-head-line">검색 태그</h4>
	        		</div>
	        		
	        		<div class="col-md-6">
	        			<h4 class="page-head-line">고객 리뷰</h4>
	        		</div>
	        	</div>
	        	<div class="row">	
	        		<div class="col-md-6">
	        			<div id="cloud" style="margin-bottom:45px;margin-top:10px;"> 
							<script> 
								<% 
								
								JSONArray cell = new JSONArray(); // JSONObject list 를 넣을 JSONArray 
								
								Search s = null; // 데이터를 꺼내올 BeanVO 객체 생성 
								
								for(int i=0; i<slist.size(); i++) { // 루프를 돌려 list에 담긴 데이터를 BeanVO에 주입 
								s = (Search)slist.get(i); // 이제 data 에는 객체들이 차례로 담겼음 
								   JSONObject obj = new JSONObject(); // 다시 한번 JSONObject로 감싸기 위해 객체 선언 
								   obj.put( "word" , s.getSearchword()); // obj에 객체의 데이터를 꺼내 차례로 담는다 
								   if(s.getSearchcount() < 4){ 
								   	obj.put( "size" , s.getSearchcount()*3); 
								   }else{ 
								   obj.put( "size" , s.getSearchcount()); }// ( key , value ) 형식 
								   cell.add(obj); // 아까 만들어진 cell Array객체에 VO담은 객체를 주입 
								
								} 
								
								%> 
								
								 var fill = d3.scale.category20(); 
								 var result = <%=cell.toString()%> 
								  
								 d3.layout.cloud().size([500, 500]) 
								     .words(result.map(function(d) { 
								       return {text: d.word, size: 5*d.size+5/*10 + Math.random() * 90*/}; 
								     })) 
								     .padding(5) 
								     .rotate(function() { return ~~(Math.random() * 2) * 90; }) 
								     .font("Hanna") 
								     .fontSize(function(d) { return d.size; }) 
								     .on("end", draw) 
								     .start(); 
								
								 function draw(words) { 
								   d3.select("#cloud").append("svg") 
								       .attr("width", 480) 
								       .attr("height", 480) 
								     .append("g") 
								       .attr("transform", "translate(250,250)") 
								     .selectAll("text") 
								       .data(words) 
								     .enter().append("text") 
								       .style("font-size", function(d) { return d.size + "px"; }) 
								       .style("font-family", "Hanna") 
								       .style("fill", function(d, i) { return fill(i); }) 
								       .attr("text-anchor", "middle") 
								       .attr("transform", function(d) { 
								         return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")"; 
								       }) 
								       .text(function(d) { return d.text; }); 
								    
								 } 
							</script> 
						</div>
        			</div>
	        	
		        	
	                <div class="col-md-6">
	                    <div class="panel panel-danger">
	                        <div class="panel-heading">
	                            	고객 리뷰 목록
	                        </div>
	                        <div class="panel-body">
	                            <div class="table-responsive">
	                                <table class="table table-hover">
	                                    <thead>
	                                        <tr>
	                                            <th>#</th>
	                                            <th>이름</th>
	                                            <th>내용</th>
	                                            <th>날짜</th>
	                                            <th>삭제</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                    	<%
	                                    		for(int i=0; i<crlist.size(); i++) {
	                                    	%>
		                                        <tr>
		                                            <td><%=i+1 %></td>
		                                            <td><%=crlist.get(i).getCustomerName()%></td>
		                                            <td><%=crlist.get(i).getReviewContents()%></td>
		                                            <td><%=crlist.get(i).getReviewDate()%></td>
		                                            <td><a href="#">X</a></td>
		                                        </tr>
	                                        <%
	                                    		}
	                                        %>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
	                        <div class="panel-footer">
	                            	♥ 현재까지 고객님들에게 달린 리뷰는 <strong><%=crlist.size()%></strong>개 입니다.
	                        </div>
	                    </div>
	                </div>
	            </div>
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
	    
	</body>
</html>