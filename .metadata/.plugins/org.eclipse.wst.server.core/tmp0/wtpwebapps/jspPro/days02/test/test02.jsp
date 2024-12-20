<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Date"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
String sql = " SELECT empno, ename, job, mgr, TO_CHAR(hiredate,'yyyy-MM-dd')hiredate, sal,  comm, (e.deptno)deptno, dname "
		+ " FROM emp e join dept d ON e.deptno = d.deptno "
		+ " ORDER BY deptno ";
ResultSet rs = null;

Set<String> opSet = new HashSet<>();
int empno, mgr, sal, comm, deptno;
String ename, job, dname;
Date hiredate;

try {
	conn = DBConn.getConnection();
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon"
	href="http://localhost/jspPro/images/SiSt.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google" content="notranslate">
<link rel="stylesheet"
	href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
span.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
</head>
<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">ddd Home</a>
		</h1>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</header>
	<div>
		<xmp class="code"> 24-10-16 과제 </xmp>
		<select id="deptno" name="deptno">
			<option>부서 선택</option>

			<%
			while (rs.next()) {
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				String op = deptno + "-" + dname;
				
				if(!opSet.contains(op)){
					opSet.add(op);
				
			%>
			<option value="<%=deptno%>"><%=dname%></option>
			<%
				}//if
			} //while
			%>
		</select>
		<div id="empList">
		
		<xmp class="code">
    ex01_emp_02.jsp
  </xmp>
  <%-- <h2> emp list </h2>
  <table>
  	<thead>
  		<th>empno</th>
  		<th>ename</th>
  		<th>job</th>
  		<th>mgr</th>
  		<th>hiredate</th>
  		<th>sal</th>
  		<th>comm</th>
  		<th>deptno</th>
  	</thead>
  	<tbody>
  	<!-- 사원정보 뿌리는 코딩 tr/td -->
  		<%
  		if(list == null){
  		%>
  		<tr>
  			<td colspan ="8"> 사원이 존재 </td>  		
  		</tr>
  		<%
  		}else{
  			ir=list.iterator();
  			while( ir. hasNext()){
  				vo =ir.next();
  		%>
  		<tr>
  			<td><%= vo.getEmpno() %></td>
  			<td><%= vo.getEname() %></td>
	  		<td><%= vo.getJob() %></td>
	  		<td><%= vo.getMgr() %></td>
	  		<td><%= vo.getHiredate() %></td>
	  		<td><%= vo.getSal() %></td>
	  		<td><%= vo.getComm() %></td>
	  		<td><%= vo.getDeptno() %></td>
  		</tr>
  		<%
  			}
  		}
  		%>
  	</tbody>
  	<tfoot>
  	<tr>
  	<td colspan="8">
  		<span class="badge left red"><%= list==null?0:list.size() %></span>명.
            <a href="javascript:history.back()">뒤로 가기</a>

  	</td>
  	</tfoot> 
  	
  </table> --%>
		
		</div>
	</div>

	<script>
		$("#deptno").on("change", function(event) {
			//alert("test")
			let deptno = $(this).val();

			$ajax({
				url : "test02.jps",
				type : "GET",
				data : {
					deptno : deptno
				},
				success : function(response) {
					$("#empList").html(response);
				}
			});
		});
	</script>
</body>
</html>
<%
} catch (Exception e) {
e.printStackTrace();
} finally {
try {
	pstmt.close();
	DBConn.close();
} catch (Exception e) {
	e.printStackTrace();
}
}
%>
