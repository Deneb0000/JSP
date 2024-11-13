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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">ex01 Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
    ex01.jsp
   	구글맵 Open API
   	Oracle 연동
   	
   	맛집 등록 페이지
   	ex01_oracle_input.jsp
   	ex01_oracle_ok.jsp
   	ex01_oracle_json.jsp
   	ex01_oracle_json_data.jsp
   	
   	
   	
   	create table googlemap
   (
       id number primary key  -- 100/101/102
      , type varchar2(20)    -- 레스토랑 /커피.. (맛집의 종류)
      , name varchar2(30)   -- 식당이름
      , lng number
      , lat number
      , address varchar2(255)  --식당 주소
   );      
   
   디벨롭퍼
   Table GOOGLEMAP이(가) 생성되었습니다.
  </xmp>
  
  
</div>
</body>
</html>