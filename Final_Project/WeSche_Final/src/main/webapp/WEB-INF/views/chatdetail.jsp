<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta charset="utf-8">
<title>WeSche - Chat</title>
<!--   Core   -->
<script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
<script src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!--   Optional JS  
<script src="./assets/js/plugins/chart.js/dist/Chart.min.js"></script>
<script src="./assets/js/plugins/chart.js/dist/Chart.extension.js"></script> -->
<!--   Argon JS   
<script src="./assets/js/argon-dashboard.min.js?v=1.1.2"></script>-->
<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>

<!-- Favicon -->
<link href="./assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="./assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="./assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="./assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
<link href="./assets/css/chat.css" rel="stylesheet" />

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<style type="text/css">
aside li img {
   border-radius: 50%;
   margin-left: 20px;
   margin-right: 8px;
   margin-left: 20px;
   width: 55px;
   height: 55px;
}
</style>

</head>
<script type="text/javascript">
   var ws;
   var messages;

   $(document).ready(function() {
      openSocket(); // 서버 오픈

      messages = document.getElementById("chat"); //message전체창
      userId = document.getElementById("sender").value;

      $(messages).scrollTop(messages.scrollHeight);

      $('#msgInput').on('keydown', function(e) { //메세지입력하는곳
         if (e.keyCode == 13) { //앤터시 입력
            if ($(this).val() != '') {
               send();
               return false; //한줄띄어지는 오류 해결
            }
         }
      });
   });

   function openSocket() {

      var url = window.location.host;//웹브라우저의 주소창의 포트까지 가져옴
      var pathname = window.location.pathname; /* '/'부터 오른쪽에 있는 모든 경로*/
      var appCtx = pathname.substring(0, pathname.indexOf("/", 2));
      var root = url + appCtx;

      var chatSeq = document.getElementById("chatSeq").value;
      var userId = document.getElementById("sender").value;
      messages = document.getElementById("chat");

      if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
         writeResponse("WebSocket is already opened.");
         return;
      }
      console.log("messages : " + messages);
      console.log("root : " + root);
      console.log("userId : " + userId);
      console.log("chatSeq:" + chatSeq);

      ws = new WebSocket("ws://" + root + "/echo/" + chatSeq + "/" + userId);

      ws.onopen = function(event) {
         if (event.data === undefined)
            return;
         writeResponse(event.data);
      };
      ws.onmessage = function(event) {
         writeResponse(event.data);
      };
      ws.onclose = function(event) {
         writeResponse("Connection closed");
      }
      console.log(ws);
   };

   function writeResponse(text) {
      var isSend;
      var msgType = "";
      var textTemp;
      var sender = ""; // 보내는사람 ID

      if (text.indexOf("send|") > -1) { //보내는 사람 
         text = text.replace('send|', '');
         isSend = true;

      } else if (text.indexOf("receive|all|") > -1) { //받는사람
         text = text.replace('receive|all|', '');
         isSend = false;
         msgType = "a";
      } else if (text.indexOf("receive|") > -1) { //받는사람
         text = text.replace('receive|', '');
         isSend = false;
         msgType = "b";
      }
      var now = new Date();
      var hour = now.getHours();
      var min = now.getMinutes();
      var timeText = hour > 12 ? "오후 " : "오전 ";

      if (hour > 13) {
         hour = hour - 12;
      }

      min = min > 9 ? min : "0" + min;

      if (text.indexOf("^@^") > -1) {
         textTemp = text.split("^@^");
         text = textTemp[0];
         sender = textTemp[1];
      }

      var html = '';

      if (isSend === true) {
         // 보내는 경우
         html += '';
         html += '<li class="me">';
         html += '    <div class="entete">';
         html += '<h3>' + timeText + " " + hour + ":" + min + ' | 오늘'
               + '</h3>';
         html += '            <h2>' + sender + '</h2>';
         html += '    <span class="status blue"></span>';
         html += '</div>';
         html += '<div class="triangle"></div>';
         html += '<div class="message">' + text + '</div>';
         html += '</li>';

      } else if (isSend === false && msgType == "b") {
         // 받는 경우
         html += '<li class="you">';

         //      if (currentKingUserId == sender) {
         //         html += '    <div data-crown-user-id="' + sender + '" class="incoming_msg_img crown">';
         //      } else {
         //         html += '    <div data-crown-user-id="' + sender + '" class="incoming_msg_img">';
         //      }

         //      html += '        <img src="' + getContextPath() + '/resources/img/user-profile.png" alt="sunil">';//받는사람이미지
         html += '    <div class="entete">';
         html += '    <span class="status green"></span>';
         html += '            <h2>' + sender + '</h2>';
         html += '<h3>' + timeText + " " + hour + ":" + min + ' | 오늘'
               + '</h3>';
         html += '</div>';
         html += '<div class="triangle"></div>';
         html += '<div class="message">' + text + '</div>';
         html += '</li>';

      } else if (isSend === false && msgType == "a") {
         html += '<p class="guide-txt" style="padding-left: 20px;">';
         html += text;
         html += '</p>';
         
      }
      messages.innerHTML += html;
      $(messages).scrollTop(messages.scrollHeight);

   }

   function sendfordb(val, text) {
      var sendVal = {
         "chat_msg_txt" : val,
         "chat_msg_chat_no" : $('#chatSeq').val()
      };

      var msgInput = $('#msgInput'); //메세지입력하는곳

      $.ajax({
         type : "POST",
         url : "sendfordb.do",
         data : JSON.stringify(sendVal),
         dataType : "json",
         contentType : "application/json",
         success : function(msg) {
            if (msg.res > 0) {
               ws.send(text);
            } else {
               alert("실패");
            }
         },
         error : function() {
            alert("실패");
         }

      })

   }

   function send() { //보냈을때 완전 빈칸이아니네
      var msgInput = $('#msgInput');
      var msgColor = msgInput.css('color');
      var isBold = msgInput.hasClass('font-bold');

      if (msgInput.val() !== "") {
         var text = "";
         var val = "";
         if (isBold) {
            val = "<span style='color: " + msgColor + "; font-weight: 700;'>"
                  + msgInput.val() + "</span>";
            text = val + "^@^" + document.getElementById("sender").value;
         } else {
            val = "<span style='color: " + msgColor + "'>" + msgInput.val()
                  + "</span>";
            text = val + "^@^" + document.getElementById("sender").value;
         }
         sendfordb(val, text);

         //      var val = msgInput.val();
         //      text = val + "^@^" + document.getElementById("sender").value; 
         //      ws.send(text); //<<
         //      console.log(text);

         msgInput.val("");
         msgInput.focus();
      }
   }

   function toggleColorList() {
      $('#colorListArea').toggleClass('open');
   }

   //    글자색 변경 처리
   function changeFontColor(btn) {
      $('#msgInput').css('color',
            $(btn).children('span').css('background-color'));
      $('#msgInput').focus();
   }

   // 볼드 처리
   function toggleBold() {
      $('#msgInput').toggleClass('font-bold');
      $('#msgInput').focus();
   }
