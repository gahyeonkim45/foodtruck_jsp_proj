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
	
	    <title> 검색 결과 </title>
	
	    <!-- Bootstrap Core CSS -->
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- Custom CSS -->
	    <link href="css/3-col-portfolio.css" rel="stylesheet">
	    
	    <!-- ajax -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    
		<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
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
	    <style>
	    
	    #truck-intro {
			overflow : hidden;
		    text-overflow: ellipsis;
		    display: -webkit-box;
		    -webkit-line-clamp: 2;
		    -webkit-box-orient: vertical;
		    height:20px;
		}
		
		.portfolio-item {
			height: 300px;
		}
	    </style>
	    
	
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
	        <br>
	        <br>
	        <!-- 
	            <form method="post" action="foodtruck?cmd=searchlist">
					<h2><input type="text" class="col-md-11" name="query"
						placeholder=" 지역이나 상호를 입력하세요 ! "><input
						class="btn btn-primary btn-lg" type="submit" > 검색</h2>
					</form> -->
				<div class="form-group">
    <div class="input-group">
      <div class="input-group-btn" >
        <button type="button" id="title" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 검색 종류 <span class="caret"></span></button>
        <ul class="dropdown-menu">
          <li><a href="#" id="one">통합 검색</a></li>
          <li><a href="#" id="location">지역 검색</a></li>
          <li><a href="#" id="name">푸드트럭 이름 검색</a></li>
          
          
        </ul>
      </div><!-- /btn-group -->
      <input type="text" id="keyword" class="form-control" placeholder="푸드트럭이나 지역을 입력하세요">
      
      <span class="input-group-btn">
      	<input type="hidden" id="type">
        <button class="btn btn-default" type="submit" id="search"> 검색 </button>
      </span>
    </div><!-- /input-group -->
   </div>
					
	        </div> 
	        <!-- 지도도도도도도도도도도도도도도도도도도 -->
	        
			<div class="row">
			
			
			<div id="map" style="width:100%;height:350px;"></div>
			
		
			</div>
			
			<br>
			
	        <!-- 푸드트럭검색리스트  -->
	        <div class="row">
	        <%
            	
	            List<Foodtruck> list = (List<Foodtruck>) request.getAttribute("list3");
	        String word = request.getAttribute("word").toString();
	        %>
	        <% 		
	        				
						for (int i = 0; i < list.size(); i++) {
							Foodtruck e = list.get(i);
	        %>
	        
		            <div class="col-md-4 portfolio-item">
		            <!-- 추가부분 -->
		                <a href="foodtruck?cmd=TruckDetailForm&id=<%=e.getFoodTruckNum()%>&word=<%=word%>">
		                    <img style="height: 200px; width: 100%; text-align:center;" class="img-responsive" src="upload/<%=e.getFoodTruckPic() %>" alt="">
		                </a>
		                <h3>
		                   <a><%=list.get(i).getFoodTruckName()%></a>
		                </h3>
		                <p id="truck-intro"><%=e.getFoodTruckIntro()%></p>
		            </div>
		    <% 
	        		
		    	} 
		    %>
		    
		    
		    
	        </div> 
	        
	       
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
	
		<!-- 다음 지도 -->
		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=3f668fba3e5de44fe4212102e01fe409"></script>
		

	    <script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new daum.maps.LatLng(37.324965,127.113086), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
             	<% for (int k=0; k < list.size(); k++ ) { 
             	
             	%>

    {
        title: "<%= list.get(k).getFoodTruckName() %>", 
        latlng: new daum.maps.LatLng("<%= list.get(k).getFoodTruckAddrLat() %>","<%= list.get(k).getFoodTruckAddrAlt() %>")
    },
				<% } %>
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new daum.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: positions[i].latlng, // 마커를 표시할 위치
        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
}
/* 
	marker.setMap(map);
	
	
	var iwContent = '<div style="padding:5px;">Hello World! </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    iwPosition = new daum.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

// 인포윈도우를 생성합니다
var infowindow = new daum.maps.InfoWindow({
    position : iwPosition, 
    content : iwContent 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
infowindow.open(map, marker); */
	
	
	

</script>
	
	
		<script>
		
		$(".dropdown-menu li a").click(function(event) {
			event.preventDefault();
			$("#title").text($(this).text())
			$("#type").val($(this).attr("id"));
		});
		
		$("#search").click(function() {
			location.href="foodtruck?cmd=searchlist&type=" + $("#type").val() + "&keyword=" + $("#keyword").val();
		
		
		});
		
		</script>

	</body>


</html>
