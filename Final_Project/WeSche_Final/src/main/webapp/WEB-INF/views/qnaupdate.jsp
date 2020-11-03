<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="com.edu.mvc.model.dto.MemberDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>WeSche - Q & A</title>
<script type="text/javascript">
function fnImgPop(url) {
   var img = new Image();
   img.src = url;
   var img_width = img.width;
   var win_width = img.width + 25;
   var img_height = img.height;
   var win = img.height + 30;
   var OpenWindow = window.open('', '_blank', 'width=' + img_width
         + ', height=' + img_height + ', menubars=no, scrollbars=auto');
   OpenWindow.document
         .write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
}
function make(){
   var target = document.getElementById("qbtag");
   if(document.getElementById("title").value=="" || document.getElementById("qbcontent").value=="" || target.options[target.selectedIndex].value==""){
      swal("오류!", "입력이 누락된 값이 있습니다!", "warning");
   }else{
      swal("수정 완료!", "게시글이 수정되었습니다!", "success")
      .then((value) => {   
       document.sub1.submit();
           
         });
   }

}


function cancel(qbseq, pagelength){
	   swal("수정 취소!", "게시글 수정을 취소했습니다!", "success")
	      .then((value) => {
	    	  location.href="qnadetail.do?qbseq="+qbseq+"&pagelength="+pagelength;
		});
}

</script>

<style type="text/css">
.study-insert {
	display: block;
	position: relative;
	width: 100%;
	background: #fff;
	text-align: left;
	box-sizing: border-box;
	color: #000;
	cursor: pointer;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.text-btn2 {
	float: right;
	border: 0;
	border-radius: 10px;
	cursor: pointer;
	font-weight: bold;
	margin: 3px;
	padding: 8px;
}
</style>
</head>
<body>
	<jsp:include page="common.jsp" />
	<div class="main-content">
		<jsp:include page="Navbar.jsp" />
		<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
			<div class="container-fluid"></div>
		</div>
		<div class="container-fluid mt--7">

			<!-- dark table -->
			<div class="row">
				<div class="col">
					<div class="card shadow">
						<form name="sub1" action="qnaupdateres.do" method="post" enctype="multipart/form-data">
							<input type="hidden" name="qbseq" value="${qbdto.qbseq} ">
							<input type="hidden" name="pagelength" value="${pagelength }">

							<div class="card-header border-0">
								<h2 class="mb-0" style="float: left; font-weight: bold; border-left: solid; padding-left: 13px;">Q & A</h2>
								<input readonly="readonly" type="text" name="memberid" id="resizable" size=5 onkeyup="javascript:CheckSize();" style="border: none; float: right;" value="${qbdto.memberid}">

							</div>
							<table>
								<div style="margin: 0 20px 8px 20px;">
									<div class="study-insert" style="border-top: 1px solid #CCCCCC; padding-top: 8px;">
										<input type="text" name="title" id="title" style="border: 1px solid #CCCCCC; width: 90%; padding: 6px;" value="${qbdto.title }">

										<select name="qbtag" id="qbtag" style="padding: 6px; border: 1px solid #CCCCCC; float: right;">
											<option value="" selected>-- 선택 --</option>
											<option value="컴퓨터">컴퓨터</option>
											<option value="수학">수학</option>
											<option value="국어">국어</option>
											<option value="영어">영어</option>
											<option value="공무원">공무원</option>
			                         		<option value="기타">기타</option>

										</select>
									</div>

									<div style="padding-top: 8px; text-align: center;">
										<textarea class="autosize" onkeydown="resize(this)" onkeyup="resize(this)" name="qbcontent" id="qbcontent" style="resize: none; width: 100%; height: 400px; border: 1px solid #CCCCCC;">${qbdto.qbcontent }</textarea>
									</div>
									
									<div>
										<input type="file" multiple="multiple" name="mpfile" id="input-photo">
									</div>

									<div colspan="2" align="right">
										<input class="text-btn2" type="button" value="수정" onclick="make()">
										<input class="text-btn2" type="button" value="취소" onclick="cancel(${qbdto.qbseq}, ${pagelength })">
									</div>
								</div>
							</form>
						</table>
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
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>


	<script>
      window.TrackJS && TrackJS.install({
         token : "ee6fab19c5a04ac1a32a645abde4613a",
         application : "argon-dashboard-free"
      });
   </script>

</body>
</html>