<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal-header">
	<a class="close" data-dismiss="modal">&times;</a>
	<h3>로그인</h3>
</div>
<div class="modal-body">
	<form action="foodtruck?cmd=Login" method="post" class="modal-body">
		<div class="form-group">
			<label class="control-label" for="inputDefault">E-mail</label>
			<input name="email" type="email" class="form-control" id="inputDefault">
		</div>
		<div class="form-group">
			<label class="control-label" for="inputDefault">Password</label>
			<input name="password" type="password" class="form-control" id="inputDefault">
		</div>
		<div class="form-group">
			<label class="control-label" for="facebookLogin"><small>페이스북으로 로그인하기 </small></label>
			<div id="facebookLogin" class="fb-login-button" 
					data-max-rows="1" data-size="small" data-show-faces="false" 
					data-auto-logout-link="false">
			</div> 
	</div>
	</form>
</div>
<div class="modal-footer">
	<a class="btn btn-primary" onclick="$('.modal-body > form').submit();">로그인 완료</a>
	<a class="btn" data-dismiss="modal">닫기</a>
</div>

<script>
  window.fbAsyncInit = function() {
    FB.init({
      appId      : '686154781519871',
      xfbml      : true,
      version    : 'v2.4'
    });
  };

  (function(d, s, id){
     var js, fjs = d.getElementsByTagName(s)[0];
     if (d.getElementById(id)) {return;}
     js = d.createElement(s); js.id = id;
     js.src = "//connect.facebook.net/en_US/sdk.js";
     fjs.parentNode.insertBefore(js, fjs);
   }(document, 'script', 'facebook-jssdk'));
</script>