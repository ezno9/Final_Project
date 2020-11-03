<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*, java.text.*"%>
<%@ page import="com.edu.mvc.model.dto.MemberDto"%>
<%
   Date date = new Date();
SimpleDateFormat format = new SimpleDateFormat("yy/MM/dd");
String today_server = format.format(date);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>WeSche - My Profile</title>


<!-- Favicon -->
<link href="./assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<!-- Icons -->
<link href="./assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link
	href="./assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css"
	rel="stylesheet" />
<!-- CSS Files -->
<link href="./assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      
      $('#submitInfo').hide();
      $('#cancel').hide();
      $(document).on('click', '#updateInfo', function() {
         $('#input-username').removeAttr('readonly');
         $('#input-email').removeAttr('readonly');
         $('#submitInfo').show();
         $('#cancel').show();
         $('#updateInfo').hide();
         $('.form-group-photo').show();
      });
   });
   
 	function updateChk(){
 		 $('#submitInfo').hide();
 	      $('#cancel').hide();
 	      $('#updateInfo').show();
 	      
 	}
 	     
 	      
 	 	//저장하기 누르면 변경된 정보 저장하기 
 	     $(document).on('click', '#submitInfo', function() {
 	    	 // name : 한글 , 영어만
 	 	      var regExpName = /^[가-힣a-zA-Z]+$/;
 	 	      
 	 	      // email : 일반적인 이메일 방식 
 	 	      var regExpEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
 	 	      
 	 	      if(regExpName.test($('#input-username').val()) == false || regExpEmail.test($('#input-email').val()) == false){
 	 	    	swal("이름이나 이메일이 형식에 맞지 않습니다.",  "ex) 이름 : 홍길동, 이메일 : hongildong@hong.com");
 	 	    	  return false;
 	 	      }
 	       
 	    	swal("수정 완료!", "마이페이지가 수정되었습니다!", "success")
 	 	      .then((value) => {   
 	 	       document.updatemypage.submit();
 	 	           
 	 	    });
 	     });
 	
   $(document).on('click', '#cancel', function() {
      $('#updateInfo').show();
      $('#submitInfo').hide();
      $('#cancel').hide();
      $('.form-group-photo').hide();
      $('#input-username').attr('readonly', true).val('${mdto.name }');
      $('#input-email').attr('readonly', true).val('${mdto.email }');
   });
   
   
   function deleteChk(){
      
      swal({
           title: "정말로 탈퇴하시겠습니까?",
           text: "탈퇴시, 복구 불가능합니다.",
           icon: "warning",
           buttons: true,
           dangerMode: true,
         })
         .then((willDelete) => {
           if (willDelete) {
             swal("정상적으로 탈퇴되었습니다.!", {
               icon: "success",
               
             }).then((result) =>{
                var logid = '${login_id }';
                 $.ajax({
                    type : "post",
                    url : "deleteMember.do",
                    data : {
                       logid : logid
                    },
                    success : function(msg){
                       location.href = "login.do";
                    }
                 });  
             });
           } else {
             swal("탈퇴 처리가 취소되었습니다.");
           }
         });
   }
   
</script>
<style>
#pppp {
	visibility: hidden;
}

.nav-pills .nav-link.active1 {
	background-color: #5e72e4;
	color: #fff;
}
</style>

