<%@page import="com.util.JdbcUtil"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    // id(empno) 존재하면 0   사용가능
    // id(empno) 존재하면 1   사용불가능
   String empno = request.getParameter("empno");
   
   String sql = " select count(*) cnt " + 
                " from emp  " + 
                " where empno =  ?";
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   String jsonResult = null;   //  {"count":1}
   try{
     conn = ConnectionProvider.getConnection();
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, empno);
      rs = pstmt.executeQuery();      
      rs.next();
      int cnt = rs.getInt("cnt");  // 1, 0      
      jsonResult = String.format("{\"count\":%d}", cnt);      
   }catch(Exception e){
      e.printStackTrace();
   }finally{
      JdbcUtil.close(rs);
      JdbcUtil.close(pstmt);
      JdbcUtil.close(conn);
   }    
%>
<%= jsonResult %>








