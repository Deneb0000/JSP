<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    [ 리다이렉트 / 포워딩 차이점 ]
    포워딩 - MVC 패턴으로 개발하기 위해서 한단계를 더 거치는 작업
    
    1) /scott/dept	url 패턴으로 					Get 방식 요청
    
    2) ScottDept.java 서블릿이 먼저 요청을 받는다		doGet() 방식으로 구현
    
    	-- 로직 처리하는 코딩 --
    	Select 부서정보
    	AllayList<DeptVO> List;
    	
    	-- ***포워딩 --		만약 리다이렉트로 작업하면 처리가 안된다
    	ex01_dept.jsp로 포워링 시킬 예정
    	
    3) ex01_dept.jsp 
	    부서정보를 출력해서
	    클라이언트가 응답하는 구조를 거칠 것이다.
	   
	   days0E2.ex01.jsp 수업자료
	    1) ex01_dept.jsp		select 태그에서 부서를 선택
	    2) /scortt/emp 		=>	ScottEmp.java 서클릿 요청 Get
	    						doGet(){
	    							//파라미터 넘어오는 부서번호(deptno)
	    							// 해당 부서원들을 list
	    							
	    							//포워딩 ex01_emp.list
	    							}
		3) ex01_emp.jsp
			사원정보를 출력 .. 코딩..
    4) 
  </xmp>
  <%
  //	"/jspPro" 선언
  String contextPath = request.getContextPath();
  %>
  <a href="<%= contextPath %>/scott/dept">/scott/dept</a>
</div>
</body>
</html>