</script>
<style type="text/css">
.hlist {
   color: white;
   text-align: center;
   font-size: 18pt;
}
</style>



<body>
   <!--  nav & header!! -->
   <jsp:include page="Navbar.jsp"/>
   <!--  nav & header!! -->
   <!-- common!! -->
   <jsp:include page="common.jsp"/>
   <!-- common!! -->

   <input type="hidden" id="chatSeq" value="${chatSeq}" />
   <input type="hidden" id="sender" value="<%=userid%>" />


   <div id="container">

      <aside>
         <header>
            <h2 class="hlist">참여자 목록</h2>
            <hr style="color: white; border: 1px solid;">
         </header>
         <ul style="top: -40px; position: relative;">

            <c:forEach items="${memberList }" var="mlist">

               <li>
                  <img src="./assets/img/profile/${mlist.memberdto.filename }" class="rounded-circle">
                  <div>
                     <h2>${mlist.chat_user_id }</h2>

                  </div>
               </li>

            </c:forEach>
         </ul>
      </aside>
      <main>
         <header>
            <div>
               <h1>
                  <c:choose>
                     <c:when test="${chatdetail.chat_list_board_type eq 'S'}">
                        <svg width="40px" height="40px" viewBox="0 0 16 16" class="bi bi-book" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M1 2.828v9.923c.918-.35 2.107-.692 3.287-.81 1.094-.111 2.278-.039 3.213.492V2.687c-.654-.689-1.782-.886-3.112-.752-1.234.124-2.503.523-3.388.893zm7.5-.141v9.746c.935-.53 2.12-.603 3.213-.493 1.18.12 2.37.461 3.287.811V2.828c-.885-.37-2.154-.769-3.388-.893-1.33-.134-2.458.063-3.112.752zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z" />
