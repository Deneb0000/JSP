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
  반드시 알아야할것 프로젝트때 사용하기도함
    p.155 페이지 모듈화와 요청 흐름 제어
    
    [페이지 모듈화]
     하나의 웹 사이트(애플리케이션)을 구성하는 
     페이지의 상단,하단,메뉴 등등 모든 웹 페이지의     
     공통적인 부분을 모듈화 시켜서 코드의 중복 제거
     생산성 향상, 유지, 보수, 확장성이 용이.
     
     모든 페이지의 상단, 하단
       ㄴ days06 
           ㄴ layout 폴더 생성
       ㄴ webapp 폴더
           ㄴ layout 폴더 생성
                ㄴ top.jsp                
                ㄴ bottom.jsp  
                
       일정관리 부분 : 공통모듈  좌,우측 모듈         
     
     [모듈화 처리 방법]                 
     1) include 지시자
     2) jsp:include  액션태그 
     
     [ include 지시자 방법과 jsp:include  액션태그를 사용하는 방법의 차이점 ]
     
     ex04_template
  </xmp>
</div>
</body>
</html>