<body class="">
	<jsp:include page="common.jsp" />
	<div class="main-content">
		<jsp:include page="Navbar.jsp" />

		<!-- profile은 헤더가 안에 있음 -->
		<!-- Header -->
		<div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center">
			<!-- Mask -->
			<span class="mask bg-gradient-default opacity-8"></span>
			<!-- Header container -->
			<div class="container-fluid d-flex align-items-center"></div>
		</div>
		<!-- Page content -->

		<div class="container-fluid mt--7">
			<div class="row">
				<div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
					<div class="card card-profile shadow">
						<div class="row justify-content-center">
							<div class="col-lg-3 order-lg-2">
								<div class="card-profile-image">

									<!-- 사진 변경하는곳  -->
									<img src="./assets/img/profile/${mdto.filename }"
										class="rounded-circle">

								</div>
							</div>
						</div>
						<div
							class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
							<div class="d-flex justify-content-between"></div>
						</div>
						<div class="card-body pt-0 pt-md-4">
							<div class="row">
								<div class="col">
									<div
										class="card-profile-stats d-flex justify-content-center mt-md-5">
										<div>
											<span class="heading">${cB }</span> <span class="description">스터디</span>
										</div>
										<div>
											<span class="heading">${myBoard }</span> <span
												class="description">작성 글</span>
										</div>
										<div>
											<span class="heading">${myReply }</span> <span
												class="description">작성 댓글</span>
										</div>
									</div>
								</div>
							</div>
							<div class="text-center">
								<h3>
									${mdto.name } <span class="font-weight-light"></span>
								</h3>
								<div class="h5 font-weight-300">
									<i class="ni location_pin mr-2"></i>${mdto.email }
								</div>

							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-8 order-xl-1">
					<form name="updatemypage" action="mypageupdate.do" method="post"
						enctype="multipart/form-data">
						<div class="card bg-secondary shadow">
							<div class="card-header bg-white border-0">
								<div class="row align-items-center">
									<div class="col-8">
										<h3 class="mb-0">My account</h3>
									</div>
									<div class="col-4 text-right">
										<input type="button" class="btn btn-sm btn-primary" value="수정"
											id="updateInfo" onclick="updateChk();"> <input
											type="button" class="btn btn-sm btn-primary" value="저장"
											id="submitInfo" style="display: none;"> <input
											type="button" class="btn btn-sm btn-primary" value="취소"
											id="cancel" style="display: none;"> <input
											type="button" class="btn btn-sm btn-primary" value="탈퇴"
											onclick="deleteChk();">
									</div>
								</div>
							</div>
							<div class="card-body">

								<h6 class="heading-small text-muted mb-4">User information</h6>
								<div class="pl-lg-4">

									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" for="input-username">Name</label>
												<input type="text" id="input-username" name="name"
													class="form-control form-control-alternative"
													readonly="readonly" value="${mdto.name }">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" for="input-email">Email</label>
												<input type="email" id="input-email" name="email"
													class="form-control form-control-alternative"
													readonly="readonly" value="${mdto.email }">
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group-photo" style="display: none;">
												<label class="form-control-label" for="input-photo">Photo</label>
												<input type="file" name="mpfile" id="input-photo"
													class="form-control form-control-alternative">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<input type="hidden" id="memberid" name="memberid"
							value="${login_id }">
					</form>
				</div>
			</div>



			<br> <br> <br> <br> <br> <br> <br>
			<br> <br>
			<!-- Chart -->

			<div class="container-fluid mt--7">
				<div class="row">
					<div class="col-xl-8 mb-5 mb-xl-0">
						<div class="card bg-gradient-default shadow">
							<div class="card-header bg-transparent">
								<div class="row align-items-center">
									<div class="col">
										<h6 class="text-uppercase text-light ls-1 mb-1">공부 시간 한눈에
											보기</h6>
										<h2 class="text-white mb-0">주간 공부 시간</h2>
									</div>
									<div class="col">
										<ul class="nav nav-pills justify-content-end">
											<li class="nav-item mr-2 mr-md-0" data-toggle="chart"
												data-target="#chart-sales"
												data-update='{"data":{"datasets":[{"data":}]}}'
												data-suffix="분"><a href="#"
												class="nav-link py-2 px-3 active" data-toggle="tab"
												id="week"> <span class="d-none d-md-block">이번주!</span>
											</a></li>

										</ul>

									</div>
								</div>
							</div>
							<div class="card-body">
								<!-- Chart -->
								<div class="chart">
									<!-- Chart wrapper -->
									<canvas id="chart-sales" class="chart-canvas"></canvas>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-4">
						<div class="card shadow">
							<div class="card-header bg-transparent">
								<div class="row align-items-center">
									<div class="col">
										<h6 class="text-uppercase text-muted ls-1 mb-1">Performance</h6>
										<h2 class="mb-0">월별 공부 시간</h2>
									</div>
									<div class="col">
										<ul class="nav nav-pills justify-content-end">
											<li class="nav-item mr-2 mr-md-0" data-toggle="chart"
												data-target="#chart-orders"
												data-update='{"data":{"datasets":[{"data":}]}}'
												data-suffix="분"><a href="#"
												class="nav-link py-2 px-3 active1" data-toggle="tab"> <span
													class="d-none d-md-block">보기</span>
											</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="card-body">
								<!-- Chart -->
								<div class="chart">
									<canvas id="chart-orders" class="chart-canvas"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


			<jsp:include page="footer.jsp" />
		</div>
	</div>
	<!--   Core   -->
	<script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script
		src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<script src="./assets/js/plugins/chart.js/dist/Chart.min.js"></script>
	<script src="./assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
	<!--   Argon JS   -->
	<!--  
   <script src="./assets/js/argon-dashboard.min.js?v=1.1.2"></script>-->
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
      window.TrackJS && TrackJS.install({
         token : "ee6fab19c5a04ac1a32a645abde4613a",
         application : "argon-dashboard-free"
      });
   </script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="./assets/js/argon-dashboard.min.js?v=1.1.2?ver=657"></script>
	<script type="text/javascript">
      
   </script>

</body>

</html>