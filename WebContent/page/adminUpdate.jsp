<%@page import="kdb.foodtruck.dto.Foodtruck"%>
<%@page import="kdb.foodtruck.dto.Owner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="utf-8" />
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	    <meta name="description" content="" />
	    <meta name="author" content="" />
	    
	    <!--[if IE]>
	        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	        <![endif]-->
	        
	    <title>관리자 정보 수정</title>
	    
	    <!-- FONT AWESOME ICONS  -->
    	<link href="css/font-awesome.css" rel="stylesheet" />
	    
	    <!-- BOOTSTRAP CORE STYLE  -->
	    <link href="css/bootstrap.min.css" rel="stylesheet" />
	    
	    <!-- CUSTOM STYLE  -->
	    <link href="css/admin-main.css" rel="stylesheet" />
	    
	    <!-- ajax -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="http://maps.google.com/maps/api/js?sensor=false"></script>
		<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/themes/flick/jquery-ui.min.css">
	    
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
		Owner owner = (Owner) request.getAttribute("owner");
		Foodtruck foodtruck = (Foodtruck) request.getAttribute("foodtruck");
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
	            	<h1>관리자 정보 수정</h1>
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
	                            <li><a href="foodtruck?cmd=SalesRegisterForm">매출관리</a></li>
	                            <li><a href="foodtruck?cmd=MenuList">메뉴관리</a></li>
	                            <li><a href="foodtruck?cmd=Eventlist">이벤트관리</a></li>
	                            <li><a class="menu-top-active" href="foodtruck?cmd=OwnerUpdateForm">정보수정</a></li>
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
	        
	        	<!-- 제목 -->
		        <div class="row">
                    <div class="col-md-6">
                        <h1 class="page-head-line">사업자 정보 수정 </h1>
                    </div>
                    <div class="col-md-6">
                        <h1 class="page-head-line">푸드트럭 정보 수정 </h1>
                    </div>
                </div>
                <!-- /.제목 -->
                
                <!-- 내용 -->
                <div class="row">
                	<form action="foodtruck?cmd=OwnerUpdate" method="post" enctype="multipart/form-data">
	                	<!-- 사업자 정보 수정 -->
	                    <div class="col-md-6">
	                        <div class="panel panel-default">
		                        <div class="panel-heading">
		                           	사업자 정보
		                        </div>
		                        <div class="panel-body">
			                       	
		                      			<div class="form-group">
											<label for="exampleInputFile">영업 신고서</label>
										    <input name="OwnerRpic" id="image" type="file" id="exampleInputFile" />
										    <p class="help-block">사진형식은 jpg, gif, png만 가능합니다.</p>
											<input name="oldimage1" type="hidden" value="<%=owner.getOwnerRpic()%>">
										</div>
										<div class="form-group">
											<div id="image_preview">
												<a></a>
												<img style="width:50%;" src="upload/jinsol.jpg" />
											</div>
										</div>
										<hr/>
										  <div class="form-group has-success">
	                                            <label class="control-label" for="success">이메일</label>
	                                            <input name="OwnerEmail" type="email" class="form-control" id="success" value="<%=owner.getOwnerEmail() %>" readonly/>
	                                      </div>
										  <div class="form-group has-success">
	                                            <label class="control-label" for="success">비밀번호</label>
	                                            <input name="OwnerPwd" type="password" class="form-control" value="<%=owner.getOwnerPwd() %>" id="success" />
	                                      </div>
	                                      <div class="form-group has-error">
	                                          <label class="control-label" for="error">비밀번호 다시 확인</label>
	                                          <input type="text" class="form-control" id="error" />
	                                      </div>
	                                      <hr/>
	                                      <div class="form-group">
										    <label for="exampleInputEmail1">이름</label>
										    <input name="OwnerName" type="text" id="exampleInputEmail1" class="form-control" value="<%=owner.getOwnerName()%>"/>
										  </div>
										  <div class="form-group">
										    <label for="exampleInputEmail1">전화번호</label>
										    <input name="OwnerPnum" type="tel" id="exampleInputEmail1" class="form-control" value="<%=owner.getOwnerPnum() %>" />
										  </div>
										  <div class="form-group">
										    <label for="exampleInputEmail1">사업자 번호</label>
										    <input name="OwnerReg" type="text" id="exampleInputEmail1" class="form-control" value="<%=owner.getOwnerReg() %>" readonly/>
										  </div>
										  <div class="form-group">
										    <label for="exampleInputEmail1">주소</label>
										    <%
										    	String addr = owner.getOwnerAddr();
										    	if(addr==null) {
										    		addr = "주소가 등록되지 않았습니다.";
										   	%>
										   		<input name="OwnerAddr" type="text" id="exampleInputEmail1" class="form-control" placeholder="<%=addr%>" />
										   	<%
										    	} else {
										    		
										   	%>
										   		<input name="OwnerAddr" type="text" id="exampleInputEmail1" class="form-control" value="<%=addr %>" />
										   	<%
										    	}
										    %>
										  </div>
									
		                      		<hr />
		                          </div>
	                         </div>
	                    </div>
	                    <!-- /.사업자 정보 수정 -->
	                    
	                    <!-- 푸드트럭 정보 수정 -->
	                    <div class="col-md-6">
	                        <div class="panel panel-default">
		                        <div class="panel-heading">
		                           	푸드트럭 정보
		                        </div>
		                        <div class="panel-body">
		                      		
		                      			<div class="form-group">
											<label for="exampleInputFile">푸드트럭 사진</label>
										    <input name="FoodtruckPic" id="image2" type="file" id="exampleInputFile" />
										    <p class="help-block">사진형식은 jpg, gif, png만 가능합니다.</p>
											<input name="oldimage2" type="hidden" value="<%=foodtruck.getFoodTruckPic()%>">
										</div>
										<div class="form-group">
											<div id="image_preview">
												<a></a>
												<img style="width:100%;" src="upload/<%=foodtruck.getFoodTruckPic() %>" />
											</div>
										</div>
										<hr/>
		                                  <div class="form-group has-warning">
		                                      <label class="control-label" for="warning">푸드트럭 이름</label>
		                                      <input name="FoodtruckName" type="text" class="form-control" id="warning" value="<%=foodtruck.getFoodTruckName()%>"/>
		                                  </div>
		                                  <div class="form-group">
	                                           <label>푸드트럭 종류</label>
	                                           <select name="TypeNum" class="form-control">
	                                           <%
	                                           		String[] type = {"분식", "식사류", "디저트류", "음료", "기타"};
	                                           		String select = "";
	                                           		for(int i=0; i<5; i++) {
	                                           			if((i+1) == foodtruck.getFoodTruckTypenum()) {
	                                           				select = "selected";
	                                           			} else {
	                                           				select = "";
	                                           			}
	                                           %>
	                                               <option value="<%=i+1%>" <%=select%>><%=type[i]%></option>
	                                            <%
	                                            
	                                           		}
	                                            %>
	                                           </select>
	                                      </div>
										  <div class="form-group">
										    <label for="exampleInputEmail1">푸드트럭 소개</label>
										    <input name="Intro" type="text" class="form-control" id="exampleInputEmail1" value="<%=foodtruck.getFoodTruckIntro()%>"></textarea>
										  </div>
		                                  <hr/>
										  <div class="form-group">
										    <label for="exampleInputEmail1">주소</label>
										    <input name="FoodtruckAddr" type="text" id="exampleInputEmail1" class="form-control" value="<%=foodtruck.getFoodTruckAddr() %>" />
										    <input type="hidden" name="Addrlat" value="<%=foodtruck.getFoodTruckAddrLat()%>">
											<input type="hidden" name="Addralt" value="<%=foodtruck.getFoodTruckAddrAlt()%>">
										  </div>
										  <div class="form-group">
										    <label for="exampleInputEmail1">오픈 시간 </label>
										    <input name="Open" type="datetime" id="exampleInputEmail1" class="form-control" value="<%=foodtruck.getFoodTruckOpen() %>" />
										  </div>
										  <div class="form-group">
										    <label for="exampleInputEmail1">마감 시간 </label>
										    <input name="Close" type="datetime" id="exampleInputEmail1" class="form-control" value="<%=foodtruck.getFoodTruckClose() %>" />
										  </div>
		                      		<hr />

		                        </div>
	                        	<div class="panel-footer">
									<button type="button" class="btn btn-danger" onClick="memberChk()">관리자 정보 수정 완료</button>
									<button type="reset" class="btn btn-danger">취소</button>
	                        	</div>
	                        </div>
	                    </div>
	                    <!-- /.푸드트럭 정보 수정 -->
	               </form>
                </div>
                <!-- /.내용 -->
        	</div>
        </div>
	    
	    
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
	    
	    <!--   <!-- jQuery Library -->
		<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>

		<!-- jQuery UI Library -->
		<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
	    
	    
		<!-- 자바 스크립트 -->
		<script type="text/javascript">
			/** 
			onchange event handler for the file input field.
			It emplements very basic validation using the file extension.
			If the filename passes validation it will show the image using it's blob URL and will hide the input field and show a delete button to allow the user to remove the image
			 */
	
			$('#image').on('change', function() {
	
				ext = $(this).val().split('.').pop().toLowerCase(); //확장자
	
				//배열에 추출한 확장자가 존재하는지 체크
				if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
					resetFormElement($(this)); //폼 초기화
					window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
				} else {
					file = $('#image').prop("files")[0];
					blobURL = window.URL.createObjectURL(file);
					$('#image_preview img').attr('src', blobURL);
					$('#image_preview img').attr('width', 600);
					$('#image_preview img').attr('height', 300);
					$('#image_preview').slideDown(); //업로드한 이미지 미리보기 
				}
			});
	
			/**
			onclick event handler for the delete button.
			It removes the image, clears and unhides the file input field.
			 */
			$('#image_preview a').bind('click', function() {
				resetFormElement($('#image'));
				$(this).parent().slideUp(); //미리 보기 영역 감춤
				return false; //기본 이벤트 막지
			});
	
			
			$('#image2').on('change', function() {
	
				ext = $(this).val().split('.').pop().toLowerCase(); //확장자
	
				//배열에 추출한 확장자가 존재하는지 체크
				if ($.inArray(ext, [ 'gif', 'png', 'jpg', 'jpeg' ]) == -1) {
					resetFormElement($(this)); //폼 초기화
					window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
				} else {
					file = $('#image2').prop("files")[0];
					blobURL = window.URL.createObjectURL(file);
					$('#image_preview2 img').attr('src', blobURL);
					$('#image_preview2 img').attr('width', 600);
					$('#image_preview2 img').attr('height', 300);
					$('#image_preview2').slideDown(); //업로드한 이미지 미리보기 
				}
			});
	
			/**
			onclick event handler for the delete button.
			It removes the image, clears and unhides the file input field.
			 */
			$('#image_preview2 a').bind('click', function() {
				resetFormElement($('#image2'));
				$(this).parent().slideUp(); //미리 보기 영역 감춤
				return false; //기본 이벤트 막지
			});
		</script>

		<script>
			function register(frm) {
				var result = geoCode();	
				return false;
			}
			
			function geoCode() {
				
				var faddr = document.frm.FoodtruckAddr.value ;
				var geocoder;
				geocoder = new google.maps.Geocoder();
				geocoder.geocode( { 'address': faddr}, function(results, status) {
					if (status == google.maps.GeocoderStatus.OK) {
						var faddr_lat = results[0].geometry.location.lat();	//위도
						var faddr_lng = results[0].geometry.location.lng();	//경도
						
						document.frm.Addrlat.value = faddr_lat;
						document.frm.Addralt.value = faddr_lng;
						document.frm.submit();
						
						return true;
						
					} else {
						var faddr_lat = "";
						var faddr_lng = "";
						alert("주소가 맞지 않습니다.");
						
						return false;
					}
				});
			}
			
			
			
			/* 회원가입폼 - 데이터 유무 체크*/
			function memberChk()
			{
			 var check = document.frm;

			 if (check.OwnerPwd.value == "") {
			  alert("비밀번호를 입력하세요");
			  check.OwnerPwd.focus();
			  return false;
			 }

			 if (check.OwnerPwdCheck.value == "") {
			  alert("비밀번호를 다시한번 입력해주세요");
			  check.OwnerPwdCheck.focus();
			  return false;
			 }

			 if (check.OwnerPwd.value != check.OwnerPwdCheck.value) {
			  alert("비밀번호가 다릅니다.");
			  check.OwnerPwd.value = "";
			  check.OwnerPwdCheck.value = "";
			  check.OwnerPwd.focus();
			  return false;
			 }

			/* 폼체크를 모두 통과하면 폼을 submit 한다. */ 
			check.submit();
			}
			</script>
	</body>
</html>