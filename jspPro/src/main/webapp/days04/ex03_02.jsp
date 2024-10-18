<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    ex03.jsp
			    -> ex03_02.jsp
			    	주소
			    	연락처
			    	입력받아서
			    	[next] 버튼 눌러서
			    	-> ex03_03.jsp
			    	
			    	
  	만약에 입력해야할 값이 20개 이상이면
    동적으로 넘겨주는 파라미터값을 저장하도록 히든태그 코딩하기
  </xmp>
  
  <%
  String name = request.getParameter("name");
  String age = request.getParameter("age");
  
  %>
  
  <form action="ex03_03.jsp">
  address : <input type="text" name="address" value="역삼동" /> <br />
  tel : <input type="text" name="tel" value="010-1234-5678" /> <br />
  <input type="button" value="Prev" onclick="history.back()" />
  <input type="submit" value="Next" />

	<!-- 이전 페이지에서 전달되 파라미터를 저장할 input 태그 -->
<!-- 	만약에 입력해야할 값이 20개 이상이면
    동적으로 넘겨주는 파라미터값을 저장하도록 히든태그 코딩하기 -->
	<%-- <input type="hidden" name="name" value="<%= name %>"/>
	<input type="hidden" name="age" value="${param.age}"/> --%>

  </form>
<!-- [문제] param value 어떻게 가져와? -->
<%-- <c:forEach items="배열,collection,map?"> --%>
<%-- <c:forEach items="<%= request.getParameterNames() %>" var="pname">
>>${pname} 			<!-- >>name >>age -->

</c:forEach>
 --%>
<script>

let hiddenElement;
<%
 Enumeration<String> en = request.getParameterNames();
while(en.hasMoreElements()){
	String pname = en.nextElement();
	/* System.out.println(pname); */
	String pValue= request.getParameter(pname);
	%>
	hiddenElement = `<input type='hidden' name='<%= pname %>' value='<%= pValue %>'/>`
	$("form").append(hiddenElement);
	<%
}
%>

</script>  
</div>
</body>
</html>