<%@page import="java.io.DataInputStream"%>
<%@page import="java.util.Enumeration"%>
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
    ex02_ok_02.jsp
    
  </xmp>
  <%
  out.print("> 전송된 헤더 정보를 출력 <br>");
  Enumeration<String> en =	request.getHeaderNames();
  while( en. hasMoreElements()){
	  String key = en.nextElement();
	  String value = request.getHeader(key);
	  out.print(key + ":" + value + "<br>");
  }
  %>
  
  <%
  out.print("> 전송된 스트림 정보 출력 <br>");
  ServletInputStream sis = request.getInputStream();
  //읽어오기 위해서 보조스트림 사용?
  DataInputStream dis = new DataInputStream(sis);
  String line = "";
  
  while((line = dis.readLine()) != null){
	  out.print(new String(line.getBytes("ISO-8859-1")) + "<br>");
  }
  
  %>
</div>
</body>
</html>