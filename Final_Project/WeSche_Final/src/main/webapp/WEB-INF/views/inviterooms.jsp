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
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.pt-md-8, .py-md-8 {
   padding-top: 3rem !important;
}

.card-body {
   width: 700px;
   height: 100%;
}

input[type="radio"], input[type="checkbox"] {
   box-sizing: border-box;
   padding: 0;
   zoom: 3.5;
}

.btn-primary {
   color: #fff;
}

.form-control {
   font-weight: bold;
   color: #212529;
}

.text-muted {
   color: #fb6340 !important;
}

.text-muted {
   color: #212529 !important;
}
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
   //채팅방 초대
var userid = "<%=userid%>";

   window.onload = function() {
      if (location.href.indexOf('reloaded') == -1)
         location.replace(location.href + '?reloaded');
   }

   $(document).on('click', '#inviteBtn', function() {
      var memberlist = [];
      var roomno = $("#roomNo").attr('value');
      $('input:checkbox[name="invitelist"]:checked').each(function() {
         memberlist.push($(this).val());

      })
      var inviteVal = new Array();
      for ( var i in memberlist) {
         var val = {
            "chat_user_id" : memberlist[i],
            "chat_user_chat_no" : roomno
         };
         inviteVal.push(val);
      }
      jQuery.ajaxSettings.traditional = true;

      console.log(inviteVal);
      $.ajax({
         type : "POST",
         url : "inviteroom.do",
         data : JSON.stringify(inviteVal),
         dataType : "json",
         async : false,
         contentType : "application/json",
         success : function(msg) {
            if (msg.count == inviteVal.length) { //배열의 길이(사람의 수 ) 만큼 insert 성공시
               swal("초대완료!", "정상적으로 초대되었습니다!", "success")
              .then((value) => {   
                 location.href = "chatlist.do?userid=" + userid;
                   
                 });
            } else {
               alert("이미 다 들어가 있네유~");
            }
         },
         error : function() {
            alert("실패");
         }
      });
   });
   
      function deleteRoom(myno,chat_list_no){
          swal({
          title: "정말로 채팅방을 나가시겠습니까?",
          text: "나가면 방장이 다시 초대하지 않는 한,입장이 불가능합니다.",
          icon: "warning",
          buttons: true,
          dangerMode: true,
        })
        .then((willDelete) => {
          if (willDelete) {
            swal("채팅방을 삭제하셨습니다!", {
              icon: "success",
              
            }).then((result) =>{
               location.href="returnrooms.do?myno="+myno+"&chat_list_no=" +chat_list_no;
            });
          } else {
            swal("채팅방 삭제가 취소되었습니다.");
          }
        });
      }
</script>
</head>
<body>
   <jsp:include page="common.jsp" />

   <div class="main-content">
      <jsp:include page="Navbar.jsp" />

      <!-- End Navbar -->
      <!-- Header -->
      <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
         <div class="container-fluid"></div>
      </div>




      <!-- body -->
      <div class="container-fluid mt--7" style="position: relative; top: 100px; width: 800px;">
         <!-- Table -->
         <div class="row">
            <div class="col">
               <div class="card shadow">
                  <div class="text-center">
                     <button type="button" id="inviteBtn" class="btn btn-primary my-4">채팅방 초대</button>

                     <button type="button" class="btn btn-primary my-4" onclick="deleteRoom(${bdto.rbseq},${cdto.chat_list_no });">채팅방 삭제</button>



                     <button type="button" class="btn btn-primary my-4" onclick="history.back(-1)">뒤로가기</button>
                     <input type="hidden" value="${cdto.chat_list_no }" id="roomNo" />
                  </div>
                  <div class="table-responsive">
                     <div class="card-body px-lg-5 py-lg-5" style="position: relative; top: -50px;">
                        <div class="text-center text-muted mb-4">
                           <h3>초대 가능 인원ID</h3>
                        </div>

                        <ul class="form-group">
                           <c:choose>
                              <c:when test="${empty invitelist }">
                                 <li class="input-group input-group-alternative mb-3">
                                    <div class="input-group-prepend">
                                       <span class="input-group-text">
                                          <i class="ni ni-hat-3"></i>
                                       </span>
                                    </div>
                                    <p class="form-control">초대 가능 인원이 없습니다.</p>
                                 </li>
                              </c:when>
                              <c:otherwise>
                                 <c:forEach items="${invitelist }" var="invitedto">

                                    <li class="input-group input-group-alternative mb-3">
                                       <div class="input-group-prepend">
                                          <span class="input-group-text">
                                             <i class="ni ni-hat-3"></i>
                                          </span>
                                       </div>
                                       <p class="form-control">${invitedto.ramemberid }</p>
                                       <input type="checkbox" name="invitelist" value="${invitedto.ramemberid }">
                                    </li>

                                 </c:forEach>
                              </c:otherwise>
                           </c:choose>
                        </ul>
                     </div>
                  </div>
               </div>
            </div>
            <!-- Footer -->
         </div>
         <!-- Footer -->
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