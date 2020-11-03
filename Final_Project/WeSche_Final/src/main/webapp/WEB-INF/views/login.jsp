<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.edu.mvc.model.dto.MemberDto"%>
<%
   response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>WeSche - Login</title>
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
<link rel="stylesheet"
   href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css" />
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<style>
/* The Modal (background) */
.searchModal {
   display: none; /* Hidden by default */
   position: fixed; /* Stay in place */
   z-index: 10; /* Sit on top */
   left: 0;
   top: 0;
   width: 100%; /* Full width */
   height: 100%; /* Full height */
   overflow: auto; /* Enable scroll if needed */
   background-color: rgb(0, 0, 0); /* Fallback color */
   background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
/* Modal Content/Box */
.search-modal-content {
   background-color: #fefefe;
   margin: 15% auto; /* 15% from the top and centered */
   padding: 20px;
   border: 1px solid #888;
   width: 500px; /* Could be more or less, depending on screen size */
   padding-bottom: 0px;
   padding-top: 0px;
   height: 500px;
}

#fidbt:hover {
   pointer: cursor;
}

#fpwbt:hover {
   pointer: cursor;
}
#chgpwbt{
}
</style>
</head>
<body class="bg-default">
   <div class="main-content">
      <jsp:include page="LogReiNav.jsp" />
      <jsp:include page="LogReiHeader.jsp" />
      <!-- Page content -->
      <div class="container mt--8 pb-5">
         <div class="row justify-content-center">
            <div class="col-lg-5 col-md-7">
               <div class="card bg-secondary border-0">
                  <div id="bodydiv">
                     <div class="card-body px-lg-5 py-lg-5">
                        <div class="text-center text-muted mb-4">
                           <small>Join with WESCHE</small>
                        </div>

                        <!-- ------------------------------------------------------------------------------------------------- -->
                        <!-- modal을 통한 ID/PW찾기 화면 구성 -->

                        <div id="modal" class="searchModal">
                           <div class="" style="background-color: #fefefe; margin: 15% auto; padding: 40px 20px 40px 20px;border: 1px solid #888; width: 500px; border-radius: 0.375rem;">
                              <div class="row">
                                 <div class="input-group input-group-alternative">
                                    <div id="fidbt" class="togglebtn active"
                                       style="font-weight: bold; font-size: 18px;float: left;text-align: center;padding-top: 8px;padding-bottom: 10px;border: 2px solid #5e72e4;border-radius: 0.325rem;width: 248px !important;height: 48px !important;">Find ID</div>
                                    <div id="fpwbt" class="togglebtn"
                                       style="font-weight: bold; font-size: 18px;float: left;text-align: center;padding-top: 8px;padding-bottom: 10px;border: 2px solid #5e72e4;border-radius: 0.325rem;width: 240px !important;height: 48px !important;">Find PW</div>
                                 </div>
                                 <div class="col-sm-12">
                                    <div class="row">
                                       <div class="col-sm-12"
                                          style="border-radius: 20% !important; border: 1px !important;">
                                          <br>
                                          <div id="fid">

                                             <!-- ID찾기 -------------------------------------------------------------------------------------------------->
                                             <form role="form" action="Findid.do" method="post">
                                                <div class="form-group">
                                                   <div class="input-group input-group-alternative mb-3">
                                                      <div class="input-group-prepend">
                                                         <span class="input-group-text"><i
                                                            class="ni ni-hat-3"></i></span>
                                                      </div>
                                                      <input class="form-control" id="fname"
                                                         placeholder="계정 이름을 입력해 주세요." type="text" name="name">
                                                   </div>
                                                </div>
                                                <div class="">
                                                   <div class="input-group input-group-alternative">
                                                      <div class="input-group-prepend">
                                                        <span class="input-group-text"><i
                                    						class="ni ni-email-83"></i></span>
                                                      </div>
                                                      <input class="form-control" id="femail"
                                                         placeholder="이메일을 입력해 주세요." type="email" name="email">
                                                   </div>
                                                </div>
                                                <div class="text-muted">
                                                   <small id="idhide"></small>
                                                </div>
                                                <div class="text-center" style="margin-top: 19px;">
                                                   <button type="button" id="FID"
                                                      class="btn btn-primary">Find</button>
                                                
                                                   <span class="btn btn-primary pop_bt modalCloseBtn closeModal">Close</span>
                                                </div>

                                             </form>
                                          </div>

                                          <div id="totalform">
                                             <div id="fpw">

                                                <!-- PW찾기 --------------------------------------------------------------------------------------------->
                                                <form role="form" action="Findpw.do" method="post">
                                                   <div class="form-group">
                                                      <div class="input-group input-group-alternative mb-3">
                                                         <div class="input-group-prepend">
                                                            <span class="input-group-text"><i
                                    							class="ni ni-email-83"></i></span>
                                                         </div>
                                                         <input class="form-control" id="pwid"
                                                            placeholder="계정 아이디를 입력해 주세요." type="text" name="id">
                                                      </div>
                                                   </div>
                                                   <div class="">
                                                      <div class="input-group input-group-alternative">
                                                         <div class="input-group-prepend">
                                                            <span class="input-group-text"><i
                                    							class="ni ni-email-83"></i></span>
                                                         </div>
                                                         <input class="form-control" id="pwemail"
                                                            placeholder="이메일을 입력해 주세요." type="email" name="email">
                                                      </div>
                                                   </div>
                                                   <div class="text-muted">
                                                      <small id="pwhide"></small>
                                                   </div>
                                                   <div class="text-center" style="margin-top: 19px;">
                                                      <button type="button" id="FPW"
                                                         class="btn btn-primary">Find</button>
                                                         
                                                      <span class="btn btn-primary pop_bt modalCloseBtn closeModal">Close</span>
                                                         
                                                   </div>
                                                </form>
                                             </div>

                                             <div id="chgpw">
                                                <!-- PW 재설정 form ------------------------------------------------------------------------------------>
                                                <form role="form" action="changepw.do" method="post">
                                                   <div class="">
                                                      <div class="input-group input-group-alternative">
                                                         <div class="input-group-prepend">
                                                             <span class="input-group-text"><i
                                   								class="ni ni-lock-circle-open"></i></span>
                                                         </div>
                                                         <input class="form-control" id="newpw"
                                                            placeholder="new Password (8~15자리 이내,특수문자,영문자 포함)" type="password"
                                                            name="PW">
                                                      </div>
                                                   </div>
                                                   <div class="text-muted">
                                                      <small id="pwreg"></small>
                                                   </div>
                                                   <br>
                                                   <div class="">
                                                      <div class="input-group input-group-alternative">
                                                         <div class="input-group-prepend">
                                                            <span class="input-group-text"><i
                                    							class="ni ni-lock-circle-open"></i></span>
                                                         </div>
                                                         <input class="form-control" id="chkpw"
                                                            placeholder="Check new Password" type="password"
                                                            name="newPW">
                                                      </div>
                                                   </div>
                                                   <div class="text-muted">
                                                      <small id="chkpwreg"></small>
                                                   </div>
                                                   <div class="text-center" style="margin-top: 19px;">
                                                      <button type="button" id="chgpwbt"
                                                         class="btn btn-primary ">Change</button>
                                                         
                                                      <span class="btn btn-primary pop_bt modalCloseBtn closeModal">Close</span>
                                                   </div>
                                                </form>
                                             </div>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>

                        <!-- ------------------------------------------------------------------------------------------------- -->

                        <form role="form" action="loginchk.do" method="post">
                           <div class="form-group">
                              <div class="input-group input-group-alternative mb-3">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="ni ni-hat-3"></i></span>
                                 </div>
                                 <input class="form-control" id="memberid" placeholder="ID"
                                    type="text" name="memberid">
                              </div>
                           </div>
                           <div class="form-group">
                              <div class="input-group input-group-alternative">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text"><i
                                       class="ni ni-lock-circle-open"></i></span>
                                 </div>
                                 <input class="form-control" id="memberpw"
                                    placeholder="Password" type="password" name="password">
                              </div>
                           </div>

                           <div class="text-center">
                              <button type="button" id="accessbt"
                                 class="btn btn-primary my-4">Sign in</button>
                           </div>
                           <div class="text-muted">
                              <small id="pwhide"></small>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
               <div class="row mt-3">
                  <div class="col-6">
                     <a href="#" id="FindSome" class="text-light"><small>Forgot
                           ID or Password?</small></a>
                  </div>
                  <div class="col-6 text-right">
                     <a href='register.do' class="text-light"><small>Create
                           new account</small></a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <jsp:include page="LogReiFooter.jsp" />
   </div>
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script type="text/javascript">
      $(function() {

         var x = document.getElementById("fid");
         var y = document.getElementById("fpw");
         var z = document.getElementById("btn");
         var size = document.getElementById("size");

         $('#fidbt').click(function() {
            $('#fpwbt').css("border", "0");
            $('#fpw').hide();
            $('#chgpw').hide();
            $('#fid').fadeIn();
            $('#fidbt').css("border", "2px solid #5e72e4");
         });

         $('#fpwbt').click(function() {
            $('#fidbt').css("border", "0");
            $('#fpw').fadeIn();
            $('#fid').hide();
            $('#chgpw').hide();
            $('#fpwbt').css("border", "2px solid #5e72e4");
         });

         $('#FID').click(function() {
                        var fname = $('#fname').val();
                        var femail = $('#femail').val();
                        var allData = {
                           "fname" : fname,
                           "femail" : femail
                        };
                        $.ajax({
                                 url : "memberidchk.do",
                                 type : "POST",
                                 data : allData,
                                 dataType : "json",
                                 success : function(msg) {

                                    //일치하는 데이터가 없다
                                    if (msg.valid == false) {
                                       $('#idhide').text("");
                                       $('#idhide').html("입력한 정보가 틀렸거나 일치하는 계정이 없습니다. 다시 입력해주세요.");
                                       $('#idhide').css("color","red");
                                       $('#fname').text("");
                                       $('#email').text("");
                                       $('#fname').focus();

                                       //일치하는 데이터가 있다.
                                    } else {
                                       var ldtoid = msg.ldto.memberid;
                                       var popupx = (document.body.offsetWidth / 2) - 150;
                                       var popupy = (window.screen.height / 2) - 100;
                                       var status = "toolbar=no,location=no,status=no,resizable=no,menubar=no,width=300,height=200,left="
                                             + popupx
                                             + ",top="
                                             + popupy;
                                       window.open("",
                                             "openPopEvent",
                                             status);
                                       var newform = $('<form>');
                                       newform.attr('name',
                                             'newform');
                                       newform.attr('method',
                                             'post');
                                       newform.attr('action',
                                             "idfind.do");
                                       newform.attr('target',
                                             "openPopEvent");
                                       var input1 = $('<input>');
                                       input1.attr('name',
                                             'ldtoid');
                                       input1
                                             .attr('value',
                                                   ldtoid);
                                       newform.append(input1);
                                       newform.appendTo('body');
                                       newform.submit();

                                    }
                                 },
                                 error : function(msg) {
                                 }
                              });
                     });

         $('#FPW').click(function() {
            var pwid = $('#pwid').val();
            var pwemail = $('#pwemail').val();
            var allData = {
               "pwid" : pwid,
               "pwemail" : pwemail
            };

            $.ajax({
               url : "memberpwchk.do",
               type : "POST",
               data : allData,
               dataType : "json",
               success : function(msg) {
                  //일치하는 데이터가 없다
                  if (msg.valid == false) {
                     $('#pwhide').text("");
                     $('#pwhide').html("입력한 정보가 틀렸거나 일치하는 계정이 없습니다. 다시 입력해주세요.");
                     $('#pwhide').css("color", "red");
                     $('#fname').text("");
                     $('#email').text("");
                     $('#fname').focus();

                     //일치하는 데이터가 있다.
                  } else {
                     $('#fpw').slideUp(600);
                     $('#chgpw').slideDown(600);
                  }

               },
               error : function(msg) {
               }
            });
         });
         
         //pw변경창에 변화가 생길때 함수 실행
         $('#newpw').blur(function(){
            if($('#chgpw').css('display') != "none"){
               // pw : 8~15자리 이내의 최소 숫자 영문자 특수문자 1개씩이 포함된 형태
               var regExpPw =  /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[~!@#$%^&+=]).*$/;
            
               //패스워드가 정규식을 만족하지 않음.
               if(regExpPw.test($('#newpw').val()) == false){
                  $('#newpw').text("");
                  $('#pwreg').html("PW가 조건에 맞지 않습니다.");
                  $('#pwreg').css("color","red");
                  $('#newpw').focus();
               }else{
                     $('#pwreg').html("적합한 타입의 PW입니다.");
                     $('#pwreg').css("color","blue");
               }
            }   
         });
         
         //pw체크창에 변화가 생길때 함수 실행
         $('#chkpw').blur(function(){
            if($('#chgpw').css('display') != "none"){
               if($('#chkpw').val() != ""){
                  var newpw = $('#newpw').val();
                  var chkpw = $('#chkpw').val();
                  if((newpw != chkpw)){
                     $('#chkpw').text("");
                     $('#chkpwreg').html("PW가 일치하지않습니다.");
                     $('#chkpwreg').css("color","red");
                  }else{
                        $('#chkpwreg').html("PW가 일치합니다.");
                        $('#chkpwreg').css("color","blue");
                  }
               }else{
                  $('#chkpw').text("");
                  $('#chkpwreg').html("new PW부터 입력해주세요.");
                  $('#chkpwreg').css("color","red");
                  $('#chkpw').focus();
               }
            }   
         });
         
         $("#chkpw").on("propertychange change keyup paste input", function(){
            if($('#newpw').val() == ""){
               $('#newpw').focus();
               $('#chkpw').val("");
            }
         });
         
         
         $('#chgpwbt').click(function(){
            
            if($('#chkpwreg').text() == "PW가 일치합니다." && $('#pwreg').text() == "적합한 타입의 PW입니다."){
               var id = $('#pwid').val(); 
               var pw = $('#newpw').val();
               var allData = {
                  "id" : id,   
                  "pw" : pw
               };
               $.ajax({
                  url : "pwchange.do",
                  type : "POST",
                  data : allData,
                  dataType : "json",
                  success : function() {
                     $('#chbtpw').html("변경완료");
                     $('#chbtpw').css("color","blue");
                     setTimeout(function() { 
                     $('.closeModal').click();
                     }, 1000);
                  },
                  error : function() {
                  }
               });
                  
            }else{
               $('#chbtpw').html("값이 없거나 서로 일치하지 않습니다.");
               $('#chbtpw').css("color","red");
            }
         });
         
         $("#FindSome").click(function() {
            $('#fidbt').click();
            $('#modal').slideDown(300);
         });

         $(".closeModal").click(function() {
            $('#fidbt').click();
            $('#modal').slideUp(300);
            $('#chkpw').val("");
            $('#fname').val("");
            $('#email').val("");
            $('#pwid').val("");
            $('#pwemail').val("");
            $('#newpw').val("");
            
         });

         $("#memberid").keydown(function(key) {
            if (key.keyCode == 13) {
               var mid = $('#memberid').val();
               var mpw = $('#memberpw').val();
               if (mid == "" || mpw == "") {
                  $('#hidetext').text("");
                  $('#memberid').val("");
                  $('#memberpw').val("");
                  $('#memberid').focus();
                  $('.bg-secondary').css('z-index', '2');
                  $('.bg-secondary').animate({
                     'left' : '-10px'
                  }, 70);
                  $('.bg-secondary').animate({
                     'left' : '10px'
                  }, 70);
                  $('.bg-secondary').animate({
                     'left' : '-10px'
                  }, 70);
                  $('.bg-secondary').animate({
                     'left' : '10px'
                  }, 70);
                  $('.bg-secondary').animate({
                     'left' : '-10px'
                  }, 70);
                  $('.bg-secondary').animate({
                     'left' : '0px'
                  }, 70);
                  $('.bg-secondary').css('z-index', '0');

                  $('#hidetext').css('color', 'red');
                  $('#hidetext').html("<br>ID나 PW를 제대로 입력해주세요");
                  setTimeout(function() {
                     $('#hidetext').html("");
                  }, 2000);
               } else {
                  $('#accessbt').click();
               }

            }
         });

         $("#memberpw").keydown(function(key) {
            if (key.keyCode == 13) {
               var mid = $('#memberid').val();
               var mpw = $('#memberpw').val();
               if (mid == "" || mpw == "") {
                  $('#hidetext').text("");
                  $('#memberid').val("");
                  $('#memberpw').val("");
                  $('#memberid').focus();
                  $('.bg-secondary').css('z-index', '2');
                  $('.bg-secondary').animate({
                     'left' : '-10px'
                  }, 70);
                  $('.bg-secondary').animate({
                     'left' : '10px'
                  }, 70);
                  $('.bg-secondary').animate({
                     'left' : '-10px'
                  }, 70);
                  $('.bg-secondary').animate({
                     'left' : '10px'
                  }, 70);
                  $('.bg-secondary').animate({
                     'left' : '-10px'
                  }, 70);
                  $('.bg-secondary').animate({
                     'left' : '0px'
                  }, 70);
                  $('.bg-secondary').css('z-index', '0');

                  $('#hidetext').css('color', 'red');
                  $('#hidetext').html("<br>ID나 PW를 제대로 입력해주세요");
                  setTimeout(function() {
                     $('#hidetext').html("");
                  }, 2000);
               } else {
                  $('#accessbt').click();
               }

            }
         });

         $('#accessbt').click(
               function() {
                  var mid = $('#memberid').val();
                  var mpw = $('#memberpw').val();
                  mid = String(mid);
                  mpw = String(mpw);
                  var allData = {
                     "memberid" : mid,
                     "memberpw" : mpw
                  };

                  $.ajax({
                     url : "ajaxLogin.do",
                     type : "POST",
                     data : allData,
                     dataType : "json",
                     success : function(msg) {
                        //null일 때 = 일치하는게 없을 때   
                        var valid = "valid";

                        //일치하는 데이터가 없다
                        if (msg.valid == false) {
                           $('#hidetext').text("");
                           $('#memberid').val("");
                           $('#memberpw').val("");
                           $('#memberid').focus();
                           $('.bg-secondary').css('z-index', '2');
                           $('.bg-secondary').animate({
                              'left' : '-10px'
                           }, 70);
                           $('.bg-secondary').animate({
                              'left' : '10px'
                           }, 70);
                           $('.bg-secondary').animate({
                              'left' : '-10px'
                           }, 70);
                           $('.bg-secondary').animate({
                              'left' : '10px'
                           }, 70);
                           $('.bg-secondary').animate({
                              'left' : '-10px'
                           }, 70);
                           $('.bg-secondary').animate({
                              'left' : '0px'
                           }, 70);
                           $('.bg-secondary').css('z-index', '0');

                           $('#hidetext').css('color', 'red');
                           $('#hidetext').html(
                                 "<br>ID 혹은 PW를 잘못 치셨거나 없는 계정입니다.");
                           setTimeout(function() {
                              $('#hidetext').html("");
                           }, 2000);

                           //일치하는 데이터가 있다.
                        } else {
                           var memberid = msg.mdto["memberid"];
                           var memberpw = msg.mdto["memberpw"];
                           var name = msg.mdto["name"];
                           var email = msg.mdto["email"];

                           var form = document.createElement('form');
                           var obj1;
                           obj1 = document.createElement('input');
                           obj1.setAttribute('type', 'hidden');
                           obj1.setAttribute('name', 'memberid');
                           obj1.setAttribute('value', memberid);

                           var obj2;
                           obj2 = document.createElement('input');
                           obj2.setAttribute('type', 'hidden');
                           obj2.setAttribute('name', 'memberpw');
                           obj2.setAttribute('value', memberpw);

                           var obj3;
                           obj3 = document.createElement('input');
                           obj3.setAttribute('type', 'hidden');
                           obj3.setAttribute('name', 'name');
                           obj3.setAttribute('value', name);

                           var obj4;
                           obj4 = document.createElement('input');
                           obj4.setAttribute('type', 'hidden');
                           obj4.setAttribute('name', 'email');
                           obj4.setAttribute('value', email);

                           form.appendChild(obj1);
                           form.appendChild(obj2);
                           form.appendChild(obj3);
                           form.appendChild(obj4);
                           form.setAttribute('method', 'post');
                           form.setAttribute('action', "logind.do");
                           document.body.appendChild(form);

                           form.submit();

                        }

                     },
                     error : function(msg) {
                     }
                  });

               });
      });
   </script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
   <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
   <!--   Core   -->
   <script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
   <script
      src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
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