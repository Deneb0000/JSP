<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="shortcut icon" href="http://localhost/jspPro/images/SiSt.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/jspPro/resources/cdn-main/example.css">
<script src="/jspPro/resources/cdn-main/example.js"></script>
<style>
 span.material-symbols-outlined{
    vertical-align: text-bottom;
 }
</style>
</head>
<body>

<header>
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">kenik HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<h3>
  <span class="material-symbols-outlined">view_list</span> jsp days00
</h3>
<div>
  <xmp class="code"> 
  </xmp> 
  <h2>상세보기</h2>

  <table border="1">
      <tr>
         <td width="130" align="center">제목</td>
         <td colspan="4">${ dto.subject }</td>
      </tr>
      <tr>
         <td width="130" align="center">작성자</td>
         <td colspan="4">${ dto.writer }</td>
      </tr>
      <tr>
         <td width="130" align="center">작성일</td>
         <td width="565">${ dto.num }</td>
      	 <td width="130" align="center">조회수</td>
         <td width="224">${ dto.readcount }</td>
      </tr>
  </table>
  
  <table>
  
 <tr>
         <td width="130" align="left">내용</td>
 </tr>
      <tr>
         <td width="920">
            <div style="width: 100%; height: 200px; overflo: scroll;">${ dto.content }</div>
         </td>
      </tr>
   </table>

<table>  
      <tr>
         <td colspan="2" align="right">
           <input type="button" value="수정"
            onclick="location.href='edit.do?num=${ dto.num }&page=${ param.page}&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">

            <input type="button" value="삭제" onclick="location.href='delete.do?num=${ dto.num }'" />
            <%-- <a href="delete.do?num=${ dto.num }">글삭제</a> --%> 
            
         <input type="button" value="글목록"
            onclick="location.href='list.do?page=${ param.page}&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }'">
         </td>
      </tr>
      </table>
</div>

<script>
</script>
</body>
</html>
 