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
+ " FROM emp e join dept d ON e.deptno = d.deptno ";
ResultSet rs = null;

int empno, mgr, sal, comm, deptno;
String ename, job, dname;
Date hiredate;
EmpVO vo = null;
ArrayList<EmpVO> list = null;
Iterator<EmpVO> ir;

try {
	conn = DBConn.getConnection();
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	if (rs.next()) {
		list = new ArrayList<>();
		do {
			empno = rs.getInt("empno");
			ename = rs.getString("ename");
			job = rs.getString("job");
			mgr = rs.getInt("mgr");
			hiredate = rs.getDate("hiredate");
			sal = rs.getInt("sal");
			comm = rs.getInt("comm");
			deptno = rs.getInt("deptno");
			dname = rs.getString("dname");

	vo = new EmpVO().builder()
			.empno(empno)
			.ename(ename)
			.job(job)
			.mgr(mgr)
			.hiredate(hiredate)
			.sal(sal)
			.comm(comm)
			.deptno(deptno)
			//.dname(dname)
			.build();
	list.add(vo);

		} while (rs.next());
	} //if

} catch (Exception e) {
	e.printStackTrace();
} finally {
	try {
		pstmt.close();
		DBConn.close();

	} catch (Exception e) {
		e.printStackTrace();
	} //try/catch
} //try/catch/finally
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
		<xmp class="code"> </xmp>
		<select id="deptno" name="deptno">
			<option>부서 선택</option>
			<p id="demo"></p>

			<%
			ir = list.iterator();
			while (ir.hasNext()) { //다음값이 있느냐?
				vo = ir.next();
				deptno = vo.getDeptno();
				//dname = vo.getDname();
			%>
			<%-- <option value="<%=deptno%>"><%=dname%></option> --%>
			<%
			} //while
			%>
			<script>
				$("#deptno").on("change", function(event) {
					//alert("test")
					let deptno = $(this).val();
					location.href = `ex01_emp.jsp?deptno=\${deptno}`;
				})
			</script>
		</select>
	</div>
</body>
</html>