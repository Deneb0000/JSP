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
    ex07_04.jsp
    
    (마우스 클릭 이벤트 처리)
    마커를 클릭하면 정보창을 표시
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
      
      var mapOptions = {							/* 런던의 위경도 값 */
  			center : mapCenter
  	,zoom: 5
  	
  	//지도를 클릭할때 정보창 표시 (open)
}
  
  //학독 빌딩 주위의 임의의 10군대 : 마커 표시
  let mlat, mlng,  markerPosition;
  
  
      
      google.maps.event.addListener(
    	maker
    	, "click"
    	,function(){
    	map.setZoom(15);
    	map.setCenter(marker.getPosition());
    	infoWindow.open(map, marker);
    	window.setTimeout(function({
    		infoWindow.close();mpa}))
    	}
    	}
    	}
      )
      
      
      
      
      
      
      
      
      
      //지도 위에 클릭할 때...
      map.addListener("click", (event =>{
    	  //console.log(event.latlng)
    	  placeMarker( map, event.latlng );
      });
)//
function placeMarker(map, elatlng) {
    	
    	  //1.마커표시
    	  let marker = new google.maps.Marker({
  			position:markerPosition		
  		}); 
  		marker.setMap(map);	
  		
  		//2.정보창 표시
  		let message = `lat=\${mapCenter.lat()}<br>
  			lng=\${mapCenter.lng()}<br>`;
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