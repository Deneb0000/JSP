<%@page import="java.util.Date"%>
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
    ex06_04.jsp
    jsp:useBean 액션 태그로 자바빈 객체를 사용하겠다
    프로젝트때 쓸까요?
    안써요. 하지만 스프링때 유용할수 있어서 있구나~ 하기
  </xmp>
  
  <%
  String id = request.getParameter("id");
  String name = request.getParameter("name");
  String passwd = request.getParameter("passwd");
  String email = request.getParameter("email");
  %>
  
  <!-- MemberInfo mi = new MemberInfo(); 이거랑 똑같음-->
  <jsp:useBean id="mi" class="days06.MemberInfo" scope="page"></jsp:useBean>
  <!-- mi.setId(id); -->
  <jsp:setProperty property="id" name="mi" value="<%= id %>"/> 	<!-- id = setId -->
  <jsp:setProperty property="name" name="mi" value="<%= name %>"/>
  <jsp:setProperty property="passwd" name="mi" value="<%= passwd %>"/>
  <jsp:setProperty property="email" name="mi" value="<%= email %>"/>
  <jsp:setProperty property="registerDate" name="mi" value="<%= new Date() %>"/>
  
  아이디 : <jsp:getProperty property="id" name="mi"/><br>
  이름 : <%= mi.getName() %><br>
  비밀번호 : <jsp:getProperty property="passwd" name="mi"/><br>
  이메일 : <%= mi.getEmail() %><br>
  등록일 : <jsp:getProperty property="registerDate" name="mi"/><br>
  
</div>
</body>
</html>