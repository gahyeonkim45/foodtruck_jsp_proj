<%@page import="kdb.foodtruck.dto.Menu"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	       
	   <title>메뉴 관리</title>
	   
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
	</head>
	
	<body>
		
		<%
		List<Menu> menu = (List<Menu>) request.getAttribute("menu");
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
	            	<h1>메뉴 관리</h1>
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
	                            <li><a class="menu-top-active" href="foodtruck?cmd=MenuList">메뉴관리</a></li>
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
	        
	        	<!-- 메뉴목록 행 -->
	        	<div class="row">
	        	
	        		<!-- 메뉴목록 헤더 -->
					<div class="col-md-12">
                        <h1 class="page-head-line">메뉴 목록</h1>
                    </div>
                    <!-- /메뉴 목록 헤더 -->
	        
	        		<!-- 메뉴 목록 -->
	        		<%
	        		for(int i=0; i<menu.size(); i++) {
	        		%>
		                <div class="col-md-4 col-sm-4">
		                    <div class="panel panel-default">
		                        <div class="panel-heading">
		                            <%=menu.get(i).getMenuName()%>
		                        </div>
		                        <div class="panel-body">
		                        	<%
		                        		String img = "";
		                        		if(menu.get(i).getMenuPic()!=null) {
		                        			img = "upload/"+menu.get(i).getMenuPic();
		                        		} else {
		                        			img = "img/default/700400.jpg";
		                        		}
		                        	%>
		                            <img style="width: 100%; height: 350px;"src="<%=img %>" alt=""><hr/>
		                            <%=menu.get(i).getMenuExplain() %>
		                        </div>
		                        <div class="panel-footer">
		                            <a href="foodtruck?cmd=MenuUpdateForm&menuId=<%=menu.get(i).getMenuNum()%>" data-toggle="modal" data-target="#menuUpdateModal" class="btn btn-default btn-sm">메뉴 수정</a>
	                            	<a href="foodtruck?cmd=MenuInfoForm&menuId=<%=menu.get(i).getMenuNum()%>" data-toggle="modal" data-target="#menuDetailModal" class="btn btn-default btn-sm">메뉴 상세보기</a>
		                        </div>
		                    </div>
		                </div>
	                <%
	        		}
	                %>
	                <!-- /.메뉴 목록 -->
	                
	            </div>
	            <!-- /.메뉴목록 행 -->
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
	    
	    <!-- 메뉴 추가 모달 -->
		<div id="menuAddModal" class="modal modal-wide fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<a class="close" data-dismiss="modal">&times;</a>
						<h3>메뉴 등록하기</h3>
					</div>
					<div class="modal-body add">
						<form enctype="multipart/form-data" action="foodtruck?cmd=MenuInsert" method="post" class="modal-body">
							<div class="form-group">
								<label class="control-label" for="inputDefault">메뉴 이름</label>
								<input name="name" type="text" class="form-control" id="inputDefault">
							</div>
							<div class="form-group">
								<label class="control-label" for="inputDefault">메뉴 가격</label>
								<input name="price" type="text" class="form-control" id="inputDefault">
							</div>
							<div class="form-group">
								<label class="control-label" for="inputDefault">메뉴 종류</label>
								<input name="type" type="text" class="form-control" id="inputDefault">
							</div>
							<div class="form-group">
						      	<label for="textArea" class="col-lg-2 control-label" for="inputDefault">메뉴 설명</label>
						        <textarea name="explain" class="form-control" rows="3" id="inputDefault"></textarea>
						    </div>
							<div class="form-group">
								<label class="control-label" for="image">메뉴 사진</label>
								<input name="image" type="file" class="form-control" id="image" >
							</div>
							<div class="form-group">
								<div id="image_preview">
									<a></a>
									<img src="#" /><br />
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<a class="btn btn-primary" onclick="$('.add > form').submit();">메뉴 등록 완료</a>
						<a class="btn" data-dismiss="modal">닫기</a>
					</div>
				</div>
			</div><!-- modal-dialog -->
		</div><!-- /메뉴 추가 모달 -->

		<!-- 메뉴 수정 모달 -->
		<div id="menuUpdateModal" class="modal modal-wide fade">
			<div class="modal-dialog">
				<div class="modal-content">
					
				</div>
			</div><!-- modal-dialog -->
		</div><!-- /메뉴 수정 모달 -->
		
		<!-- 메뉴 상세보기 모달 -->
		<div id="menuDetailModal" class="modal modal-wide fade">
			<div class="modal-dialog">
				<div class="modal-content">
					
				</div>
			</div><!-- modal-dialog -->
		</div><!-- /메뉴 상세보기 모달 -->
	    
	    
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
	    
	    <!-- 자바 스크립트 -->
		<script type="text/javascript">
	
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
					$('#image_preview').slideDown(); //업로드한 이미지 미리보기 
					$(this).slideUp(); //파일 양식 감춤
				}
			});
	
			/**
			onclick event handler for the delete button.
			It removes the image, clears and unhides the file input field.
			 */
			$('#image_preview a').bind('click', function() {
				resetFormElement($('#image'));
				$('#image').slideDown(); //파일 양식 보여줌
				$(this).parent().slideUp(); //미리 보기 영역 감춤
				return false; //기본 이벤트 막지
			});
	
			/** 
			 * 폼요소 초기화 
			 * Reset form element
			 * 
			 * @param e jQuery object
			 */
			function resetFormElement(e) {
				e.wrap('<form>').closest('form').get(0).reset();
				//리셋하려는 폼양식 요소를 폼(<form>) 으로 감싸고 (wrap()) , 
				//감싼 폼 ( closest('form')) 에서 Dom요소를 반환받고 ( get(0) ),
				//DOM에서 제공하는 초기화하는 메서드 reset()을 호출
				e.unwrap(); //감싼 <form> 태그를 제거
			}
		</script>
	
	</body>
</html>