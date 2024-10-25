<%@page import="java.util.Date"%>
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
    ex03.jsp
    js 이용해서 ajax 사용
  </xmp>
  
  서버 요청 시간 : <%= new Date().toLocaleString() %>
  <br />
  <input type="button" value="js ajax" onclick="load('ex03_ajax_info.txt');" />
  <br />
  <p id="demo"></p>
  
  <script>
  
  et httpRequest; // XMLHttpRequest객체
  
  function getXMLHttpRequest(){
     if( window.ActiveXObject ){   // IE
           try{
              return new ActiveXObject("Msxml2.XMLHTTP");   // 
           }catch(e){
              try{
                return new ActiveXObject("Microsoft.XMLHTTP");
              }catch(e){
                 return null;
              }
           }
     }else if( window.XMLHttpRequest ){
            return new XMLHttpRequest();
     }else{
            return null;
     }
  }
  function load(url) {
	httpRequest = getXMLHttpReques();
	/* 준비상태가 바뀔때마다 뒤에있는 함수를 호출하겠다 */
	httpRequest.onreadystatechange = callback;
	httpRequest.open("GET", url);
	httpRequest.send();
}
  
  function callback() {
	  if (httpRequest.readyState == 4) {	//완료했다(갔다왔는데)
          if (httpRequest.status == 200) { //성공했다
        	  let txt = httpRequest.responseText;
        	  let names = txt.split(",");
              $("#demo").empty();
             for (let name of names) {
                $("#demo") 
                   .append( $("<li></li>")
                         .text(name) );
          				  
          				  
          	  }
          }
       } 
	
}
  </script>
  
  
  
</div>
</body>
</html>