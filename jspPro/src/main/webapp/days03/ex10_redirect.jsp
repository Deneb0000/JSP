<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String location = "ex10_finish.jsp";

//질문에 관한 답		질문 : 리다이렉트로 안넘어가는 이유
String name = request.getParameter("name");
String age = request.getParameter("age");
String lotation = String.format("ex10_finish.jsp?name=%s&age=%s", name, age);


response.sendRedirect(location);
%>