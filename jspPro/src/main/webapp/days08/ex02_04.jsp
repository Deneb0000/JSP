<%@page import="days06.MemberInfo"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
    ex02_04.jsp
     JSTL c(코어)
      1) 제어문 : c:if, c:choose, c:forEach , c:forTokens
      2) 변수 지원 :  c:set    c:remove    
      3) URL 처리 :  c:import  c:redirect c:url  X
      4) 기타     :  c:catch  [c:out(JspWriter 출력)]  
      
  </xmp>
  
  <%
  Map<String, String> map = new HashMap<>();
  map.put("id", "admin");
  map.put("passwd", "1234");
  
  //request.setAttribute("map", map);
  
  %>
  
  id = <%= map.get("id")%> <br />
  passwd = <%= map.get("passwd")%>  <br />
  <hr />
  <!-- 위 코딩이랑 똑같다. request 영역 안에서 map 사용 -->
  <c:set var="map" scope="request" value="<%= map %>"></c:set>
  id = ${ map.id }<br>
  passwd = ${ map.passwd }<br>
  
  <hr />
  <%
     MemberInfo member = new MemberInfo();
     member.setId("admin");
     member.setName("홍길동");
     // member.setEmail("admin@naver.com");
  %>
  
  <c:set value="<%= member %>" var="vo"></c:set>
  member.id = ${ vo.id }<br>
  member.name = ${ vo.name }<br>
  
  <!-- member.setEmail("admin@naver.com"); 똑같은 코딩 -->
  <%-- <c:set target="<%= member %>" property="email" value="admin@naver.com"></c:set> --%>
  <c:set target="${ vo }" property="email" value="admin@naver.com"></c:set>
  member.email = ${ vo.email }<br>
  
  <hr />
  
  <%
     // c:set value 속성값 : 표현식, EL, 정적문자열 가능하다.
     String name = "admin";
  %>
  name(표현식) = <%= name %><br>
  <c:set value="<%= name %>" var="n1"></c:set>
  <c:set value="admin" var="n2"></c:set>
  <c:set value="${ n1 }" var="n2"></c:set>
  
</div>
</body>
</html>