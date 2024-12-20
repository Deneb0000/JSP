<%@page import="java.util.Iterator"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="org.doit.domain.EmpVO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
// 				"/jspPro"
String contextPath = request.getContextPath();
%>

<%
	Connection conn = null;
	PreparedStatement psmt = null;
	String sql = " SELECT * "
				+ " FROM dept ";
	ResultSet rs = null;
					
	int deptno;
	String dname, loc;
	DeptVO dvo = null;
	ArrayList<DeptVO> dlist = null;
	Iterator<DeptVO> dir;
	
	int p_deptno;
	
	try{
		conn = DBConn.getConnection();
		psmt = conn.prepareStatement(sql);
		rs = psmt.executeQuery();
		if(rs.next()){
			dlist = new ArrayList<>();
			do{
				deptno = rs.getInt("deptno");
				dname = rs.getString("dname");
				loc = rs.getString("loc");
				
				dvo = new DeptVO().builder()
								.deptno(deptno).dname(dname).loc(loc)
								.build();
				dlist.add(dvo);
								
			}while(rs.next());
		}//if
			
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			psmt.close();
			rs.close();
			}catch(Exception e){
			e.printStackTrace();
		}//try/catch
	}//try/catch/finally
%>
<%
	
	String pDeptno = request.getParameter("deptno");
	try{
	p_deptno = Integer.parseInt(pDeptno);
		
	}catch(Exception e){
		p_deptno = 10;
	}

	sql = " SELECT empno, ename, job, mgr, "
			+" TO_CHAR(hiredate,'yyyy-MM-dd') hiredate, sal,  comm, deptno "
			+ " FROM emp "
			+ " WHERE deptno = ? ";	// ? : 파라미터값 넘어올곳
	
					
	int empno,mgr;
	String ename, job;
	Date hiredate;
	double sal, comm;

	EmpVO evo = null;
	ArrayList<EmpVO> elist = null;
	Iterator<EmpVO> eir = null;
	
	try{
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1, p_deptno);	// 실행하기 전에 줘야할 값 줘야지				
		rs = psmt.executeQuery();
		if(rs.next()){
			elist = new ArrayList<>();
			do{
				empno = rs.getInt("empno");
				ename = rs.getString("ename");
				job = rs.getString("job");
				mgr = rs.getInt("mgr");
				hiredate = rs.getDate("hiredate");
				sal = rs.getDouble("sal");
				comm = rs.getDouble("comm");
				
				evo = new EmpVO().builder()
								.empno(empno)
								.ename(ename)
								.job(job)
								.mgr(mgr)
								.hiredate(hiredate)
								.sal(sal)
								.comm(comm)
								.deptno(p_deptno)
								.build();
				elist.add(evo);				
			}while(rs.next());
		}//if
			
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			psmt.close();
			rs.close();
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
    
  </xmp>

 <%-- <select id="deptno" name = "deptno">
  <!-- <option> 부서를 선택하세요.</option> -->
  <%
  dir = dlist.iterator();
  while ( dir.hasNext() ){	//다음값이 있느냐?
		  dvo = dir.next();
		  deptno = dvo.getDeptno();
		  dname = dvo.getDname();
	  %>
	  <option value="<%= deptno %>" <%= p_deptno==deptno?"selected":"" %> ><%= dname %></option>
	  <option value="<%= deptno %>"><%= dname %></option>
	  <%		  
  }//while
  %> 
  </select> --%>
  
<select id="deptno" name="deptno">
  <option value="">부서를 선택하세요</option>
  <%
  dir = dlist.iterator();
  while (dir.hasNext()) {
      dvo = dir.next();
      deptno = dvo.getDeptno();
      dname = dvo.getDname();
  %>
      <!-- p_deptno 값이 현재 옵션의 deptno와 같으면 selected -->
      <option value="<%= deptno %>" <%= (p_deptno == deptno) ? "selected" : "" %>><%= dname %></option>
  <%
  }
  %>
</select>
  <br /><br />		
  <h3>Emp List</h3>
  <table>
  	<thead>
  	<th>	<input type="checkbox" id="ckbAll" name="ckbAll" />	</th>
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
  		if(elist == null){
  		%>
  		<tr>
  			<td colspan ="8"> 사원이 존재 </td>  		
  		</tr>
  		<%
  		}else{
  			eir=elist.iterator();
  			while( eir. hasNext()){
  				evo =eir.next();
  		%>
  		<tr>
  		<td> <input type="checkbox" data-empno="<%= evo.getEmpno() %>"id="ckb_<%= evo.getEmpno() %>" name="ckb_" value="<%= evo.getEmpno() %>" /> </td>
  			<td><%= evo.getEmpno() %></td>
  			<td><%= evo.getEname() %></td>
	  		<td><%= evo.getJob() %></td>
	  		<td><%= evo.getMgr() %></td>
	  		<td><%= evo.getHiredate() %></td>
	  		<td><%= evo.getSal() %></td>
	  		<td><%= evo.getComm() %></td>
	  		<td><%= evo.getDeptno() %></td>
  		</tr>
  		<%
  			}
  		}
  		%>
  	</tbody>
  	<tfoot>
  	<tr>
  	<td colspan="9">
  		<span class="badge left red"><%= elist==null?0:elist.size() %></span>명.
            <a href="javascript:history.back()">뒤로 가기</a>
            <button>선택한 empno 확인</button>

  	</td>
  	</tfoot>
  </table>
  
  <script>
 $("#deptno").on("change", function (event) {
	//alert("test")
	let deptno = $(this).val();
	location.href = `<%= contextPath %>/days03/ex01.jsp?deptno=\${deptno}`;
}); 

</script>

  <script>
  //모두선택 체크박스 이벤트
  /* $("#ckbAll").on("click", function(event) {
	  //$(this).prop("checked"); 체크 속성 가져오기
	  $("table tbody tr")
	  .find("td:first-child :checkbox")
	  .prop("checked", $(this).prop("checked"));
}); */

$("#ckbAll").on("click", function(event) {
    $("table tbody tr")
      .find("td:first-child :checkbox")
      .prop("checked", $(this).prop("checked"));
});

//각 사원들의 체크박스를 클릭할때 모두 선택 체크박스 처리
/* $("table tbody tr")
  .find("td:first-child :checkbox").on("click", function() {
	  let ck = $("tbody :checkbox").length == $("tbody :checkbox:checked").length;
	  $("#ckbAll").prop("checked", ck);
}); */
$("table").on("click", "tbody tr td:first-child :checkbox", function() {
    let ck = $("tbody :checkbox").length === $("tbody :checkbox:checked").length;
    $("#ckbAll").prop("checked", ck);
});
  </script>

  		<script>
  		/* 첫번째 풀이
  		$("tfoot button").on("click", function(event) {
  			let empnos = [];
  			$("tbody :checkbox:checked").each(function( index, element) {
				//ck
  				let empno =	element.parentElement.nextElementSibling.innerText;
				empnos.push(empno)
			});
  			location.href = `ex01_ok.jsp?empnos=\${empnos.join("/")}`;
		}); */
		
		//두번째 풀이
		$("tfoot button").on("click", function(event) {
			//ex01_ok.jsp?empno=111&~
					let empnos = [];
					$("tbody :checkbox:checked").each(function( index, element) {
						
						//ㅓ쿼리 메소드 : data() 		data-empno
						let empno =	$(element).data("empno")
						empnos.push(empno)
					});
		  			location.href = `ex01_ok.jsp?empnos=\${empnos.join("&empno=")}`;
			
		})
  		</script>
</body>
</html>