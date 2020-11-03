<%@page import="javax.xml.namespace.QName"%>
<%@ page import="com.edu.mvc.model.dto.QAnswerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.edu.mvc.model.dto.MemberDto"%>
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
<title>WeSche - Q & A</title>
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

//sessionid 랑 작성자랑 일치하는경우에면 편집 가능
   var userid = "<%=userid%>";
   var username = "${mdto.memberid}";

   $(function() {
      if (userid == username) {
         $("#kingMain").show();
      }
   });

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
   
   function create(pagelength,chat_list_board_no,chat_list_board_type){
      
      swal("생성완료!", "채팅방이 생성되었습니다!", "success")
      .then((value) => {   
      location.href="createroomq.do?pagelength="+pagelength+"&chat_list_board_no="+chat_list_board_no+"&chat_list_board_type="+chat_list_board_type;     
         });
      
   }
   function invite(pagelength,chat_list_board_no,chat_list_board_type){
      swal("추가인원초대!", "초대페이지로 이동합니다!", "success")
      .then((value) => {   
      location.href="createroomq.do?pagelength="+pagelength+"&chat_list_board_no="+chat_list_board_no+"&chat_list_board_type="+chat_list_board_type;     
         });
   }
   
   function qainsert(){
	   swal("댓글 등록!", "댓글 등록에 성공했습니다!", "success")
	      .then((value) => {
	    	  document.sub1.submit();
		});
   }
   
   function qdelete(qbseq, pagelength){
	   swal("게시글 삭제!", "게시글 삭제에 성공했습니다!", "success")
	   .then((value) => {
		   location.href="qnadelete.do?myno="+qbseq+"&pagelength="+pagelength;
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

                  <div class="title-header">
                     <div style="margin-bottom: 3px;">
                        <div style="text-align: right; float: right;">
                           <span style="color: #6A5ACD;">${mdto.qbtag }</span>
                        </div>

                        <h4>
                           No.
                           <span>${mdto.qbseq }</span>
                        </h4>
                     </div>
                     <div>
                        <h3 class="title_text">${mdto.title }</h3>
                     </div>

                     <div>
                        <a class="avatar avatar-sm rounded-circle" style="float: left; margin-right: 10px; margin-top: 6px;"> <img src="./assets/img/profile/${mdto.memberdto.filename }"></img>
                        </a>

                        <div>
                           <a style="font-weight: bold;">${mdto.memberid }</a>
                        </div>

                        <div>
                           <fmt:formatDate value="${mdto.qbdate }" pattern="yyyy.MM.dd HH:mm" />
                        </div>
                     </div>
                  </div>

                  <div class="title-header">
                     <textarea class="textarea" rows="10" readonly="readonly" name="qbcontent" onkeyup="this.style.height='26px'; this.style.height = this.scrollHeight + 'px';">${mdto.qbcontent }</textarea>
                     <c:choose>
                        <c:when test="${empty imageList }"></c:when>
                        <c:otherwise>
                           <c:forEach items="${imageList }" var="imageList">
                              <img class="click_img" style="width: 300px; height: 300px;" src="./assets/img/upload/${imageList }" onclick="fnImgPop(this.src)">
                           </c:forEach>
                        </c:otherwise>
                     </c:choose>
                  </div>

                  <!-- 댓글 리스트 -->
                  <div class="review_list">
                     <h3 class="h1" style="padding-bottom: 5px;">댓글</h3>
                     <c:choose>
                        <c:when test="${empty qadto }">
                           <tr>
                              <td colspan="4" align="center">작성된 댓글이 없습니다.</td>
                           </tr>
                        </c:when>
                        <c:otherwise>
                           <c:forEach items="${qadto }" var="qadto">
                              <div style="text-align: left;">
                                 <div align="left">
                                    <div align="left">
                                       <a class="avatar avatar-sm rounded-circle text-img"> <img src="./assets/img/profile/${qadto.memberdto.filename }"></a>
                                       <div align="left" class="writer" style="font-weight: bold;">${qadto.qamemberid }</div>
                                    </div>
                                    <div align="left" class="content" style="resize: none;">
                                       <p>
                                          <span style="resize: none; width: 80%; height: 10%;" draggable="false">${qadto.qacontent }</span>
                                       </p>
                                    </div>
                                 </div>
                                 <div class="date_write" style="float: left; font-size: 13px; color: silver; margin-left: 47px;">
                                    <fmt:formatDate value="${qadto.qadate }" pattern="yyyy.MM.dd HH:mm"/> 
                                 </div>
                                 <div>
                                    <c:if test="${logindto.memberid == qadto.qamemberid }">
                                       <form action="qnaanswerupdateform.do" method="post">
                                          <input type="hidden" name="qbseq" value="${qadto.qbseq }">
                                          <input type="hidden" name="qaseq" value="${qadto.qaseq }">
                                          <input type="hidden" name="pagelength" value="${pagelength }">
                                          <input class="text-btn" type="submit" value="수정" style="float: right; margin-top: -5px; font-size: 15px">
                                       </form>
                                       <form action="qnaanswerdelete.do" method="post">
                                          <input type="hidden" name="qbseq" value="${qadto.qbseq }">
                                          <input type="hidden" name="qaseq" value="${qadto.qaseq }">
                                          <input type="hidden" name="pagelength" value="${pagelength }">
                                          <input class="text-btn" type="submit" value="삭제" style="float: right; margin-top: -5px; font-size: 15px">
                                       </form>
                                    </c:if>
                                 </div>
                                 <hr style="border-top: 0;">
                                 <br>
                              </div>
                           </c:forEach>
                        </c:otherwise>
                     </c:choose>
                  </div>
                  <div class="review_box">
                     <div class="content_box"></div>
                  </div>

                  <!-- 댓글 작성 칸 -->
                  <div class="review_answer" style="border: 2px solid silver; border-radius: 10px; padding: 8px; margin-top: 0.5rem;">
                     <div class="content_box">
                        <div>
                           <div style="font-weight: bold; padding-left: 10px;"><%=userid%></div>
                        </div>
                        <form action="qnaanswerinsert.do" name="sub1" method="post">
                           <input type="hidden" name="qbseq" value="${mdto.qbseq} ">
                           <input type="hidden" name="qamemberid" value="<%=userid%>">
                           <input type="hidden" name="pagelength" value="${pagelength }">
                           <textarea class="textarea" style="height: 30px;" placeholder="댓글을 입력해 주세요" name="qacontent" onkeyup="this.style.height='26px'; this.style.height = this.scrollHeight + 'px';"></textarea>
                           <input class="text-btn" type="button" value="등록" onclick="qainsert()">
                        </form>
                     </div>
                  </div>
               </div>

               <div>
                  <input class="text-btn2" type="button" value="목록" onclick="location.href='qna.do?myno=0'">
                  <div id="kingMain" style="display: none;">
                     <input class="text-btn2" type="button" value="수정" onclick="location.href='qnaupdateform.do?myno=${mdto.qbseq}&pagelength=${pagelength }'">
                     <input class="text-btn2" type="button" value="삭제" onclick="qdelete(${mdto.qbseq},${pagelength })">
                     <c:choose>
                        <c:when test="${empty cdto }">
                           <div id="kingBtn1">
                              <input class="text-btn2" type="button" value="채팅방 생성" onclick="create(${pagelength},${mdto.qbseq },'Q')">
                           </div>
                        </c:when>
                        <c:otherwise>
                           <div id="kingBtn2">
                              <input class="text-btn2" type="button" value="추가인원초대" onclick="invite(${pagelength},${mdto.qbseq },'Q')">
                           </div>
                        </c:otherwise>
                     </c:choose>
                  </div>
               </div>

            </div>
         </div>
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
      var txtArea = $(".textarea");
      if (txtArea) {txtArea.each(function() {
            $(this).height(this.scrollHeight);
         });
      }
   </script>
</body>
</html>