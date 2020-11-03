<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.xml.namespace.QName"%>
<%@ page import="com.edu.mvc.model.dto.MemberDto"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<title>WeSche - Study Group</title>
<!-- Favicon -->
<link href="./assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="./assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="./assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="./assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
function update(){
	   swal("수정 완료!", "댓글이 수정되었습니다!", "success")
	      .then((value) => {
	    	  document.qasub.submit();
		});
}

function cancel(qbseq, pagelength){
	   swal("수정 취소!", "댓글 수정을 취소했습니다!", "success")
	      .then((value) => {
	    	  location.href="qnadetail.do?qbseq="+qbseq+"&pagelength="+pagelength;
		});
}
</script>
<style type="text/css">
th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

.title_text {
	font-weight: 400;
	font-size: 26px;
	font-weight: bold;
}

.title-header {
	border-bottom: 1px solid silver;
	margin-bottom: 20px;
	padding-bottom: 20px;
}

.textarea {
	resize: none;
	line-height: 30px;
	border: none;
	outline: none;
	overflow: hidden;
	width: 100%;
	height: 2.7rem;
	padding: 0.6rem;
	border-radius: 0.2rem;
}

.text-img {
	float: left;
	margin-right: 10px;
	margin-top: 6px;
}

.text-btn {
	float: right;
	border: 0px;
	background-color: #FFFFFF;
	color: silver;
	cursor: pointer;
}

.text-btn2 {
	float: right;
	border: 0;
	border-radius: 10px;
	cursor: pointer;
	font-weight: bold;
	margin: 3px;
	margin-top: 10px;
	padding: 8px;
}
</style>
</head>

<body class="">

	<jsp:include page="common.jsp" />
	<div class="main-content">
		<jsp:include page="Navbar.jsp" />

		<!-- Header -->
		<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
			<div class="container-fluid"></div>
		</div>
		<div class="container-fluid mt--7">
			<!-- Table -->
			<div class=" row">
				<div class="col">
					<div class="card shadow" style="padding: 25px;">

						<div class="review_list">
							<div style="text-align: left;">
								<form action="qnaanswerupdateres.do" name="qasub" method="post">
									<input type="hidden" name="qbseq" value="${qadto.qbseq }">
									<input type="hidden" name="qaseq" value="${qadto.qaseq }">
									<input type="hidden" name="pagelength" value="${pagelength }">
									<div align="left">
										<div align="left">
											<div align="left" class="writer" style="font-weight: bold;">${qadto.qamemberid }</div>
										</div>
										<div class="date_write" style="float: left; font-size: 13px; color: silver;">
											<fmt:formatDate value="${qadto.qadate }" pattern="yyyy.MM.dd HH:mm" />
										</div>
										<div align="left" class="content" style="resize: none;">
											<p>
												<textarea rows="10" name="qacontent" style="resize: none; border-color: white; width: 100%;">${qadto.qacontent }</textarea>
											</p>
										</div>
									</div>
									<div>
										<input class="text-btn" type="button" value="수정" onclick="update()" style="float: right; margin-top: -5px; font-size: 15px">
										<input class="text-btn" type="button" value="취소" onclick="cancel(${qadto.qbseq},${pagelength })" style="float: right; margin-top: -5px; font-size: 15px">
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp" />
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
	<script>
		var txtArea = $(".textarea");
		if (txtArea) {
			txtArea.each(function() {
				$(this).height(this.scrollHeight);
			});
		}
	</script>
</body>
</html>