<%@page import="java.util.Iterator"%>
<%@page import="org.apache.tomcat.dbcp.dbcp2.PStmtKey"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	PreparedStatement psmt = null;
	String sql = " SELECT * "
				+ " FROM dept ";
	ResultSet rs = null;
					
	int deptno;
	String dname, loc;
	DeptVO vo = null;
	ArrayList<DeptVO> list = null;
	Iterator<DeptVO> ir;
	
	try{
		conn = DBConn.getConnection();
		// System.out.println("> conn = " + conn);
		// System.out.println("> conn = " + conn.isClosed());	//닫혀있니? true : 닫혀있음 / False : 열려있음
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		if(rs.next()){
			list = new ArrayList<>();
			do{
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");
				
				vo = new DeptVO().builder()
								.deptno(deptno).dname(dname).loc(loc)
								.build();
				list.add(vo);
								
			}while(rs.next());
		}//if
			
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			psmt.close();
			DBConn.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}//try/catch
	}//try/catch/finally
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google" content="notranslate">
<link rel="stylesheet" href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }
</style>
</head>
<body>
<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">ddd Home</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
    부서정보
  </xmp>
  
  <select id="deptno" name = "deptno">
  <option> 부서를 선택하세요.</option>
  <p id="demo"></p>
  <%
  ir = list.iterator();
  while ( ir.hasNext() ){	//다음값이 있느냐?
		  vo = ir.next();
		  deptno = vo.getDeptno();
		  dname = vo.getDname();
	  %>
	  <option value="<%= deptno %>"><%= dname %></option>
	  <%		  
  }//while
  %> 
  <script>
$("#deptno").on("change", function (event) {
	//alert("test")
	let deptno = $(this).val();
	location.href = `ex01_emp.jsp?deptno=\${deptno}`;
})
</script>
  </select>
</div>
</body>
</html>