</svg>
                     </c:when>
                     <c:when test="${chatdetail.chat_list_board_type eq 'Q'}">
                        <svg width="40px" height="40px" viewBox="0 0 16 16" class="bi bi-patch-question-fll" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M5.933.87a2.89 2.89 0 0 1 4.134 0l.622.638.89-.011a2.89 2.89 0 0 1 2.924 2.924l-.01.89.636.622a2.89 2.89 0 0 1 0 4.134l-.637.622.011.89a2.89 2.89 0 0 1-2.924 2.924l-.89-.01-.622.636a2.89 2.89 0 0 1-4.134 0l-.622-.637-.89.011a2.89 2.89 0 0 1-2.924-2.924l.01-.89-.636-.622a2.89 2.89 0 0 1 0-4.134l.637-.622-.011-.89a2.89 2.89 0 0 1 2.924-2.924l.89.01.622-.636zM7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zm1.602-2.027c-.05.386-.218.627-.554.627-.377 0-.585-.317-.585-.745v-.11c0-.727.307-1.208.926-1.641.614-.44.822-.762.822-1.325 0-.638-.42-1.084-1.03-1.084-.55 0-.916.323-1.074.914-.109.364-.292.51-.564.51C6.203 6.12 6 5.873 6 5.48c0-.251.045-.468.139-.69.307-.798 1.079-1.29 2.099-1.29 1.341 0 2.262.902 2.262 2.227 0 .896-.376 1.511-1.05 1.986-.648.445-.806.726-.846 1.26z" />
</svg>
                     </c:when>
                  </c:choose>${chatdetail.chat_list_title }
               </h1>
               <h3>${chatdetail.chat_list_created_at }생성</h3>
            </div>


         </header>
         <ul id="chat">
            <c:forEach var="item" items="${lastestMsgList }">
               <c:choose>
                  <c:when test="${item.chat_msg_user_id == login_id }">
                     <li class="me">
                        <div class="entete">
                           <h3>${item.chat_msg_created_at }</h3>
                           <h2>${login_id }</h2>
                           <span class="status blue"></span>
                        </div>
                        <div class="triangle"></div>
                        <div class="message">${item.chat_msg_txt }</div>
                     </li>
                  </c:when>
                  <c:when test="${item.chat_msg_user_id != login_id}">
                     <li class="you">
                        <div class="entete">
                           <span class="status green"></span>
                           <h2>${item.chat_msg_user_id }</h2>
                           <h3>${item.chat_msg_created_at }</h3>
                        </div>
                        <div class="triangle"></div>
                        <div class="message">${item.chat_msg_txt }</div>
                     </li>
                  </c:when>
               </c:choose>


            </c:forEach>
             <p class="guide-txt" style="padding-left: 20px;">${login_id}님이 입장했습니다</p>  


         </ul>
         <footer>
            <div class="font-button-container ">
               <button type="button" class="bold" onclick="toggleBold()" style="width: 32px;">
                  <strong>B</strong>
               </button>
               <div class="font-color">
                  <button type="button" class="title" onclick="toggleColorList()">
                     <span>A</span>
                  </button>
                  <div id="colorListArea" class="color-list">
                     <button type="button" onclick="changeFontColor(this)" class="black">
                        <span style="background-color: black"></span>
                     </button>
                     <button type="button" onclick="changeFontColor(this)" class="gray">
                        <span style="background-color: gray"></span>
                     </button>
                     <button type="button" onclick="changeFontColor(this)" class="red">
                        <span style="background-color: red"></span>
                     </button>
                     <button type="button" onclick="changeFontColor(this)" class="orange">
                        <span style="background-color: orange"></span>
                     </button>
                     <button type="button" onclick="changeFontColor(this)" class="yellow">
                        <span style="background-color: yellow"></span>
                     </button>
                     <button type="button" onclick="changeFontColor(this)" class="green">
                        <span style="background-color: green"></span>
                     </button>
                     <button type="button" onclick="changeFontColor(this)" class="blue">
                        <span style="background-color: blue"></span>
                     </button>
                     <button type="button" onclick="changeFontColor(this)" class="navy">
                        <span style="background-color: navy"></span>
                     </button>
                     <button type="button" onclick="changeFontColor(this)" class="purple">
                        <span style="background-color: purple"></span>
                     </button>
                  </div>

               </div>

            </div>
            <textarea id="msgInput" placeholder="메세지를 입력하세요"></textarea>

            <button class="msg_send_btn" type="button" onclick="send();">Send</button>



         </footer>
      </main>
   </div>
</body>
</html>