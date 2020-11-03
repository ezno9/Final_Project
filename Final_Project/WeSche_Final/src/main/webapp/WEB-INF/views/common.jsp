<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ page import="com.edu.mvc.model.dto.MemberDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberDto mdto = null;
mdto = (MemberDto) session.getAttribute("logindto");
String userid = null;
userid = mdto.getMemberid();

Date date = new Date();
SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd");
String today_server = format.format(date);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	
		var study_state;

		$(document).on('click', '#startBtn', function() {
			var memberid = $('#memberid').val();

			study_state = "start";

			$.ajax({
				type : 'POST',
				url : 'startTimer.do',
				data : {
					memberid : memberid,
					study_state : study_state
				},
				success : function(data) {
					$('.state').show();
		        	$('.first').attr('src', './assets/img/studying.gif');
		        	$('.studying').show().attr('src', './assets/img/studying.gif');
		            $('#total').hide();
		            $('#startBtn').attr('disabled', true);
		            $('#endBtn').attr('disabled', false);

				},
				error : function() {
					alert("시작 실패");
				}
			});
		});

		$(document).on('click', '#endBtn', function() {
			var memberid = $('#memberid').val();

			study_state = "end";

			$.ajax({
				type : 'POST',
				url : 'endNrecordTimer.do',
				data : {
					memberid : memberid,
					study_state : study_state
				},
				success : function(resmap) {
					$('.state').hide();
					$('.studying').hide();
		        	$('#total').hide();
		            $('#startBtn').attr('disabled', false);
		            $('#endBtn').attr('disabled', true);

					swal({
						title : "저장 완료!",
						text : resmap.total + "분이 저장되었습니다!",
						icon : "success",
						button : "확인",
					});
				},
				error : function() {
					alert("종료 실패");
				}
			});
		});

	});
</script>

<style>
div #wow {
	display:none;
}
div .first {
	width:90px;
	height:40px;
	
}
.studying {
	width:90px;
	height:40px;
}
</style>

<body>
	<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
		<div class="container-fluid">
			<!-- Toggler -->
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Brand -->
			<a class="navbar-brand pt-0" href="index.do"> <img src="./assets/img/brand/wesche_blue.png" class="navbar-brand-img" alt="...">
			</a>


			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Collapse header -->
				<div class="navbar-collapse-header d-md-none">
					<div class="row">
						<div class="col-6 collapse-brand">
							<a href="index.do"> <img src="./assets/img/brand/blue.png">
							</a>
						</div>
						<div class="col-6 collapse-close">
							<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
								<span></span>
								<span></span>
							</button>
						</div>
					</div>
				</div>

				<form style="margin-bottom:0px;">
					<div align="center">
						<input type="hidden" id="memberid" name="memberid" value="${login_id }">

						<%
							if (session.getAttribute("study_state").equals("login")) {
						%>
						<input type="button" id="startBtn" name="startBtn" class="btn btn-primary my-4" value="start">
						<input type="button" id="endBtn" name="endBtn" class="btn btn-primary my-4" value="finish">
						<div id="wow" class="state"><img class="first"></div>

						<%
							} else if (session.getAttribute("study_state").equals("start")) {
						%>
						<input type="button" id="startBtn" name="startBtn" class="btn btn-primary my-4" value="start" disabled="disabled">
						<input type="button" id="endBtn" name="endBtn" class="btn btn-primary my-4" value="finish">
						<div class="state"><img class="studying" id="studying" src="./assets/img/studying.gif"></div>
						<%
							} else if (session.getAttribute("study_state").equals("end")) {
						%>
						<input type="button" id="startBtn" name="startBtn" class="btn btn-primary my-4" value="start">
						<input type="button" id="endBtn" name="endBtn" class="btn btn-primary my-4" value="finish" disabled="disabled">
						<div id="wow" class="state"><img id="studying" class="studying"></div>

						<%
							}
						%>

					</div>
				</form>


				<!-- Navigation -->
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="index.do"> <i class="ni ni-tv-2 text-primary"></i> Calendar
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="youtube.do"> <i class="ni ni-planet text-blue"></i> Youtube
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="qna.do?myno=0"> <i class="ni ni-pin-3 text-orange"></i> Q & A
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="study.do"> <i class="ni ni-bullet-list-67 text-red"></i> Study
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="chatlist.do?userid=<%=userid%>"> <i class="ni ni-chat-round text-purple"></i> Chat
						</a>
					</li>
					<%
						if (session.getAttribute("logindto") != null && request.isRequestedSessionIdValid()) {
					%>
				</ul>
				<!-- Divider -->
				<hr class="my-3">
				<!-- Heading -->
				<h6 class="navbar-heading text-muted">
					My Study List
					<svg width="20px" height="20px" viewBox="0 0 16 16" class="bi bi-book" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M1 2.828v9.923c.918-.35 2.107-.692 3.287-.81 1.094-.111 2.278-.039 3.213.492V2.687c-.654-.689-1.782-.886-3.112-.752-1.234.124-2.503.523-3.388.893zm7.5-.141v9.746c.935-.53 2.12-.603 3.213-.493 1.18.12 2.37.461 3.287.811V2.828c-.885-.37-2.154-.769-3.388-.893-1.33-.134-2.458.063-3.112.752zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
</svg>
				</h6>
				<!-- Navigation -->
				<ul class="navbar-nav mb-md-3">

					<c:choose>
						<c:when test="${empty chatlistbyid }">
							<li class="nav-item">
								<a class="nav-link"> 참여중인 스터디가 없습니다 </a>
							</li>
						</c:when>
						<c:otherwise>
							<c:forEach items="${chatlistbyid }" var="chatlistbyid">
								<li class="nav-item">
									<a class="nav-link"> ${chatlistbyid.chat_list_title } </a>
								</li>
							</c:forEach>

						</c:otherwise>
					</c:choose>

				</ul>
				<%
					}
				%>
			</div>
		</div>
	</nav>
</body>
</html>