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
    ex07_map.jsp
    1. 지도를 출력할 컨테이너 div 태그 선언
  </xmp>
  <!-- 37.49946, 127.0331 -->
  <a href="ex07_02.jsp?lat=37.49946&lng=127.0331">(주)쌍용교육센터</a>
  <br /><br />
  <div id="googleMap" style="width:100%; height: 400px;"></div>
  <script>
  function myMap() {
	  
	var mapOptions = {							/* 런던의 위경도 값 */
			center : new google.maps.LatLng(51.508742, -0.120850)
	,zoom: 5
	};
	var map = new google.maps.Map(
	document.getElementById("googleMap")
	, mapOptions
	);
}
  </script>
  
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=XXX&callback=myMap"></script> -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_e_mLplWHzp6nDkHS6bXvm8UEu_Fimxs&callback=myMap"></script>
</div>
</body>
</html>