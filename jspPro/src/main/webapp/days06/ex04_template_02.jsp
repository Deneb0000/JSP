<%@ page trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
모든 페이지에 공통적으로 선언할 변수 ... 
String contextPath = request.getContextPath();
%>
 --%>
 <%@ include file="/WEB-INF/inc/include.jspf" %>
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
<!-- TOP 공통모듈 -->
<%-- <jsp:include page="/Layout/top.jsp" flush="false"></jsp:include> --%>
<%@ include file="/layout/top.jsp" %>
<div>
  <xmp class="code">
    페이징 모듈화	-	jsp:include 액션태그
    				include 지시자 사용해보기
    					ㄴ 공통적으로 사용하는 변수 선언해서 모든 페이지에 포함할수 있다.
    					  ex) contextPath를 모든 페이지에서 사용을 해야한다면
    					  
    					  WEB-INF
    					   ㄴ inc 폴더 추가
    					   		ㄴ include.jspf
    					   
  </xmp>
  <table>
  	<tr>
  		<td>
  		<%-- <jsp:include page="/days06/Layout/left.jsp" flush="false"></jsp:include> --%>
  		<%@ include file="/days06/layout/left.jsp" %>
  		</td>
  		<td>
  	회원 관리 Content 부분<br>
        회원 관리 Content 부분<br>
        회원 관리 Content 부분<br>
        회원 관리 Content 부분<br>
        회원 관리 Content 부분<br>
        </td>
  		<td>
  		<%-- <jsp:include page="/days06/Layout/right.jsp" flush="false"></jsp:include> --%>
  		<%@ include file="/days06/layout/right.jsp" %>
  		</td>
  	</tr>
  </table>
</div>
<!-- TOP 공통모듈 -->
<%-- <jsp:include page="/Layout/bottom.jsp" flush="false"></jsp:include> --%>
<%@ include file="/layout/bottom.jsp" %>
</body>
</html>