<%@page import="java.util.Arrays"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.util.Date"%>
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

/* 파라미터가 여러게 넘어오게 */

String [] deptnoArr = request.getParameterValues("deptno");
//System.out.println(Arrays.toString(deptnoArr));

String sql = " SELECT empno, ename, job, mgr, "
		+" TO_CHAR(hiredate,'yyyy-MM-dd')hiredate, sal,  comm, deptno "
		+ " FROM emp "
		+ " WHERE ";
for(int i =0; i<deptnoArr.length; i++){
	sql+= "deptno=? OR";
};
sql = sql.substring(0, sql.length()-3);
sql+= " ORDER BY deptno ASC ";

/*
String sql = " SELECT empno, ename, job, mgr, "
		+" TO_CHAR(hiredate,'yyyy-MM-dd')hiredate, sal,  comm, deptno "
		+ " FROM emp "
		+ " WHERE deptno=";	// ? : 파라미터값 넘어올곳
				sql += String.join(" OR ");
		*/
		


	Connection conn = null;		//db연결
	PreparedStatement psmt = null;
	ResultSet rs = null;

	int deptno =0;

	int empno,mgr;
	String ename, job;
	Date hiredate;
	//LocalDateTime hiredate;
	double sal, comm;
	


	EmpVO vo = null;
	ArrayList<EmpVO> list = null;
	Iterator<EmpVO> ir = null;
	
	try{
		conn = DBConn.getConnection();
		// System.out.println("> conn = " + conn);
		// System.out.println("> conn = " + conn.isClosed());	//닫혀있니? true : 닫혀있음 / False : 열려있음
		psmt = conn.prepareStatement(sql);
		//?의 갯수? 	
		for(int i =0; i<deptnoArr.length; i++){
			psmt.setInt(i+1, Integer.parseInt(deptnoArr[i]));
		};
				
		rs = psmt.executeQuery();
		if(rs.next()){
			list = new ArrayList<>();
			do{
				empno = rs.getInt("empno");
				ename = rs.getString("ename");
				job = rs.getString("job");
				mgr = rs.getInt("mgr");
				hiredate = rs.getDate("hiredate");
				//hiredate = rs.getTimestamp("hiredate").toLocalDateTime();
				sal = rs.getInt("sal");
				comm = rs.getInt("comm");
				deptno = rs.getInt("deptno");
				
				vo = new EmpVO().builder()
								.empno(empno)
								.ename(ename)
								.job(job)
								.mgr(mgr)
								.hiredate(hiredate)
								.sal(sal)
								.comm(comm)
								.deptno(deptno)
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
	}//try/catch/finally*/
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
    ex01_emp_02.jsp
  </xmp>
  <h2> emp list </h2>
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
  	
  </table>
</div>
</body>
</html>

<!-- 
복습 :	WHERE deptno=? OR deptno =? OR deptno=? OR
복습 :	WHERE deptno IN (?, ?, ?)
 
-->