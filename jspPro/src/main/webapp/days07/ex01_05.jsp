<%@page import="java.io.UnsupportedEncodingException"%>
<%@page import="java.net.URLDecoder"%>
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
    ex01_05.jsp
  </xmp>
  <%!
  //jsp의 스크립트 요소 3가지 	: 스크리트릿, 표현식, 선언문 (변수, 메서드 선언하겠다)
  public String getCookieValue(String cname,HttpServletRequest request){
     Cookie [] cookieArr = request.getCookies();
     for( Cookie c : cookieArr){
        if( c.getName().equals(cname)){
           try{
              return URLDecoder.decode( c.getValue() , "UTF-8");
           }catch(UnsupportedEncodingException e){} 
        }
     }// for     
     return null;
   }
  %>
  <form action="ex01_05_ok.jsp">  
  <%
     String [] updCookieNames = request.getParameterValues("ckbCookie");
     for(int i=0; i < updCookieNames.length ; i++ ){
        String cname = updCookieNames[i];
        String cvalue = getCookieValue(cname, request);
  %>
     <li>
       <%= cname %> : <input type="text" name="<%= cname %>"
                             value="<%= cvalue %>"><br>
     </li>
  <%      
     } // for
  %>  
  
   <input type="submit" value="쿠키 수정">
  </form>
</div>
</body>
</html>