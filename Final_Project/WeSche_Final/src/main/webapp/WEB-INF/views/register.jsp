<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>WeSche - Register</title>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

function reg(){
	   swal("회원가입 완료!", "회원가입이 완료되었습니다!", "success")
	      .then((value) => {
	    	  document.regi.submit();
		});
}

function cancel(){
	   swal("회원가입 취소!", "회원가입을 취소했습니다!", "success")
	      .then((value) => {
	    	  location.href="login.do";
		});
}

</script>



<style type="text/css">
   .card-body{
      padding-top: 24px !important;
      top: 10px !important;
   }
   .container{
      padding-bottom: 0px !important;
   }
   .header-body{
      margin-bottom : 55px !important;
      padding-bottom: -40px !important;
   }
   .input-group{
      margin-bottom: 0px !important;
   }
   .form-group{
      margin-bottom: 0px !important;
   }
</style>
</head>

<body class="bg-default">
   <div class="main-content">
      <jsp:include page="LogReiNav.jsp" />
      <jsp:include page="LogReiHeader.jsp" />
      <!-- Page content -->
      <div class="container mt--8 pb-5">
         <!-- Table -->
         <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8">
               <div class="card bg-secondary shadow border-0">
                  <div class="card-body px-lg-5 py-lg-5">
                     <div class="text-center text-muted mb-4">
                        <small>Join   with   WESCHE</small>
                     </div>
                     <form role="form" method="post" name="regi">
                        <div class="form-group">
                           <div class="input-group input-group-alternative mb-3">
                              <div class="input-group-prepend">
                                 <span class="input-group-text"><i
                                    class="ni ni-email-83"></i></span>
                              </div>
                              <input class="form-control" id="memberid" placeholder="ID (4~12자리 이내 한글,숫자 혼합)" type="text">
                           </div>
                        </div>
                        <br>
                        <div class="text-muted">
                           <small id="hidetext"></small>
                        </div>
                        <br>
                        <div class="form-group">
                           <div class="input-group input-group-alternative">
                              <div class="input-group-prepend">
                                 <span class="input-group-text"><i
                                    class="ni ni-lock-circle-open"></i></span>
                              </div>
                              <input class="form-control" id="memberpw" placeholder="Password (8~15자리 이내 최소 숫자,특수문자,영문자 한 개 포함)"
                                 type="password">
                           </div>
                        </div>
                        <br>
                        <div class="text-muted">
                           <small id="hidetext1"></small>
                        </div>
                        <br>
                        <div class="form-group">
                           <div class="input-group input-group-alternative">
                              <div class="input-group-prepend">
                                 <span class="input-group-text"><i
                                    class="ni ni-lock-circle-open"></i></span>
                              </div>
                              <input class="form-control" id="memberregpwchk" placeholder="Password Check"
                                 type="password">
                           </div>
                        </div>
                        <br>
                        <div class="text-muted">
                           <small id="hidepw1"></small>
                        </div>
                        <br>
                        <div class="form-group">
                           <div class="input-group input-group-alternative mb-3">
                              <div class="input-group-prepend">
                                 <span class="input-group-text"><i class="ni ni-hat-3"></i></span>
                              </div>
                              <input class="form-control" id="name" placeholder="Name (한글 혹은 영어만)" type="text">
                           </div>
                        </div>
                        <br>
                        <div class="text-muted">
                           <small id="hidetext2"></small>
                        </div>
                        <br>
                        <div class="form-group">
                           <div class="input-group input-group-alternative mb-3">
                              <div class="input-group-prepend">
                                 <span class="input-group-text"><i
                                    class="ni ni-email-83"></i></span>
                              </div>
                              <input class="form-control" id="email" placeholder="Email (hongildong@WeSche.com)" type="email">
                           </div>
                        </div>
                        <br>
                        <div class="text-muted">
                           <small id="hidetext3"></small>
                        </div>
                        <br>
                        <div class="text-center">
                           <button type="button" id="regbt" onclick="reg()" class="btn btn-primary mt-4">Create</button>
                           <button type="button" onclick="cancel()" class="btn btn-primary mt-4">Cancel</button>
                        </div>
                     </form>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <jsp:include page="LogReiFooter.jsp" />
   </div>
   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <script type="text/javascript">
      $(function(){
         var count = 0;
         
         $('#memberid').blur(function(){
            
            if($('#memberid').val().length != 0){
            
            // id :  4~12자리 이내의 숫자와 문자 포함 형태
            var regExpId = /^[a-zA-Z0-9]{4,12}$/;
            
            var memberid = $('#memberid').val();
            
            //정규식을 만족 함
            if( regExpId.test(memberid)  == true){
               var allData = {"memberid": memberid};
               $.ajax({
                  url:"ajaxRegister.do", 
                  data : allData,
                  dataType : "json",
                  success : function(msg){
                              count = 0;
                              //null일 때 = 일치하는게 없을 때   
                              var valid = "valid";
                              
                              //일치하는 데이터가 없다
                              if(msg.valid == false){
                                 $('#hidetext').html("사용가능한 ID입니다.");
                                 $('#hidetext').css("color","blue");
                                 count = count + 1;
                              //일치하는 데이터가 있다.(사용 불가능)
                                 $('#regbt').click(function(){
                                    if(count == 1){
                                       var memberid = $('#memberid').val();
                                       var memberpw = $('#memberpw').val();
                                       var name = $('#name').val();
                                       var email = $('#email').val();
                                       
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
                                       form.setAttribute('action', "regchk.do");
                                       document.body.appendChild(form);
                                       
                                       form.submit();
                                    }
                                 });
                              
                              }else{
                                 count = 0;
                                 $('#memberid').text("");
                                 $('#hidetext').html("중복된 ID가 존재합니다.");
                                 $('#hidetext').css("color","red");
                                 $('#memberid').focus();
                                 console.log("중복된 ID 있을 때 : " + count);
                               }
                  },
                  error : function(msg){
                     alert("허공난무 ~ 흐미 실패닷!!!");
                  }
               });   
            //정규식을 만족 못 함.   
            }else{
               $('#memberid').text("");
               $('#hidetext').html("ID가 조건에 맞지 않습니다");
               $('#hidetext').css("color","red");
               $('#memberid').focus();
            }
         }
      });
         
         $('#memberpw').blur(function(){
            if($('#memberpw').val().length != 0){
            
            // pw : 8~15자리 이내의 최소 숫자 영문자 특수문자 1개씩이 포함된 형태
            var regExpPw =  /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[~!@#$%^&+=]).*$/;
         
            //패스워드가 정규식을 만족하지 않음.
            if(regExpPw.test($('#memberpw').val()) == false){
               $('#memberpw').text("");
               $('#hidetext1').html("PW가 조건에 맞지 않습니다");
               $('#hidetext1').css("color","red");
               $('#memberpw').focus();
            }else{
               $('#memberpw').text("");
               $('#hidetext1').html("적합한 타입의 PW입니다.");
               $('#hidetext1').css("color","blue");
            }
         }
         });
         
         $('#memberregpwchk').blur(function(){
            if($('#memberpw').val() == $('#memberregpwchk').val()){
               $('#hidepw1').html("PW가 일치합니다.");
               $('#hidepw1').css("color","blue");
            }else{
               $('#memberregpwchk').text("");
               $('#hidepw1').html("PW가 일치하지 않습니다.");
               $('#hidepw1').css("color","red");
               $('#memberregpwchk').focus();
            }
         });
         
         
         
         $('#name').blur(function(){
            if($('#name').val().length != 0){
            
            // name : 한글 , 영어만
            var regExpName = /^[가-힣a-zA-Z]+$/;
            
            //이름이 정규식을 만족하지 않음.
            if(regExpName.test($('#name').val()) == false){
               $('#name').text("");
               $('#hidetext2').html("NAME이 조건에 맞지 않습니다");
               $('#hidetext2').css("color","red");
               $('#name').focus();
            }else{
               $('#name').text("");
               $('#hidetext2').html("적합한 타입의 NAME입니다.");
               $('#hidetext2').css("color","blue");
            }
         
            
         }
         });
            
         $('#email').blur(function(){
            
            if($('#email').val().length != 0){
         
            // email : 일반적인 이메일 방식 
            var regExpEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
            
            //이메일이 정규식을 만족하지 않음.
            if(regExpEmail.test($('#email').val()) == false){
               $('#email').text("");
               $('#hidetext3').html("EMAIL이 조건에 맞지 않습니다");
               $('#hidetext3').css("color","red");
               $('#email').focus();
            }else{
               var allData = {"email": $('#email').val()};
               $.ajax({
                  method : 'post',
                  url:"ajaxemailchk.do", 
                  data : allData,
                  dataType : "json",
                  success : function(data){
                              if(data.valid == false){
                                 $('#email').text("");
                                 $('#hidetext3').html("중복된 Email이 존재합니다.");
                                 $('#hidetext3').css("color","red");
                                 $('#email').focus();
                              }else{
                                 $('#email').text("");
                                 $('#hidetext3').html("적합한 타입의 Email입니다.");
                                 $('#hidetext3').css("color","blue");
                              }
                  },
                  error : function(data){
                  }
               });   
            }
            }
         });
         
      });
   </script>
   
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