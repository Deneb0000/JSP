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
    [ request - 가장 많이 사용되는 기본 객체 ]
    
***    1. contentPath(컨텍스트 루트) : <%= request.getContextPath() %>
***    2. 클라이언트 IP :  <%= request.getRemoteAddr() %>
***    3. 요청 전송 방식 : <%= request.getMethod() %>
***    4. 요쳥 URL	:	<%= request.getRequestURL() %>	
***    5. 요청 URI	:	<%= request.getRequestURI() %>
    
  </xmp>
</div>
</body>
</html>