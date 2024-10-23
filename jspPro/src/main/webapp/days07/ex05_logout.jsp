<%@page import="com.util.Cookies"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page trimDirectiveWhitespaces="true" %>
<%@ include file="/WEB-INF/inc/session_auth.jspf" %>
<%-- <%
//인증 + 권한x
// [ 세션 사용 인증 처리 ] auth 세션이름 = 로그인 ID 만 저장 (약속)

String sname ="auth";
String logonId = null;
logonId = (String) session.getAttribute(sname);
%> --%>
<%
session.invalidate();	
//세션을 강제 종료 +삭제하는 종료
//세션을 자동으로 종료 (20분)
%>
<script>
alert("<%= logonId%>님 로그아웃");
location.href = "ex05_default.jsp";
</script>
