<%@page import="javax.swing.RepaintManager"%>
<%@page import="com.util.Cookies"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
   String id = request.getParameter("id");
   String passwd = request.getParameter("passwd");
    
   String location = "ex05_default.jsp";
   
   if(id.equals("admin") && passwd.equals("1234")){
	   session.setAttribute("auth", id);
         
   }else if(id.equals("hong") && passwd.equals("1234")){
	   session.setAttribute("auth", id);
        
   }else if(id.equals("park") && passwd.equals("1234")){
	   session.setAttribute("auth", id);
        
   }else{ 
        location = "ex05_default.jsp?logon=fail";     
   }
   response.sendRedirect(location);
%>