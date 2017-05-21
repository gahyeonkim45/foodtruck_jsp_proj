<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <title>메뉴 관리</title>
	
	    <!-- Bootstrap Core CSS -->
	    <link href="css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- Custom CSS -->
	    <link href="css/heroic-features2.css" rel="stylesheet">
		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

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
	
	        <!-- Jumbotron Header -->
	        <header class="jumbotron hero-spacer">
	            <h1>메뉴 관리</h1>
	            <p><%=session.getAttribute("id") %>님의 푸드트럭의 메뉴들을 관리해보세요!</p>
	            <p>
	            	<a data-toggle="modal" href="#menuAddModal" class="btn btn-primary">메뉴 추가</a>
	            </p>
	        </header>
	
	        <hr>
	
	        <!-- Title -->
	        <div class="row">
	            <div class="col-lg-12">
	                <h3>메뉴 목록</h3>
	            </div>
	        </div>
	        <!-- /.row -->
	
	        <!-- Page Features -->
	        <div class="row text-center">
				<c:forEach items="${requestScope.menu}" var="a">
	            <div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                    <img src="http://placehold.it/800x500" alt="">
	                    <div class="caption">
	                        <h3>${a.menuName}</h3>
	                        <p>${a.menuExplain}</p>
	                        <p>
	                        	<!-- href="./page/login.jsp" data-target="#myModal" data-toggle="modal" -->
	                            <a data-toggle="modal" href="foodtruck?cmd=MenuUpdateForm&menuId=${a.menuNum}" data-toggle="modal" data-target="#menuUpdateModal" class="btn btn-primary">메뉴 수정</a>
	                            <a data-toggle="modal" href="foodtruck?cmd=MenuInfoForm&menuId=${a.menuNum}" data-toggle="modal" data-target="#menuDetailModal" class="btn btn-primary">메뉴 상세보기</a>
	                        </p>
	                    </div>
	                </div>
	            </div>
				</c:forEach>
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
	        </footer>
	
	    </div>
	    <!-- /.container -->
		
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

