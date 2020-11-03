<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.edu.mvc.model.dto.MemberDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MemberDto mdto = null;
mdto = (MemberDto) session.getAttribute("logindto");
String userid = null;
userid = mdto.getMemberid();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>WeSche - Chat</title>
<!-- Favicon -->
<link href="./assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="./assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="./assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="./assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
<link href="./assets/css/btncss.css" rel="stylesheet" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
.text-ellipsis {
	display: table;
	table-layout: fixed;
	width: 100%;
	white-space: nowrap;
}

.text-ellipsis>* {
	display: table-cell;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>

<script type="text/javascript">


function exitRoom(chat_user_chat_no,chat_user_id){
	   
	   swal({
	        title: "정말로 채팅방을 나가시겠습니까?",
	        text: "나가면 방장이 다시 초대하지 않는 한,입장이 불가능합니다.",
	        icon: "warning",
	        buttons: true,
	        dangerMode: true,
	      })
	      .then((willDelete) => {
	        if (willDelete) {
	          swal("채팅방에서 나가셨습니다!", {
	            icon: "success",
	            
	          }).then((result) =>{
	           location.href="exitRoom.do?chat_user_chat_no="+chat_user_chat_no+"&chat_user_id="+chat_user_id;
	          });
	        } else {
	          swal("채팅방 나가기가 취소되었습니다.");
	        }
	      });
	   

	}



</script>

</head>

<body class="">

	<jsp:include page="common.jsp" />

	<div class="main-content">
		<jsp:include page="Navbar.jsp" />

		<!-- End Navbar -->
		<!-- Header -->
		<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
			<div class="container-fluid"></div>
		</div>
		<div class="container-fluid mt--7">
			<!-- Table -->
			<div class="row">
				<div class="col">
					<div class="card shadow">
						<div class="card-header border-0">
							<h3 class="mb-0" style="font-weight:bold;">My Chatting List</h3>
						</div>
						<div class="table-responsive">
							<table class="table align-items-center table-flush">
								<colgroup>
									<col style="width: 25%" />
									<col style="width: 5%">
									<col style="width: 5%">
									<col style="width: 35%">
									<col style="width: 30%">
								</colgroup>

								<thead class="thead-light" style="text-align: center;">
									<tr>
										<th scope="col">Chat Name</th>
										<th scope="col">Type</th>
										<th scope="col">Capacity</th>
										<th scope="col">Latest Talk</th>
										<th scope="col">Enter / Exit</th>
									</tr>
								</thead>
								<tbody style="text-align:center;">

									<!-- chatting room info start -->

									<c:choose>
										<c:when test="${empty mylist }">
											<tr>
												<td colspan="4" align="center">참여중인 채팅방이 없습니다.</td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${mylist }" var="mylist">
												<input type="hidden" name="chatlistno" value="${mylist.chat_list_no }" />
												<tr>
													<th scope="row">
														<div class="media align-items-center">

															<div class="media-body" class="text-ellipsis">
																<span class="mb-0 text-sm">${mylist.chat_list_title }</span>
															</div>
														</div>
													</th>

													<c:choose>
														<c:when test="${mylist.chat_list_board_type eq 'S'}">
															<td>
																<svg width="20px" height="20px" viewBox="0 0 16 16" class="bi bi-book" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M1 2.828v9.923c.918-.35 2.107-.692 3.287-.81 1.094-.111 2.278-.039 3.213.492V2.687c-.654-.689-1.782-.886-3.112-.752-1.234.124-2.503.523-3.388.893zm7.5-.141v9.746c.935-.53 2.12-.603 3.213-.493 1.18.12 2.37.461 3.287.811V2.828c-.885-.37-2.154-.769-3.388-.893-1.33-.134-2.458.063-3.112.752zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
</svg>
															</td>
														</c:when>
														<c:when test="${mylist.chat_list_board_type eq 'Q'}">
															<td>
																<svg width="20px" height="20px" viewBox="0 0 16 16" class="bi bi-patch-question-fll" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M5.933.87a2.89 2.89 0 0 1 4.134 0l.622.638.89-.011a2.89 2.89 0 0 1 2.924 2.924l-.01.89.636.622a2.89 2.89 0 0 1 0 4.134l-.637.622.011.89a2.89 2.89 0 0 1-2.924 2.924l-.89-.01-.622.636a2.89 2.89 0 0 1-4.134 0l-.622-.637-.89.011a2.89 2.89 0 0 1-2.924-2.924l.01-.89-.636-.622a2.89 2.89 0 0 1 0-4.134l.637-.622-.011-.89a2.89 2.89 0 0 1 2.924-2.924l.89.01.622-.636zM7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm1.602-2.027c-.05.386-.218.627-.554.627-.377 0-.585-.317-.585-.745v-.11c0-.727.307-1.208.926-1.641.614-.44.822-.762.822-1.325 0-.638-.42-1.084-1.03-1.084-.55 0-.916.323-1.074.914-.109.364-.292.51-.564.51C6.203 6.12 6 5.873 6 5.48c0-.251.045-.468.139-.69.307-.798 1.079-1.29 2.099-1.29 1.341 0 2.262.902 2.262 2.227 0 .896-.376 1.511-1.05 1.986-.648.445-.806.726-.846 1.26z" />
</svg>
															</td>
														</c:when>
													</c:choose>


													<td>
														<!-- 
											<div class="avatar-group">
												<a href="#" class="avatar avatar-sm" data-toggle="tooltip"
													data-original-title="Ryan Tompson"> <img
													alt="Image placeholder"
													src="./assets/img/theme/team-1-800x800.jpg"
													class="rounded-circle">
												</a> <a href="#" class="avatar avatar-sm" data-toggle="tooltip"
													data-original-title="Romina Hadid"> <img
													alt="Image placeholder"
													src="./assets/img/theme/team-2-800x800.jpg"
													class="rounded-circle">
												</a> <a href="#" class="avatar avatar-sm" data-toggle="tooltip"
													data-original-title="Alexander Smith"> <img
													alt="Image placeholder"
													src="./assets/img/theme/team-3-800x800.jpg"
													class="rounded-circle">
												</a> <a href="#" class="avatar avatar-sm" data-toggle="tooltip"
													data-original-title="Jessica Doe"> <img
													alt="Image placeholder"
													src="./assets/img/theme/team-4-800x800.jpg"
													class="rounded-circle">
												</a>
											</div>
											 -->
														${mylist.countmember } 명
													</td>
													<td>
														<div class="d-flex align-items-center">
															<div class="text-ellipsis">${mylist.chatmsgdto.chat_msg_txt }</div>
														</div>
													</td>

													<td>
														<button type="button" class="btn btn-dark-blue" id="enterBtn" onclick="location.href='chatdetail${mylist.chat_list_no }.do'">Enter</button>
														<button type="button" style="width: 80px;padding-left: 20px;" class="btn btn-red" id="exitBtn" onclick="exitRoom(${mylist.chatuserdto.chat_user_chat_no },'${login_id } ');">Exit</button>
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>

									<!-- chatting room info end -->

								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
			<!-- Footer -->
			<jsp:include page="footer.jsp" />
		</div>
	</div>
	<!--   Core   -->
	<script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<!--   Argon JS   -->
	<script src="./assets/js/argon-dashboard.min.js?v=1.1.2"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
</body>

</html>