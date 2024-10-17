<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.lang.reflect.Array"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
  </xmp>
  <%
  	String name = request.getParameter("name");
  	String gender = request.getParameter("gender");
  	
  	String [] pets = request.getParameterValues("pet");
  %>
  >이름 :<%= name %> <br />
  >이름(EL) : ${param.name} <br> 
  >성별 : <%= gender.equals("m")?"남자":"여자" %> <br>
  >좋아하는 동물 : <%= Arrays.toString(pets) %> <br />
  
  <h3> name, gender, pets 파라미터 이름
  </h3>
  <%
  Enumeration<String> en = request.getParameterNames();
  while(en.hasMoreElements()){
	  String paramName = en.nextElement();
  %>
  <li><%=paramName %></li>
  <%
  }
  %>
  
  <b>request.getParameterMap() 메서드 사용</b><br>
<%
    Map parameterMap = request.getParameterMap();
    String[] nameParam = (String[])parameterMap.get("name");
    if (nameParam != null) {
%>
name = <%= nameParam[0] %>
<%
    }
%>
  
</div>
</body>
</html>