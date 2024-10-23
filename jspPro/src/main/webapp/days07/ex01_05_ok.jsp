<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
//ex01_05_ok~
Enumeration<String> en =	request.getParameterNames();
while(en.hasMoreElements()){
	String cookieName = en.nextElement();
	String cookieValue = request.getParameter("cookieValue");
Cookie c = new Cookie( cookieName, URLEncoder.encode(cookieValue, "UTF-8") );
	
c.setMaxAge(-1);	// 음수 	: 브라우저가 닫을때 자동쿠키제거 (단위는 초)
c.setPath("/");
response.addCookie(c);
String location	= "ex01_03.jsp";
response.sendRedirect(location);
}
%>
