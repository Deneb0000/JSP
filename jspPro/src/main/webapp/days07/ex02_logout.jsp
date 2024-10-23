<%@page import="com.util.Cookies"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

<%
String cname = "auth";
String logonId = null;

Cookies cookies = new Cookies(request);
if(cookies.exists(cname)){
	//쿠키가 있니?
	logonId=cookies.getValue(cname);
	Cookie c =	Cookies.createCookie("auth", "", "/", 0);
	   response.addCookie(c);
}
%>
<script>
alert("<%= logonId%>님 로그아웃");
location.href = "ex02_default.jsp";
</script>
