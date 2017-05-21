<%@page import="kdb.foodtruck.dto.CustomerReview"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="kdb.foodtruck.dto.Menu" %>
<%@ page import="kdb.foodtruck.dao.FoodtruckDAO" %>
<%@ page import="kdb.foodtruck.dto.Foodtruck" %>
<%@ page import="kdb.foodtruck.dto.Owner" %>
<%@ page import="kdb.foodtruck.dto.Event" %>
<%@ page import="kdb.foodtruck.dto.CustomerReview"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    
    

	<% 
	
	List<Menu> 	menulist 	= (List<Menu>) request.getAttribute("menulist");
	Foodtruck 	foodtruck 	= (Foodtruck) request.getAttribute("foodtruck");
	Owner 		owner 		= (Owner) request.getAttribute("owner");
	Event 		event 		= (Event) request.getAttribute("event");
	
	%>

	<script type="text/javascript">
	
	window.onload=googleapisView;
	
function googleapisView() {
    var lat = "<%= foodtruck.getFoodTruckAddrLat() %>"; // 위도
    var lng = "<%= foodtruck.getFoodTruckAddrAlt() %>"; // 경도
    var geocode = "http://maps.googleapis.com/maps/api/geocode/json?latlng="+lat+","+lng+"&sensor=false";
    jQuery.ajax({
        url: geocode,
        type: 'POST',
           success: function(myJSONResult){
                    if(myJSONResult.status == 'OK') {
                        var tag = "";
                        var i;
                        for (i = 0; i < myJSONResult.results.length - (myJSONResult.results.length-1); i++) {
                          tag += "주소 : " +myJSONResult.results[i].formatted_address+" <br />";
                        }
                        document.getElementById("message").innerHTML =  tag;
                    } else if(myJSONResult.status == 'ZERO_RESULTS') {
                        alert("지오코딩이 성공했지만 반환된 결과가 없음을 나타냅니다.\n\n이는 지오코딩이 존재하지 않는 address 또는 원격 지역의 latlng을 전달받는 경우 발생할 수 있습니다.")
                    } else if(myJSONResult.status == 'OVER_QUERY_LIMIT') {
                        alert("할당량이 초과되었습니다.");
                    } else if(myJSONResult.status == 'REQUEST_DENIED') {
                        alert("요청이 거부되었습니다.\n\n대부분의 경우 sensor 매개변수가 없기 때문입니다.");
                    } else if(myJSONResult.status == 'INVALID_REQUEST') {
                        alert("일반적으로 쿼리(address 또는 latlng)가 누락되었음을 나타냅니다.");
                    }
            },
    });
 
}

</script>
	
	<script>
		function initialize() {

			var Y_point			= "<%= foodtruck.getFoodTruckAddrLat() %>"		// 1
			var X_point 	    = "<%= foodtruck.getFoodTruckAddrAlt() %>"
			// 2

			var zoomLevel		= 14;						// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼

			var markerTitle		= "<%= foodtruck.getFoodTruckName()  %>";				// 3
			var markerMaxWidth	= 300;						// 마커를 클릭했을때 나타나는 말풍선의 최대 크기

			// 말풍선 내용
			var contentString	= '<div>' +
			'<h2><%= foodtruck.getFoodTruckName()  %></h2>'+
			'</div>';     //3'

			var myLatlng = new google.maps.LatLng(Y_point, X_point);
			
			var mapOptions = {
								zoom: zoomLevel,
								center: myLatlng,
								mapTypeId: google.maps.MapTypeId.ROADMAP
			}
			var map = new google.maps.Map(document.getElementById('map_view'), mapOptions);

			var marker = new google.maps.Marker({
													position: myLatlng,
													map: map,
													title: markerTitle
			});

			var infowindow = new google.maps.InfoWindow(
														{
															content: contentString,
															maxWidth: markerMaxWidth
														}
			);

			google.maps.event.addListener(marker, 'click', function() {
				infowindow.open(map, marker);
			});
		}
	</script>


    <title>상세메뉴</title>
    

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/half-slider.css" rel="stylesheet">
    
    <!-- ajax -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    
    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.../js/1.4.2/respond.min.js"></script>
    <![endif]-->
     <style>
    .portfolio-item {
       height: 300px;
    }
    </style>

</head>

