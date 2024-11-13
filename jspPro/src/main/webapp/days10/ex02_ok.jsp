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
  ex02_ok.jsp  
  </xmp>
  
  <%
  //enctype"multipart/form-data" 설정했을 경우에는 request 객체로 전송되는 파라미터를 얻어올 수 없다
  //어떻게? 이름 파라미터, 첨부 파일
		  //직접 스트림으로 부터 개발자가 코딩으로 얻어와야 된다
  
  String name = request.getParameter("name");
  String upload = request.getParameter("upload");
  %>
  
  >전달된 이름 : <%= name %> <br>
  >전달된 파일 : <%= upload %> <br>
  
</div>
</body>
</html>