<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    ex05_02.jsp
    
    1. 웹 애플리케이션 초기화 파라미터 읽어오기.
    ㄴ web.xml 설정
        ㄴ context-param 태그			사용자 계정명, 비밀번호, 업로드 경로
    ㄴ getInitParameter()
       getInitParameterNames()   
           
  </xmp>
  <%
  Enumeration<String> en = application.getInitParameterNames();
  while(en.hasMoreElements()){
	  String paramName = en.nextElement();
	  String paramValue = application.getInitParameter(paramName);
  %>
	파라미터 이름 = <%= paramName %> <br>  
	파라미터 값 = <%= paramValue %> <br>  
  <%
  }
  %>
  
  
  
</div>
</body>
</html>