<body onload="initialize()" >

	 <%@include file="./header.jsp"%>
	
    
    <!-- Modal HTML -->
    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>
    
    
    <!-- Modal HTML -->
    <div id="myModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>

    <!-- Half Page Image Background Carousel Header -->
    <header id="myCarousel" class="carousel slide">
		
    <!-- Wrapper for Slides --> 
        <div class="carousel-inner">
            <div class="item active">
                <!-- Set the first background image using inline CSS below. -->
                <%
                	String foodtruckImg = foodtruck.getFoodTruckPic();
                	String img="";
    		
    				if(foodtruckImg.isEmpty() || foodtruckImg==null || foodtruckImg=="") {
                		img = "img/default/700400.png";
    				} else {
    					img = "upload/"+foodtruckImg;
    				}
                %>
               <div class="fill" ><img src="<%=img %>" width=100%  class="blur" >
                </div>
                <div class="carousel-caption">
                    <h2> <%= foodtruck.getFoodTruckName() %></h2>
                    <p> <%= foodtruck.getFoodTruckIntro() %></p>
                    <%  if( session.getAttribute("id") != null ) { %>
                    <span class="glyphicon glyphicon-heart" id="favorite" > 좋아요 </span>
                    <% } %>
                </div>
            </div>
        </div>
	 </header>
    
    <!-- Page Content -->
    <div class="container">

		<!-- 위치 -->
        <div class="row">
            <div class="col-lg-12">
            	<h2 class="page-header">위치</h2>
                
                
                <div id="message"></div>

                                
            </div>
        </div>
        
        <!-- 지도 -->
	    <section id="contact" class="map">
			<div id="map_view" style="width:1100px; height:300px;"></div>
	    </section>
	    
	    <!-- 영업 시간 -->
	    <div class="row">
	    	<div class="col-lg-12">
                <h2 class="page-header">정보</h2>
                <div class="info-box">
                	<img class="icon" src="img/icon/host.png"/>
                	<span> 푸드트럭 주인: <b> <%= owner.getOwnerName() %></b></span>
                </div><br/>
                <div class="info-box">
              		<img class="icon" src="img/icon/phone.png"/>
              		<span> 연락처: <b> <%= owner.getOwnerPnum() %></b></span>
                </div><br/>
                <div class="info-box">
                	<img class="icon" src="img/icon/time.png"/>
                	<span> 영업시간: <b> <%= foodtruck.timeToString(foodtruck.getFoodTruckOpen()) %> ~ <%= foodtruck.timeToString(foodtruck.getFoodTruckClose()) %></b></span>
                </div>
            </div>
        </div>
        
        <!-- 메뉴 -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">메뉴</h2>
            </div>
            
            <% for (int i=0; i < menulist.size(); i++) { %>
            <div class="col-lg-4 col-sm-6 text-center">
            	<p class="crop">
                	<img class="img-circle img-responsive img-center" src="upload/<%=menulist.get(i).getMenuPic() %>" alt="">
                </p>
                <h3> <%= menulist.get(i).getMenuName() %>
                    <small> <%= menulist.get(i).getMenuPrice() %></small>
                </h3>
                <p> <%= menulist.get(i).getMenuExplain() %></p>
            </div>
            
            <% } %>
            
        </div>
        
       <!-- 리뷰 & 좋아요 -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">리뷰</h2>
			</div>
			<div class="form-group"   id="del">
			<div class="col-lg-12">
				<label class="control-label">푸드트럭을 이용한 후기를 남겨주세요</label><br />

				<!-- 좋아요, 공유 버튼 -->
				<script>
					window.fbAsyncInit = function() {
						FB.init({
							appId : '686154781519871',
							xfbml : true,
							version : 'v2.4'
						});
					};

					(function(d, s, id) {
						var js, fjs = d.getElementsByTagName(s)[0];
						if (d.getElementById(id)) {
							return;
						}
						js = d.createElement(s);
						js.id = id;
						js.src = "//connect.facebook.net/en_US/sdk.js";
						fjs.parentNode.insertBefore(js, fjs);
					}(document, 'script', 'facebook-jssdk'));
				</script>
				<div class="fb-like" data-share="true" data-width="450"
					data-show-faces="true"></div>
				<!-- /좋아요, 공유 버튼 -->

				<!-- 리뷰 등록 -->
				<div class="input-group">
					<form method="post" action="foodtruck?cmd=Reviewadd">
						<table>
							<tr>
								<td><span class="input-group-addon">♥</span></td>
								<td><input type="text" class="form-control" name="review"></td>
								<td><span class="input-group-btn"></span></td>
								<td>
									<input type="hidden" name="id" value="<%=foodtruck.getFoodTruckNum() %>">
									<input type="hidden" name="customerid" value="<%=session.getAttribute("customerNum")%>"> 
									<%  if( session.getAttribute("id") != null ) { %>
                    					<input type="submit" value="등록">
                   					<% } %>
								</td>
							</tr>
						</table>
					</form>

				</div>

				<!-- 리뷰 목록 -->
				<br /> <br />

					<table class="table table-striped table-hover ">
						<thead>
							<tr>
								<th>no.</th>
								<th>작성자</th>
								<th>내용</th>
								<th>작성자날짜</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>

                       <c:forEach items="${requestScope.list2}" var="list"  varStatus="status">
							
							<tr>
							    <td>${status.count}</td>
								<td>${list.customerName}</td>
								<td>${list.reviewContents}</td>
								<td>${list.reviewDate}</td>
								<td>
									<div class="delete">
	
									
									<c:if test="${sessionScope.customerNum != list.customerNum }"></c:if>
									 <c:choose>
									      <c:when test="${sessionScope.customerNum == list.customerNum }">							
											<input type="hidden" name="reviewnum" value="${ list.getReviewNum() }">
											<a href="foodtruck?cmd=Reviewdelete&reviewnum=${ list.getReviewNum() }&id=<%=foodtruck.getFoodTruckNum() %>">삭제</a>
									      </c:when>
									      <c:otherwise>
									      					
											<input type="hidden" name="reviewnum" value="${ list.getReviewNum() }">
											<a id="delete"  class="tablebutton2">삭제</a>
									     	
									      </c:otherwise>
									 </c:choose>
	
									</div>
								</td>
							</tr>
					    </c:forEach>
							
						</tbody>
					</table>
			</div>
		</div>
		</div>
		
         <!-- 프로모션 -->
        
        <div class="row">
	            <div class="col-lg-12">
	                <h2 class="page-header">프로모션 정보</h2>
	            </div>
        	<c:forEach items="${requestScope.eventlist}" var="e">
	            <div class="col-md-5">
	                <h3> ${e.getEventName()}</h3>
	                <h4>기간 : ${e.getEventStart()} ~ ${e.getEventEnd()}</h4>
	                <p> ${e.getEventContents()}</p>
	            </div>
            </c:forEach>
        </div>
        
        <!-- 근처 푸드트럭 -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">근처 푸드트럭</h2>
            </div>
        </div>
        
        <div class="row">
            <div id = distance2 ></div>
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

	<!-- Google Map -->
	<script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>


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

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>
    
    <!-- 근처 푸드트럭 찾기 --> 
    
	<script>

	
	function showPosition() {

	    
	var str="";
		
		$.ajax({
			url : "foodtruck?cmd=RecursiveDetailFormAction",
			dataType:"json",
			data:{"lat" : <%= foodtruck.getFoodTruckAddrLat() %>, "lon" :<%= foodtruck.getFoodTruckAddrAlt() %>},
			success:function(data) {
				console.log(data);
				
				
				$.each(data, function(index, item){
					str += "<div class='col-md-4 col-sm-6 portfolio-item'>";
					str += "<div class='portfolio-hover'>";
					str += "<div class='portfolio-hover-content'>";
					str += "<a href='foodtruck?cmd=TruckDetailForm&id=" + item.foodtrucknum + "'>";
					str += "</div>";
					str += "</div>";
					if(item.foodtruckpic==null || item.foodtruckpic=="")
		                  str += "  <img style='height: 200px; width: 100%; text-align:center;'  src='img/default/700400.png' class='img-responsive' alt=''>";
		               else
		                  str += "  <img style='height: 200px; width: 100%; text-align:center;' src='upload/" + item.foodtruckpic  + "' class='img-responsive' alt=''>";
					str += "</a>";
					str += "<div class='portfolio-caption'>";
					str += "<h4>";
					str += item.foodtruckname;
					str += "</h4>";
					str += " <p class='text-muted'>";
					str += item.distance;
					str += "km";
					str += "</p>";
					str +="</div>";
					str +="</div>";
					
					
					
				});
				
			//	console.log(str);
				$("#distance2").html($("#distance2").html() + str);
				
			},
			error: function() {
				console.log("gggg")
			}
		})
	}
	
	
	
	/* $(document).ready(function() {
		showPosition();
		
		$("#del").on("click", "#delete", function() {
			alert("권한이 없습니다!");
		});
	}); */
	
	$(document).ready(function() {
		showPosition();
		
		$("#del").on("click", "#delete", function() {
			alert("권한이 없습니다!");
		});
		
		$("#favorite").click(function() {
			$.ajax({
				url : "foodtruck?cmd=TruckFavoriteUpdate",
				data : "id=" + "<%=foodtruck.getFoodTruckNum()%>",
				success : function() {
					
					$("#favorite").addClass("text-danger glyphicon glyphicon-heart");
				},
				
				error : function() {
					
				}
				
			});
		});
	});
	
	</script>

</body>

</html>
