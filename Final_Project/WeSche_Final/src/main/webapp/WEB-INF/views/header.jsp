<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <!-- Header -->
   <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
      <div class="container-fluid"></div>
      <%
         if(request.getRequestURI().indexOf("youtube") != -1){
      %>
      <div class="search__container">
         <p class="search__title">Search for Youtube</p>
         <input class="search__input" type="text" placeholder="Search"
            id="yousearch">
      </div>
      <%
         }
      %>
      
      
      <%
         if(request.getRequestURI().indexOf("mypage") != -1){
      %>
      <div class="search__container">
         <p class="search__title">my page</p>
         <input class="search__input" type="text" placeholder="Search"
            id="yousearch">
      </div>
      <%
         }
      %>
      
      
   </div>
</body>
</html>