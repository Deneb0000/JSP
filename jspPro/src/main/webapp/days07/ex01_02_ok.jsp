<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
/* 응답할 때 쿠키를 생성 */
String cookieName = request.getParameter("cookieName");
String cookieValue = request.getParameter("cookieValue");

/* 주의 : 한글, ',', ;, 공백, () 사용할 수 없다 */
Cookie c = new Cookie( cookieName, URLEncoder.encode(cookieValue, "UTF-8") );
c.setMaxAge(-1);	// 음수 	: 브라우저가 닫을때 자동쿠키제거 (단위는 초)
c.setPath("/");
//c.setDomain();
//c.setPath();
response.addCookie(c);

//
String location	= "ex01_03.jsp";
response.sendRedirect(location);
%>