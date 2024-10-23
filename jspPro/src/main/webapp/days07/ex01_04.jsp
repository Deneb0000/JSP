<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String[] delCookieNames =	request.getParameterValues("ckbCookie");
//jsp 쿠키 삭제 : 쿠키 생성 + setMaxAge(0) => 응답할때 response 추가
for(int i=0; i<delCookieNames.length; i++){
	
	String cookieName = delCookieNames[i];
	String cookieValue = "";
	
	Cookie c = new Cookie( cookieName, cookieValue);
	c.setMaxAge(0);	// 0 	: 돌아가자마자 쿠키를 바로 제거 삭제
	c.setPath("/");
	
	response.addCookie(c);
}//for
/* 삭제 경고창을 띄우고선 ex01_03으로 이동하고 싶다. */
//String location = "jspPro/days07/ex01_03.jsp";
//response.sendRedirect(location);
%>
<script>
alert("쿠키삭제");
location.href = "ex01_03.jsp";
/* 브라우저가 경고창을 띄움 서버가 아님 */
</script>