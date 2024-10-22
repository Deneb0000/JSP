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
    ex05_04.jsp
    
    pageContext 객체
		ㄴ jsp의 기본 내장된 객체를 얻어올 수도 있다
				- 굳이 얻어와야 되나요?
					ㄴ 커스텀 태그를 만들때 사용하기도 한다
					지금은 request 사용
					request = pageContext.getRequest();
					response = pageContext.getReResponse();
					out = pageContext.getOut();
					application = pageContext.getServletContext();
    	ㄴ 에러 데이터를 구하기
    	ㄴ 페이지의 흐름을 제어
    	ㄴ 속성 처리
    	ㄴ page 영역과 관련있어서
    		pageContext.setAttribute();
    		pageContext.setAttribute();
  </xmp>
</div>
</body>
</html>