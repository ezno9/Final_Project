<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="./assets/css/jquery.mCustomScrollbar.css" />
<link rel="stylesheet" href="./assets/css/roboto.css">
<title>WeSche - Youtube</title>
<!-- Favicon -->
<link href="./assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="./assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="./assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="./assets/css/argon-dashboard.css?v=1.1.2" rel="stylesheet" />
<style type="text/css">
@import 'https://fonts.googleapis.com/css?family=Roboto';

h1 {
   margin: 20px auto 0;
   font-size: 20px;
   font-weight: 700;
   text-align: center;
}

.youtube {
   margin-top: 11% !important;
   box-sizing: border-box;
   margin: 20px auto;
   padding: 30px;
   width: 850px;
   /*border: 1px solid #ddd;
   background: #f5f5f5;*/
   font-family: "Roboto";
   font-size: 14px;
   overflow: hidden;
}

.youtube-selected {
   box-sizing: border-box;
   float: left;
   padding-right: 20px;
   width: 800px;
   height: 2400px;
   overflow: auto;
}

.youtube-selected::-webkit-scrollbar {
   display: none !important;
}

.youtube-selected iframe {
   display: block;
   width: 800px;
   height: 80%;
}

.youtube-selected .video-title {
   box-sizing: border-box;
   padding: 25px 20px;
   background: #fff;
   width: 30%;
   font-weight: bold;
   font-size: 17px;
   border-radius: 0 0 20px 20px;
   border-bottom: 2px solid #5E72E4;
   border-right: 2px solid #5E72E4;
   border-left: 2px solid #5E72E4;
}

.video-title {
   display: block;
   width: 800px !important;
}

@import
   url("https://fonts.googleapis.com/css?family=Raleway:400,700,900");

.search__title {
   font-size: 22px;
   font-weight: 900;
   text-align: center;
   color: #FFFFFF;
}

.search__input {
   color: white !important;
   display: block;
   margin: 0 auto;
   width: 50%;
   padding: 12px 24px;
   background-color: transparent;
   transition: transform 250ms ease-in-out;
   font-size: 14px;
   line-height: 18px;
   background-color: transparent;
   /*         background-image: url(http://mihaeltomic.com/codepen/input-search/ic_search_black_24px.svg); */
   background-image:
      url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='https://cpng.pikpng.com/pngl/s/54-544986_icon-free-image-search-button-png-white-clipart.png' width='24' height='24' viewBox='0 0 24 24'%3E%3Cpath d='M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z'/%3E%3Cpath d='M0 0h24v24H0z' fill='none'/%3E%3C/svg%3E");
   background-repeat: no-repeat;
   background-size: 18px 18px;
   background-position: 95% center;
   border-radius: 50px;
   border: 3px solid white;
   transition: all 250ms ease-in-out;
   backface-visibility: hidden;
   transform-style: preserve-3d;
}

.search__input::placeholder {
   color: white;
   text-transform: uppercase;
   letter-spacing: 1.5px;
   font-weight: bold;
}

.search__input:hover, .search__input:focus {
   padding: 12px 0;
   outline: 0;
   border: 1px solid transparent;
   border-bottom: 3px solid white;
   border-radius: 0;
   background-position: 100% center;
   font-weight: bold;
}

.credits__container {
   margin-top: 24px;
}

.credits__text {
   text-align: center;
   font-size: 13px;
   line-height: 18px;
}

.credits__link {
   color: #ff8b88;
   text-decoration: none;
   transition: color 250ms ease-in;
}

.credits__link:hover, .credits__link:focus {
   color: color(#ff8b88 blackness(25%));
}

.wrap-loading { /*화면 전체를 어둡게 합니다.*/
   position: fixed;
   left: 0;
   right: 0;
   top: 0;
   bottom: 0;
   background: rgba(0, 0, 0, 0.2); /*not in ie */
   filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000',
      endColorstr='#20000000'); /* ie */
}

.wrap-loading div { /*로딩 이미지*/
   position: fixed;
   top: 50%;
   left: 50%;
   margin-left: -21px;
   margin-top: -21px;
}

