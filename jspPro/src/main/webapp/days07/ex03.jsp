<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>

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
    [ 커넥션 풀 (Connection Pool) ]	db를 연결하는 객체 : 커넥션
    
    커넥션 개체 세팅방법 
    ㄱ. tomcat-dbcp.jar    lib 폴더 추가
    https://tomcat.apache.org/
    
    https://tomcat.apache.org/tomcat-9.0-doc/jndi-datasource-examples-howto.html#Oracle_8i,_9i_&_10g
    
    
    com.util.ConnectionProvider.java
    
  </xmp>
  
  <%
  Context initContext = new InitialContext();
  Context envContext  = (Context)initContext.lookup("java:/comp/env");
  DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
  Connection conn = ds.getConnection();
  //etc.
  %>
  
  conn = <%=conn %>
  <%
  conn.close();	//그냥 닫는게 아니라 다시 돌려준다는 뜻
  %>
  <br>
  <%
  Connection conn2 = ConnectionProvider.getConnection();
  %>
  
   conn2 = <%=conn2 %>
  <%
  conn2.close();	//그냥 닫는게 아니라 다시 돌려준다는 뜻
  %>
</div>
</body>
</html>