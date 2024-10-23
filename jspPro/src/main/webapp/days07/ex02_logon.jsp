<%@page import="javax.swing.RepaintManager"%>
<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
   String id = request.getParameter("id");
   String passwd = request.getParameter("passwd");
    
   String location = "ex02_default.jsp";
   
   if(id.equals("admin") && passwd.equals("1234")){
	   Cookie c =	Cookies.createCookie("auth", id, "/", -1);
	   response.addCookie(c);
         
   }else if(id.equals("hong") && passwd.equals("1234")){
	   Cookie c =	Cookies.createCookie("auth", id, "/", -1);
	   response.addCookie(c);
        
   }else if(id.equals("park") && passwd.equals("1234")){
	   Cookie c =	Cookies.createCookie("auth", id, "/", -1);
	   response.addCookie(c);
        
   }else{ 
        location = "ex02_default.jsp?logon=fail";     
   }
   response.sendRedirect(location);
%>