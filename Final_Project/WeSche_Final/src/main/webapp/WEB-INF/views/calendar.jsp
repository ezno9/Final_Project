<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.edu.mvc.model.dto.MemberDto"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>WeSche</title>

<link rel="stylesheet" href="./assets/css/fullcalendar.min.css" />
<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href='./assets/css/select2.min.css' />
<link rel="stylesheet"
   href='./assets/css/bootstrap-datetimepicker.min.css' />

<link rel="stylesheet"
   href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet"
   href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet" href="./assets/css/main.css">

</head>

<body>
   <div class="container">

      <!-- 일자 클릭시 메뉴오픈 -->
      <div id="contextMenu" class="dropdown clearfix">
         <ul class="dropdown-menu dropNewEvent" role="menu"
            aria-labelledby="dropdownMenu"
            style="display: block; margin-bottom: 5px;">
            <li><a tabindex="-1" href="#">일정추가</a></li>
            <li class="divider"></li>
            <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
         </ul>
      </div>

      <div id="wrapper">
         <div id="loading"></div>
         <div id="calendar"></div>
      </div>


      <!-- 일정 추가 MODAL -->
      <div class="modal fade" tabindex="-1" role="dialog" id="eventModal">
         <div class="modal-dialog" role="document">
            <div class="modal-content">
               <div class="modal-header">
                  <h4 class="modal-title"></h4>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                     <span aria-hidden="true">&times;</span>
                  </button>
               </div>
               <div class="modal-body">

                  <div class="row">
                     <div class="col-xs-12">
                        <label class="col-xs-4" for="edit-title">일정명</label> <input
                           class="inputModal" type="text" name="edit-title"
                           id="edit-title" required="required" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-xs-12">
                        <label class="col-xs-4" for="edit-start">시작</label> <input
                           class="inputModal" type="text" name="edit-start"
                           id="edit-start" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-xs-12">
                        <label class="col-xs-4" for="edit-end">끝</label> <input
                           class="inputModal" type="text" name="edit-end" id="edit-end" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-xs-12">
                        <label class="col-xs-4" for="edit-type">구분</label> 
                        <select class="inputModal" type="text" name="edit-type" id="edit-type">
                           <option value="개인" selected="selected">개인</option>
				<c:forEach items="${studylistbyking }" var="studylistbyking">
							<option value="${studylistbyking.chat_list_no }">${studylistbyking.chat_list_title }</option>
				</c:forEach>
                        
                        </select>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-xs-12">
                        <label class="col-xs-4" for="edit-color">색상</label> <select
                           class="inputModal" name="color" id="edit-color">
                           <option value="#D25565" style="color: #D25565;">빨간색</option>
                           <option value="#9775fa" style="color: #9775fa;">보라색</option>
                           <option value="#ffa94d" style="color: #ffa94d;">주황색</option>
                           <option value="#74c0fc" style="color: #74c0fc;">파란색</option>
                           <option value="#f06595" style="color: #f06595;">핑크색</option>
                           <option value="#63e6be" style="color: #63e6be;">연두색</option>
                           <option value="#a9e34b" style="color: #a9e34b;">초록색</option>
                           <option value="#4d638c" style="color: #4d638c;">남색</option>
                           <option value="#495057" style="color: #495057;">검정색</option>
                        </select>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-xs-12">
                        <label class="col-xs-4" for="edit-desc">설명</label>
                        <textarea style="resize:none;" rows="4" cols="50" class="inputModal" name="edit-desc" id="edit-desc"></textarea>
                     </div>
                  </div>
               </div>
               <div class="modal-footer modalBtnContainer-addEvent">
                  <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                  <button type="button" class="btn btn-primary" id="save-event">저장</button>
               </div>
               <div class="modal-footer modalBtnContainer-modifyEvent">
                  <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                  <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                  <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
               </div>
            </div>
            <!-- /.modal-content -->
         </div>
         <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
   </div>
   <!-- /.container -->
   <script src="./assets/js/calendar/moment.min.js"></script>
   <script src="./assets/js/calendar/fullcalendar.min.js"></script>
   <script src="./assets/js/calendar/bootstrap.min.js"></script>
   <script src="./assets/js/calendar/bootstrap-datetimepicker.min.js"></script>
   <script src="./assets/js/calendar/select2.min.js"></script>
   <script src="./assets/js/calendar/addEvent.js"></script>
   <script src="./assets/js/calendar/editEvent.js"></script>
   <script src="./assets/js/calendar/etcSetting.js"></script>
   <script src="./assets/js/calendar/ko.js"></script>
   <script src="./assets/js/calendar/main.js"></script>
</body>
</html>