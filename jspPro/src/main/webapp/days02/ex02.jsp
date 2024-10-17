<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google" content="notranslate">
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">ddd Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
    상대경로	x
    절대경로	x		도메인 뒤에부터 경로를 잡는다
    
    http://localhost/jspPro/days02/ex01_02.jsp
    ->	/jspPro/days02/ex01_02.jsp
    	webapp
    	/jspPro context path 하나하나 웹사이트를 구별하기 위한
  </xmp>
  
  <%
  String contextPath = request.getContextPath();
  %>
  
  context path = <%= contextPath %>
  <br>
  <img alt="" src="<%= contextPath%> /imges/item01.jpg">
</div>
</body>
</html>