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
    ex07_03.jsp
    
    쌍용교육 센터의 임의의 위치에 맛집 마커
  </xmp>
  
  <div id="googleMap" style="width:100%; height: 400px;"></div>
  
  <script>
  
  
  function myMap() {
	  
	  var lat = 37.499294;
	  var lng = 127.0331883;
	  
	  var mapCanvas = document.getElementById("googleMap");
	  var mapCenter = new google.maps.LatLng(lat, lng);
	  
  function getRndNumber(min, max) {
      return (Math.random() * (max - min) ) + min;
}
  
  //학독 빌딩 주위의 임의의 10군대 : 마커 표시
  let mlat, mlng,  markerPosition;
  
  for(var i = 0; i < 10; i++){
	  mlat += getRndNumber(-0.006, 0.006);
	  mlng += getRndNumber(-0.006, 0.006);
	  
	  //1.마커 
	  markerPosition = new google.maps.LatLng(mlat,mlng);
	  
	  
		let marker = new google.maps.Marker({
			position:markerPosition		
		}); 
		marker.setMap(map);
		//2. 정보창 
		let message = `맛집-\$(i+1)`;
		let infoWindow = new google.maps.InfoWindow({
			content : message
		});
		infoWindow.open(map, marker);
  }
  </script>
  
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=XXX&callback=myMap"></script> -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_e_mLplWHzp6nDkHS6bXvm8UEu_Fimxs&callback=myMap"></script>
</div>
</body>
</html>