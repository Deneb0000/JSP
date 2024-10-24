<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
    ex02_06.jsp
  </xmp>
  <%-- <c:out> JSPwrite 출력 스트림 객체에 의해서 출력 --%>
  <%
  String message = "<h3>Hello World</h3><br />홍길동<br />";
  %>
  <p id="demo">
  <%= message %>
  <br>
  <c:out value="<%= message %>" escapeXml="true"></c:out>	<!-- escapeXml : 태그 적용안하겠다고 막는 것 -->
  <c:out value="<%= message %>" escapeXml=""></c:out>
  </p>
  
  <hr />
  
  <c:set value="홍길동, 이시훈, 김준석" var="names"></c:set>
  <li>${names} </li>
  <c:forTokens items="${names}" delims=",/.!" var="name">
  <li>${name} </li>
  </c:forTokens>
  <hr />
  <%
  //배열을 c:forEach 태그를 사용해서 처리할 수 있다.
  int [] m = {3,5,2,4,1};
  %>
  <c:set value="<%= m %>" var="arr"></c:set>
  				<%-- ┌ <%= m %> %> --%>
  <c:forEach items="${arr}" var="i" varStatus="vs">
<li>${vs.index } = ${i}</li>
</c:forEach>

<!-- Map + c:forEach -->
  <%
    Map<String, String> map = new HashMap<>();
    map.put("id","admin");  // entry
    map.put("name","관리자");
    map.put("age","20");
  %>
  <c:set var="map" value="<%= map %>"></c:set>
  <c:forEach items="${ map }" var="entry">
    <li>${ entry.key } - ${ entry.value }</li>
  </c:forEach>
  
</div>
</body>
</html>