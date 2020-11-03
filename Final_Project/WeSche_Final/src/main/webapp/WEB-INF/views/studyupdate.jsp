<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page import="com.edu.mvc.model.dto.MemberDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>WeSche - Study Group</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- Favicon -->
<link href="./assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="./assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="./assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="./assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
<link href="./assets/css/bbs.css" rel="stylesheet" />

<style type="text/css">
.study-insert{
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

<style>
   textarea.autosize { min-height: 400px; }
</style>
<script type="text/javascript">
function make(){
   var target = document.getElementById("tag");
   if(document.getElementById("title").value=="" || document.getElementById("rbcontent").value=="" || target.options[target.selectedIndex].value==""){
      swal("오류!", "입력이 누락된 값이 있습니다!", "warning");
   }else{
      swal("수정 완료!", "게시글이 수정되었습니다!", "success")
      .then((value) => {   
       document.sub1.submit();
         });
   }

}


function cancel(rbseq){
	   swal("수정 취소!", "게시글 수정을 취소했습니다!", "success")
	      .then((value) => {
	    	  location.href="studydetail.do?rbseq="+rbseq;
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
                     <form name="sub1" action="studyupdateres.do" method="post">
                     <input type="hidden" name="rbseq" value="${rbdto.rbseq }">
               <div class="card-header border-0">
                     <h2 class="mb-0" style="float: left;font-weight: bold;border-left: solid;padding-left: 13px;">Study Group</h2>
                     <input readonly="readonly" type="text" name="memberid" id="resizable" size=5 onkeyup="javascript:CheckSize();" style="border: none;float: right;" value="${rbdto.memberid}">
                        
               </div>
                  <table>
                        <div style="margin: 0 20px 8px 20px;">
                           <div class="study-insert" style="border-top: 1px solid #CCCCCC; padding-top: 8px; " >
                              <input type="text" name="title" id="title" style="border: 1px solid #CCCCCC; width:90%; padding: 6px;" value="${rbdto.title }">
                                 
                              <select name="tag" id="tag" style="padding: 6px; border: 1px solid #CCCCCC; float:right;">
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
                              <textarea class="autosize" onkeydown="resize(this)" onkeyup="resize(this)" name="rbcontent" id="rbcontent" style="resize: none; width:100%; height: 400px; border: 1px solid #CCCCCC;">${rbdto.rbcontent }</textarea>
                           </div>
                        
                        <div colspan="2" align="right">
                           <input class="text-btn2" type="button" value="등록" onclick="make()">
                           <input class="text-btn2" type="button" value="취소" onclick="cancel(${rbdto.rbseq})">
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
   <script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
   <script>
      window.TrackJS && TrackJS.install({
         token : "ee6fab19c5a04ac1a32a645abde4613a",
         application : "argon-dashboard-free"
      });
   </script>
   <script>
      function resize(obj) {
        obj.style.height = "1px";
        obj.style.height = (12+obj.scrollHeight)+"px";
      }
   </script>
</body>

</html>