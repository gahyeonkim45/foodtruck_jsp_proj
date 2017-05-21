<%@page import="kdb.foodtruck.dto.Foodtruck"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

	<head>
	
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <title>푸드 트럭 전체 보기</title>
	
	    <!-- Bootstrap Core CSS -->
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- Custom CSS -->
	    <link href="css/3-col-portfolio.css" rel="stylesheet">
	    
	    <!-- ajax -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    
	    <!-- Custom Fonts -->
	    <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
	    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
	    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
	    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>
	
	    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	    <!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
	    
	
	</head>

	<body>
	
		<%@include file="./header.jsp"%>
	    
	    <!-- Modal HTML -->
	    <div id="myModal" class="modal fade">
	        <div class="modal-dialog">
	            <div class="modal-content">
	            </div>
	        </div>
	    </div>
	
	    <!-- Page Content -->
	    <div class="container">
	
	        <!-- Page Header -->
	        <div class="row">
	            <div class="col-lg-12">
	                <h1 class="page-header">전체 푸드트럭
	                	<a href="foodtruck?cmd=AllEventFoodtruckList&page=1" class="btn btn-primary">이벤트 중인 푸드트럭 보기</a>
	                </h1>
	            </div>
	        </div>
	        <!-- /.row -->
	        
	        <div class="row">
	        	
	        </div>
	
	        <!-- Projects Row -->
	        <div class="row">
	        <%
            	int pageNum = Integer.parseInt(request.getAttribute("page").toString());
	        	List<Foodtruck> list = (List<Foodtruck>)request.getAttribute("list");
	        	for(int i=(pageNum-1)*9; i<pageNum*9; i++) {
	        
	        %>
		            <div class="col-md-4 portfolio-item">
		                <a href="foodtruck?cmd=TruckDetailForm&id=<%=list.get(i).getFoodTruckNum()%>">
		                    <img style="height: 200px; width: 100%; text-align:center;" class="img-responsive" src="upload/<%=list.get(i).getFoodTruckPic() %>" alt="">
		                </a>
		                <h3 style="text-align:center;">
		                    <a href="foodtruck?cmd=TruckDetailForm&id=<%=list.get(i).getFoodTruckNum()%>"><%=list.get(i).getFoodTruckName()%></a>
		                </h3>
		                <p style="text-align:center;" id="truck-intro"><%=list.get(i).getFoodTruckIntro()%></p>
		            </div>
		    <% 
	        		
		    	} 
		    %>
	        </div>
	        <!-- /.row -->
	
	        <hr>
	
	        <!-- Pagination -->
	        <div class="row text-center">
	            <div class="col-lg-12">
	                <ul class="pagination">
	                	<%
	                    int count = Integer.parseInt(request.getAttribute("count").toString());
	                	%>
	                    <li>
	                        <a href="foodtruck?cmd=AllFoodtruckList&page=1">&laquo;</a>
	                    </li>
	                    <%
	                    
	                 	for(int i=1; i<=count/9+1; i++) {
	                 		if(i==pageNum) {
	                 	%>
	                 		<li class="active">
	                        	<a href="foodtruck?cmd=AllFoodtruckList&page=<%=i%>"><%=i%></a>
	                    	</li>
	                 	<% 
	                 		} else {
	                 	%>
	                 		<li>
	                        	<a href="foodtruck?cmd=AllFoodtruckList&page=<%=i%>"><%=i%></a>
	                   		</li>
	                 	<%
	                 		}
	                 		
	                 	} 
	                 	%>
	                    <li>
	                        <a href="foodtruck?cmd=AllFoodtruckList&page=<%=count/9+1%>">&raquo;</a>
	                    </li>
	                </ul>
	            </div>
	        </div>
	        <!-- /.row -->
	
	        <hr>
	
	        <!-- Footer -->
	        <footer>
	            <div class="row">
	                <div class="col-lg-12">
	                    <p>Copyright &copy; Your Website 2014</p>
	                </div>
	            </div>
	            <!-- /.row -->
	        </footer>
	
	    </div>
	    <!-- /.container -->
	
	    <!-- jQuery -->
	    <script src="js/jquery.js"></script>
	
	    <!-- Bootstrap Core JavaScript -->
	    <script src="js/bootstrap.min.js"></script>
	    
	    <!-- Plugin JavaScript -->
	    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
	    <script src="js/classie.js"></script>
	    <script src="js/cbpAnimatedHeader.js"></script>
	
	    <!-- Contact Form JavaScript -->
	    <script src="js/jqBootstrapValidation.js"></script>
	
	    <!-- Custom Theme JavaScript -->
	    <script src="js/agency.js"></script>
	
	</body>

</html>
