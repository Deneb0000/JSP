<%@page import="net.sf.json.JSONArray"%>
<%@page import="net.sf.json.JSONObject"%>
<%@page import="com.util.ConnectionProvider"%>
<%@page import="com.util.JdbcUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;  
  
  String sql = "select empno, ename, sal "
           + " from emp "
           + " order by sal desc";
  
  //{} 제이슨개체를 만들겠다.		응답할 제이슨
  JSONObject 				jsonData = new JSONObject();
  //[]
  JSONArray jsonEmpArray = new JSONArray();
  
  try{
     con = ConnectionProvider.getConnection();
     pstmt = con.prepareStatement(sql);
     rs = pstmt.executeQuery(); 
     while( rs.next() ){ 
         int empno = rs.getInt("empno");
         String ename = rs.getString("ename"); 
         // {"empno":7839,"ename":"KING"},
         JSONObject jsonEmp = new JSONObject();
         jsonEmp.put("empno", empno);
         jsonEmp.put("ename", ename);
         
         jsonEmpArray.add(jsonEmp);
     }// while
     jsonData.put("emp", jsonEmpArray);
  }catch(Exception e){
     e.printStackTrace();
  }finally{
   JdbcUtil.close(rs);
   JdbcUtil.close(pstmt);
   JdbcUtil.close(con);
  }
  
%>
<%= jsonData %>
<%-- 
{
   "emp":[
            {"empno":7839,"ename":"KING"},
            {"empno":7902,"ename":"FORD"},
            {"empno":7566,"ename":"JONES"},
            {"empno":7698,"ename":"BLAKE"},
            {"empno":7782,"ename":"CLARK"},
            {"empno":7499,"ename":"ALLEN"},
            {"empno":7844,"ename":"TURNER"},
            {"empno":7934,"ename":"MILLER"},
            {"empno":7654,"ename":"MARTIN"},
            {"empno":7521,"ename":"WARD"},
            {"empno":7900,"ename":"JAMES"},
            {"empno":7369,"ename":"SMITH"}
         ]
} 
--%>







 