.display-none { /*감추기*/
   display: none;
}
}
</style>
</head>
<body class="">
   <jsp:include page="common.jsp" />
   <div class="main-content">
      <jsp:include page="Navbar.jsp" />
      <jsp:include page="header.jsp" />
      <div class="container-fluid mt--7" style="padding-left: 15px !important;">
         <!-- Table -->
         <div class="youtube">
            <div class="youtube-selected"></div>
         </div>
         <jsp:include page="footer.jsp" />
      </div>
   </div>
   <div class="wrap-loading display-none">
      <div>
         <img src="./assets/img/loading.gif" />
      </div>
   </div>
   <script type="text/javascript">
      $(function() {
         $('.youtube').hide();
         $('.footer').hide();

         $("#yousearch")
               .keydown(
                     function(key) {
                        if (key.keyCode == 13) {
                           searchval = $("#yousearch").val();
                           $('.youtube').show();
                           $('.footer').show();

                           $
                                 .ajax({
                                    dataType : "json",
                                    url : 'https://www.googleapis.com/youtube/v3/search'
                                          + '?part=snippet'
                                          + '&maxResults=30'
                                          + '&order=viewCount'
                                          + '&q='
                                          + searchval
                                          + '&type=video'
                                          + '&videoDefinition=high'
                                          + '&key=AIzaSyALqAQAwQQRyCl3e3AIZqAI30L4yNXbxqU',
                                    beforeSend : function() {
                                       $('.wrap-loading')
                                             .removeClass(
                                                   'display-none');
                                    },
                                    complete : function() {
                                       $('.wrap-loading')
                                             .addClass(
                                                   'display-none');
                                    },
                                    success : function(data) {
                                       if (data.items.length > 10) {
                                          for (var i = 0; i < data.items.length; i++) {
                                             var adddiv = $("<div>");
                                             adddiv.css(
                                                   "height",
                                                   600);
                                             adddiv.css("width",
                                                   800);
                                             adddiv
                                                   .addClass("iframe"
                                                         + i);
                                             adddiv
                                                   .append("<div id='youtube-player"+i+"'></div>");
                                             adddiv
                                                   .append("<div id='video-title"+i+"' class='video-title'></div>");
                                             $(
                                                   ".youtube-selected")
                                                   .append(
                                                         adddiv);
                                             $(
                                                   ".youtube-selected")
                                                   .append(
                                                         "<br><br>");
                                          }
                                          //iframe을 사용해보겠다.
                                          var tag = document
                                                .createElement('script');
                                          tag.src = "https://www.youtube.com/iframe_api";
                                          var firstScriptTag = document
                                                .getElementsByTagName('script')[0];
                                          firstScriptTag.parentNode
                                                .insertBefore(
                                                      tag,
                                                      firstScriptTag);
                                          var player;

                                          for (var i = 0; i < data.items.length; i++) {
                                             var iframeid = 'youtube-player'
                                                   + i;
                                             var youtubeurl = "https://www.youtube.com/embed/";
                                             youtubeurl = youtubeurl
                                                   + data["items"][i]["id"]["videoId"];
                                             var j = parseInt(i + 1);
                                             youtubeurl = youtubeurl
                                                   + "?enablejsapi=1&origin=http%3A%2F%2Flocalhost%3A8787&widgetid="
                                                   + j;
                                             $("#" + iframeid)
                                                   .attr(
                                                         "src",
                                                         youtubeurl);
                                             document
                                                   .getElementById(iframeid).src = document
                                                   .getElementById(iframeid).src;
                                          }

                                          onYouTubeIframeAPIReady = function(
                                                event) {
                                             for (var i = 0; i < data.items.length; i++) {
                                                var iframeid = 'youtube-player'
                                                      + i;
                                                player = new YT.Player(
                                                      iframeid,
                                                      {
                                                         videoId : data.items[i].id.videoId
                                                      });
                                             }
                                          }
                                          for (var i = 0; i < data.items.length; i++) {
                                             $(
                                                   '#video-title'
                                                         + i)
                                                   .text(
                                                         data.items[i].snippet.title);
                                          }
                                          /*  $('.youtube-selected').mCustomScrollbar({theme: "dark"});  */
                                          $('script:eq(0)')
                                                .remove();

                                          for (var i = 10; i < data.items.length; i++) {
                                             var iframeclass = 'iframe'
                                                   + i;
                                             var iframeid = 'youtube-player'
                                                   + i;
                                             $("." + iframeclass)
                                                   .addClass(
                                                         "nonedisplay")
                                                   .hide();
                                             $('#' + iframeid)
                                                   .hide();
                                             $(
                                                   '#video-title'
                                                         + i)
                                                   .hide();
                                          }

                                       } else {
                                          for (var i = 0; i < data.items.length; i++) {
                                             var adddiv = $("<div>");
                                             adddiv.css(
                                                   "height",
                                                   200);
                                             adddiv.css("width",
                                                   800);
                                             adddiv
                                                   .append("<div id='youtube-player"+i+"'></div>");
                                             adddiv
                                                   .append("<div id='video-title"+i+"' class='video-title'></div>");
                                             $(
                                                   ".youtube-selected")
                                                   .append(
                                                         adddiv);
                                             $(
                                                   ".youtube-selected")
                                                   .append(
                                                         "<br><br>");
                                          }
                                          //iframe을 사용해보겠다.
                                          var tag = document
                                                .createElement('script');
                                          tag.src = "https://www.youtube.com/iframe_api";
                                          var firstScriptTag = document
                                                .getElementsByTagName('script')[0];
                                          firstScriptTag.parentNode
                                                .insertBefore(
                                                      tag,
                                                      firstScriptTag);
                                          var player;

                                          for (var i = 0; i < data.items.length; i++) {
                                             var iframeid = 'youtube-player'
                                                   + i;
                                             var youtubeurl = "https://www.youtube.com/embed/";
                                             youtubeurl = youtubeurl
                                                   + data["items"][i]["id"]["videoId"];
                                             var j = parseInt(i + 1);
                                             youtubeurl = youtubeurl
                                                   + "?enablejsapi=1&origin=http%3A%2F%2Flocalhost%3A8787&widgetid="
                                                   + j;
                                             $("#" + iframeid)
                                                   .attr(
                                                         "src",
                                                         youtubeurl);
                                             document
                                                   .getElementById(iframeid).src = document
                                                   .getElementById(iframeid).src;
                                          }

                                          onYouTubeIframeAPIReady = function(
                                                event) {
                                             for (var i = 0; i < data.items.length; i++) {
                                                var iframeid = 'youtube-player'
                                                      + i;
                                                player = new YT.Player(
                                                      iframeid,
                                                      {
                                                         videoId : data.items[i].id.videoId
                                                      });
                                             }
                                          }
                                          for (var i = 0; i < data.items.length; i++) {
                                             $(
                                                   '#video-title'
                                                         + i)
                                                   .text(
                                                         data.items[i].snippet.title);
                                          }
                                          /*  $('.youtube-selected').mCustomScrollbar({theme: "dark"});  */
                                          $('script:eq(0)')
                                                .remove();
                                       }
                                    },
                                    error : function() {

                                    }
                                 });
                        }
                     });

         $(window).scroll(function() {
            var totalheight = $(document).height();
            var nowheight = $(window).height();
            var topheight = $(window).scrollTop();

            if (topheight + nowheight >= totalheight - 500) {

               var dindex = $("div[class*=nonedisplay]").length;
               console.log("dindex: " + dindex);
               if (dindex > 10) {
                  $(".youtube-selected").animate({
                     height : '4800px'
                  });

                  for (var i = 0; i < 10; i++) {
                     var j = i + 10;
                     console.log("i:" + j);
                     var iframeclass = 'iframe' + j;
                     var iframeid = 'youtube-player' + j;
                     $("." + iframeclass).removeClass("nonedisplay");
                     $("." + iframeclass).show();
                     $('#' + iframeid).show();
                     $('#video-title' + j).show();
                  }
               } else {
                  $(".youtube-selected").animate({
                     height : '19500px'
                  });
                  for (var i = 0; i < dindex; i++) {
                     var j = i + 20;
                     var iframeclass = 'iframe' + j;
                     var iframeid = 'youtube-player' + j;
                     $("." + iframeclass).removeClass("nonedisplay");
                     $("." + iframeclass).show();
                     $('#' + iframeid).show();
                     $('#video-title' + j).show();

                  }

               }

            }
         });

      });
   </script>
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
   <script src="./assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
   <!--   Core   -->
   <script src="./assets/js/plugins/jquery/dist/jquery.min.js"></script>
   <script src="./assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
   <!--   Optional JS   -->
   <script src="./assets/js/plugins/chart.js/dist/Chart.min.js"></script>
   <script src="./assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
   <!--   Argon JS  -->
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