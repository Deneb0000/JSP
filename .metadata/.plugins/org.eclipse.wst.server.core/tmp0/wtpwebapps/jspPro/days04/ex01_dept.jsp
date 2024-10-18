<%@page import="java.util.Iterator"%>
<%@page import="org.doit.domain.DeptVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
/* 리퀘스트 객체 호출 			오브젝트로 리턴해줘서 다운케스팅 해야함*/
ArrayList<DeptVO> list = (ArrayList<DeptVO>)request.getAttribute("list");
Iterator<DeptVO> ir = null;
DeptVO vo = null;
int deptno;
String dname;
%>
<%
	String contextPath = request.getContextPath();
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
    ex01_dept.jsp
  </xmp>
	<!-- days02>ex01.jsp의 select 태그 -->
	<!-- 어레이 리스트를 못 받아왔는데? 어떻게 전달해주지?
			방법 1) 세션에 저장한다		: 상태관리 중요	상태관리가 뭘까
			방법 2) DB에 저장한다
	-->
		<select id="deptno" name="deptno">
			<option>부서를 선택하세요.</option>
			<p id="demo"></p>
			<%
			ir = list.iterator();
			while (ir.hasNext()) { //다음값이 있느냐?
				vo = ir.next();
				deptno = vo.getDeptno();
				dname = vo.getDname();
			%>
			<option value="<%=deptno%>"><%=dname%></option>
			<%
			} //while
			%>
			<script>
			/*	
			$("#deptno").on("change", function(event) {
					let deptno = $(this).val();
					location.href = `ex01_emp.jsp?deptno=\${deptno}`;
				})
				*/
				
				$("#deptno")
				.wrap("<form></form>")
				.on("change", function(event) {
					$(this)
						.parent()
							.attr({
								method:"get",
								action:"<%= contextPath %>/scott/emp"
								
							})
							.submit();
				})
			</script>
		</select>
	</div>
	
	
	<!-- 표가져오기 -->
	
</body>
</html>