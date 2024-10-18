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
    ex03.jsp
    		  -> ex03_02.jsp
			    				-> ex03_03.jsp
							    		입력받은
							    		이름 / 나이
		└───── 못 읽는 중	─── X ──→  		주소 / 연락처
							    		(모든정보)
							    		출력
 	세션은 성능상 문제
 	쿠키.text? 쿠키값을 읽어 오도록해?
 	hidden tag  사용   
  </xmp>
  <%
  String name     = request.getParameter("name");
  String age      = request.getParameter("age");
  String address  = request.getParameter("address");
  String tel      = request.getParameter("tel");
  %>                                     
  
  > 이름 : <%= name %> <br />
  > 나이 : <%= age %> <br />
  > 주소 : <%= address %> <br />
  > 연락처 : <%= tel %> <br />
  
  <input type="button" value="회원 가입" />
</div>
</body>
</html>