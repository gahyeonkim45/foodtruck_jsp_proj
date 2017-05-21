<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kdb.foodtruck.dto.Search"%>
<%@page import="kdb.foodtruck.dto.CustomerReview"%>
<%@page import="kdb.foodtruck.dto.Foodtruck"%>
<%@page import="kdb.foodtruck.dto.Message"%>
<%@page import="org.json.simple.JSONArray"%> 
<%@page import="org.json.simple.JSONObject"%> 
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	        
	    <title>굿모닝푸드트럭 관리자</title>
	    
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
	    List<Message> mrlist = (List<Message>)request.getAttribute("mrlist");
	    List<Message> mlist = (List<Message>)request.getAttribute("mlist");
	    List<CustomerReview> crlist = (List<CustomerReview>) request.getAttribute("crlist");
	    List<CustomerReview> crNewlist = (List<CustomerReview>) request.getAttribute("crNewlist");
	    List<Search> slist = (List<Search>) request.getAttribute("slist");
	    
	    Foodtruck foodtruck	= (Foodtruck)request.getAttribute("foodtruck");
	    int like = Integer.parseInt(request.getAttribute("like").toString());
	    
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
	    
	    <!-- HEADER2 START -->
	   <header>
	       <div class="container">
	           <div class="intro-text">
	               <div class="intro-lead-in"><strong><%=ownerName %></strong>업주님 환영합니다!</div>
	               <div class="intro-heading"><%=foodtruck.getFoodTruckName()%> <small>푸드트럭</small></div>
	               
	           </div>
	       </div>
	   </header>
	    <!-- HEADER2 END -->
	    
	    <!-- MENU SECTION START -->
	    <section class="menu-section">
	        <div class="container">
	            <div class="row">
	                <div class="col-md-12">
	                    <div class="navbar-collapse collapse ">
	                        <ul id="menu-top" class="nav navbar-nav navbar-right">
	                            <li><a class="menu-top-active" href="foodtruck?cmd=Owner">Today</a></li>
	                            <li><a href="foodtruck?cmd=OwnerCustomerForm">고객평가</a></li>
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
	    
	    <!-- CONTENT-WRAPPER SECTION START-->
	    <div class="content-wrapper">
	        <div class="container">
	        
	            <div class="row">
	                <div class="col-md-12">
	                    <h4 class="page-head-line">최신정보</h4>
	                </div>
	            </div>
	            
	            <div class="row">
	                <div class="col-md-12">
	                    <div class="alert alert-success">
	                    <%
	                    	if(crNewlist.size()!=0) {
	                    %>
	                       최근 한시간 동안 고객님들로부터 <strong><%=crNewlist.size()%></strong> 개의 리뷰가 달렸습니다.
                       <%
                    		} else {
               			%>
               				최근에 고객님들로부터 달린 리뷰가 없습니다.
               			<%
                    		}
                       %>
	                    </div>
	                </div>
	
	            </div>
	            
	            <div class="row">
	                 <div class="col-md-3 col-sm-3 col-xs-6">
	                    <div class="dashboard-div-wrapper bk-clr-one">
	                        <i  class="fa fa-venus dashboard-div-icon" ></i>
	                        <div class="progress progress-striped active">
								<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
								</div>
	                        </div>
	                         <h5><strong>최신 리뷰 수</strong>(<%=crNewlist.size() %>)</h5>
	                    </div>
	                </div>
	                 <div class="col-md-3 col-sm-3 col-xs-6">
	                    <div class="dashboard-div-wrapper bk-clr-two">
	                        <i  class="fa fa-edit dashboard-div-icon" ></i>
	                        <div class="progress progress-striped active">
							  	<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
							  	</div>                      
							</div>
	                        <h5><strong>총 좋아요 수</strong>(<%=like%>)</h5>
	                    </div>
	                </div>
	                 <div class="col-md-3 col-sm-3 col-xs-6">
	                    <div class="dashboard-div-wrapper bk-clr-three">
	                        <i  class="fa fa-cogs dashboard-div-icon" ></i>
		                        <div class="progress progress-striped active">
								<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
								</div>                    
							</div>
	                         <h5><strong>총 검색 수</strong>(<%=slist.size() %>)</h5>
	                    </div>
	                </div>
	                <div class="col-md-3 col-sm-3 col-xs-6">
	                    <div class="dashboard-div-wrapper bk-clr-four">
	                        <i  class="fa fa-bell-o dashboard-div-icon" ></i>
	                        <div class="progress progress-striped active">
						  	<div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
						  	</div>                       
							</div>
	                         <h5><stong>최근 메시지 수</stong>(<%=mrlist.size() %>)</h5>
	                    </div>
	                </div>
	
	            </div>
	           
	            <div class="row">
	                <div class="col-md-6">
	                      <div class="notice-board">
	                        <div class="panel panel-default">
	                            <div class="panel-heading">
	                           		최근 리뷰 목록
	                                <div class="pull-right" >
	                                    <div class="dropdown">
										  <button class="btn btn-success dropdown-toggle btn-xs" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
										    <span class="glyphicon glyphicon-cog"></span>
										    <span class="caret"></span>
										  </button>
										  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
										    <li role="presentation"><a role="menuitem" tabindex="-1" href="foodtruck?cmd=OwnerCustomerForm">전체 리뷰</a></li>
										    <li role="presentation"><a role="menuitem" tabindex="-1" href="foodtruck?cmd=TruckDetailForm&id=<%=foodtruck.getFoodTruckNum()%>">고객용 화면</a></li>
										  </ul>
										</div>
	                                </div>
	                            </div>
	                            <div class="panel-body">
	                                <ul >
	                                <!-- label label-warning  / label label-info / label label-success / -->
	                                <%
	                                	for(int i=0; i<crNewlist.size(); i++) {
	                                %>
	                                    <li>
	                                        <a href="#">
		                                     	<span class="glyphicon glyphicon-comment  text-warning" ></span>  
		                                          <strong><%=crNewlist.get(i).getCustomerName()%> : </strong><%=crNewlist.get(i).getReviewContents() %>
		                                        <span class="label label-info" ><%=crNewlist.get(i).getReviewDate()%></span>
	                                        </a>
	                                    </li>
	                                <%
	                                }
	                                %>
	                                </ul>
	                            </div>
	                            <div class="panel-footer">
	                                <a href="foodtruck?cmd=Owner" class="btn btn-default btn-block"> <i class="glyphicon glyphicon-repeat"></i>  새로 고침</a>
	                            </div>
	                        </div>
	                    </div>
	                    <hr />
	                    
	                     <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>No.</th>
                                            <th>Date</th>
                                            <th>키워드</th>
                                            <th>횟수</th>
                                            <th>검색화면</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<%
                                    		for(int i=0; i<slist.size(); i++) {
                                    	%>
	                                        <tr>
	                                            <td><%=i+1 %></td>
	                                            <td><%=slist.get(i).getSearchdate()%></td>
	                                            <td><label class="label label-info"><%=slist.get(i).getSearchword() %></label>
	                                            </td>
	                                            <td><%=slist.get(i).getSearchcount() %></td>
	                                            <td><a href="foodtruck?cmd=searchlist&query=<%=slist.get(i).getSearchword() %>" class="btn btn-xs btn-danger" >Go!</a></td>
	                                        </tr>
                                        <%
                                    		}
                                        %>
                                    </tbody>
                                </table>
                           </div>
	                </div>
	                
	                <!-- MAIL SECTION START -->
	                <div class="col-md-6">
	                    <div class="alert alert-danger">
	                    <%
	                    	if(mrlist.size()!=0) {
	                    %>
	                        	가장 최근에 <strong><%=mrlist.get(0).getMsgsendername() %></strong>업주님으로부터 메시지가 왔습니다.
                      	<%
	                    	} else {
	                    %>
	                    		최근에 온 메시지가 없습니다.
	                    <%
	                    	}
                      	%>
	                    </div>
	                    
	                    <hr />
	                    
	                    <!--   MAIL LIST START  -->
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
	                            	최근 메일 목록
	                            	<div class="pull-right" >
	                            	<a data-toggle="modal" data-target="#mailMore" class="btn btn-info btn-xs">전체 메일 보기</a>
	                            	</div>
	                        </div>
	                        <div class="panel-body">
	                            <div class="table-responsive">
	                                <table class="table">
	                                    <thead>
	                                        <tr>
	                                            <th>NO.</th>
	                                            <th>제목</th>
	                                            <th>전송자</th>
	                                            <th>날짜</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>
	                                    	<%
	                                    		boolean isMany = false;
	                                    		for(int i=0; i<mrlist.size(); i++) {
	                                    			if(i==3) {
	                                    				isMany = true;
	                                    				break;
	                                    			}
	                                    	%>
		                                        <tr>
		                                            <td><%=i+1 %></td>
		                                            <!-- <a href="foodtruck?cmd=LogoutForm" data-target="#myModal" data-toggle="modal"> -->
		                                            <td>
		                                            	<a href="foodtruck?cmd=MsgDetailForm&msgid=<%=mrlist.get(i).getMsgnum()%>" data-target="#extraModal" data-toggle="modal">
		                                            		<%=mrlist.get(i).getMsgtitle() %>
		                                            	</a>
		                                            </td>
		                                            <td><%=mrlist.get(i).getMsgsendername() %> 업주님</td>
		                                            <td><%=mrlist.get(i).getMsgdate()%></td>
		                                        </tr>
	                                        <%
	                                    		}
	                                        %>
	                                    </tbody>
	                                </table>
	                            </div>
	                        </div>
							<%
								if(isMany) {
							%>	
                            <div class="panel-footer">
                                <a data-toggle="modal" data-target="#mailMore" class="btn btn-default btn-block"> 더 보기 </a>
                            </div>        
							<%
								}
							%>        
	                    </div>
	                    <!-- MAIL LIST END  -->
	                    
	                    <hr/>
	                    
	                    <!-- SEND MAIL START -->
	                    <div class="Compose-Message">               
		                	<div class="panel panel-success">
			                    <div class="panel-heading">
			                       	 메시지 보내기
			                    </div>
			                    <form action="foodtruck?cmd=SendMsg" method="post" class="panel-body">
			                        <label>받는이 : </label>
			                        <input name="receiver" type="text" class="form-control" />
			                        <label>메시지 제목 :  </label>
			                        <input name="title" type="text" class="form-control" />
			                        <label>메시지 내용 : </label>
			                        <textarea name="content" rows="3" class="form-control"></textarea>
			                        <hr />
			                        <button id="sendMsg" type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-envelope"></span> 메시지 전송 </button>&nbsp;
			                      	<button id="cancleMsg" type="reset" class="btn btn-success"><span class="glyphicon glyphicon-tags"></span>  전송 취소 </button>
			                    </form>
			                    <div class="panel-footer text-muted">
			                        <strong>Note : </strong>보낸 메시지는 그대로 전송되오니 스팸 메일은 삼가주시길 바랍니다.
			                    </div>
		                	</div>
                   		</div>
                   		<!-- SEND MAIL END -->
              		</div>
              		<!-- MAIL SECTION END-->
              		
          		</div>
      		</div>
  		</div>
	    <!-- CONTENT-WRAPPER SECTION END-->
	    
	    <!-- FOOTER SECTION START-->
	    <footer>
	        <div class="container">
	            <div class="row">
	                <div class="col-md-12">
	                    &copy; 2015 YourCompany | By : <a href="http://www.designbootstrap.com/" target="_blank">DesignBootstrap</a>
	                </div>
	
	            </div>
	        </div>
	    </footer>
	    <!-- FOOTER SECTION END-->
	    
	    <!--  Modals-->
        <div class="modal fade" id="mailMore" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
             <div class="modal-dialog">
	             <div class="modal-content">
	             	<div class="modal-header">
	             	받은 메시지함
	             	</div>
	                 <div class="modal-body">
	                     <!-- 내용물 -->
                         <div class="panel-group" id="accordion">
                         	<%
                         		for(int i=0; i<mlist.size(); i++) {
                         	%>
                             <div class="panel panel-default">
                                 <div class="panel-heading">
                                     <h4 class="panel-title">
                                         <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne<%=i %>" class="collapsed">
                                         <%=i+1 %>. <strong><%=mlist.get(i).getMsgtitle() %></strong>(<%=mlist.get(i).getMsgsendername()%>) <small><%=mlist.get(i).getMsgdate() %></small>
                                         </a>
                                     </h4>
                                 </div>
                                 <div id="collapseOne<%=i %>" class="panel-collapse collapse" style="height: 0px;">
                                     <div class="panel-body">
                                         <%=mlist.get(i).getMsgcontent() %>
                                     </div>
                                     <div class="panel-footer">
                    					<a href="foodtruck?cmd=DeleteMsg&msgnum=<%=mlist.get(i).getMsgnum()%>" class="btn btn-danger btn-xs">삭제</a>
                                     </div>
                                 </div>
                             </div>
                             <%
                         		}
                             %>
                         </div>
	                     <!-- /.내용물 -->
	                 </div>
                 </div>
             </div>
         </div>
         <!-- End Modals-->
         
         <!-- Modal HTML START -->
	    <div id="extraModal" class="modal fade">
	        <div class="modal-dialog">
	            <div class="modal-content">
	            </div>
	        </div>
	    </div>
	    <!-- Modal HTML END -->
	    
	    <!-- JAVASCRIPT AT THE BOTTOM TO REDUCE THE LOADING TIME  -->
	    <!-- 
	    CORE JQUERY SCRIPTS
	    <script src="js/jquery-1.11.1.js"></script> -->
	    
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
