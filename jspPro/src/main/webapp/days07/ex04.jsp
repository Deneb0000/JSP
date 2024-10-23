<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

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
    ex04.jsp
    p232 [ 세션 Session ]
    		ㄴ 상태 저장 	서버에 값을 저장한다 (쿠키는 브라우저에 값을 저장한다)
    		ㄴ 인증 처리할대 대부분 세션 사용
  </xmp>
  
  <%
  String sid = session.getId();
  
  long l = session.getCreationTime();
  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
  Date d = new Date();
  d.setTime(l);
  %>
  세션 ID = <%= sid %> <br />
  세션 생성 날짜 = <%= sdf.format(d) %> <br>
  <%
  long last = session.getLastAccessedTime();
	d.setTime(last);  
  %>
  세션 마지막 접속 날짜 = <%= sdf.format(d) %>
</div>
</body>
</html>