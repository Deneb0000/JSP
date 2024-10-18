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
  	[ 상태관리 ] - DB에 인설트 저장, 세션에 저장, 쿠키 저장, 
  
  지금은 input type=hidden	서버연동해보기
  										나중에 최적화 된것도 고를 수 있어야한다
  
    ex03.jsp
    이름
    나이
    입력받아서
    [next] 버튼 눌러서
			    -> ex03_02.jsp
			    	주소
			    	연락처
			    	입력받아서
			    	[next] 버튼 눌러서
						    	-> ex03_03.jsp
						    		입력받은
						    		이름 / 나이
						    		주소 / 연락처
						    		(모든정보)
						    		출력
    
    이전 페이지의 값을 현재 페이지에서 어떻게 가져와서 사용할 수 있는가 
    -> hedden
    
    
  </xmp>
  
  <form action="ex03_02.jsp">
  name : <input type="text" name="name" value="홍길동" /> <br />
  age : <input type="text" name="age" value="20" /> <br />
  <input type="submit" value="Next" />
  </form>
  
</div>
</body>
</html>