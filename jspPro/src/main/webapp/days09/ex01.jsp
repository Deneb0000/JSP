<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>

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
  <c:choose>
      <c:when test="${ empty auth }">
         <li><a href="${ pageContext.request.contextPath }/days09/member/logon.jsp">로그인</a></li>
      </c:when>
      <c:otherwise>
         <li>[${ auth }] <a href="${ pageContext.request.contextPath }/days09/member/logout.jsp">로그아웃</a></li>
      </c:otherwise>
    </c:choose>
  
    <li><a href="${ pageContext.request.contextPath }/days09/member/addmember.jsp">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
    days09 폴더
    	ㄴ ex01.jsp
  	         ㄴ       admin 폴더 ( 관리자 계정으로 인증 )
                   ㄴ 회원관리페이지(membermanage.jsp)
                   ㄴ 급여관리페이지(paymanage.jsp)
                   
                   필터 : 관리자 + 인증/권한 체크    
                   ( LoginCheckFilter.java )               
                   
         ㄴ       board 폴더
                   ㄴ 글목록페이지 (list.jsp)  인증 X : 로그인안해도 읽은 수 있다
                   ㄴ 글쓰기페이지 (write.jsp) 인증 O : 로그인을 해야만 글을 작성할 수 있다
                   
         ㄴ       member 폴더  
                   ㄴ 회원가입페이지( addmember.jsp )
                   ㄴ 로그인 페이지( logon.jsp) + logon_ok.jsp
                   ㄴ 로그아웃 페이지 (logout.jsp)
  </xmp>
  <!-- 인증처리 자체가 필요없는 파일 -->
  <a href="${pageContext.request.contextPath}/days09/board/list.jsp">게시판 글 목록</a>
  <br />
    <!-- 인증처리 필요 -->
  <a href="${pageContext.request.contextPath}/days09/board/write.jsp">게시판 글 쓰기</a>
  <br />
    <!-- 인증처리 필요 + 관리자계정 -->
  <a href="${pageContext.request.contextPath}/days09/member/addmember.jsp">회원가입</a>
  <br />
</div>
</body>
</html>