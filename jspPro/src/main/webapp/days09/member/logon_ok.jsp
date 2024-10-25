<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");


//DB 처리 : id, pwd 인증처리 + 권한 // admin 관리자 계정
session.setAttribute("auth", id);

//메인페이지로 이동
String location = "/jspPro/days09/ex01.jsp";

String referer = (String)session.getAttribute("referer");
if(referer != null){
	location = referer;
	session.removeAttribute("referer");
}


response.sendRedirect(location);


%>