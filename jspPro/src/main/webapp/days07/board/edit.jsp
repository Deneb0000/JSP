<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">lsh</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
    <li><a href="/jspPro/board/list.do">게시판</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
     edit.jsp
  </xmp>
  
  <h2>글 쓰기</h2>
<form method="post"> <!-- action 값이 없으면 똑같은 주소로 다시 요청한다. -->
   <table>
      <tr>
         <td colspan="2" align="center"><b>글을 수정합니다.</b></td>
      </tr>
      <tr>
         <td align="center">이름</td>
         <td><input type="text" name="writer" size="15"
            value="${ dto.writer }" disabled="disabled"></td>
      </tr>
      <tr>
         <td align="center">비밀번호</td>
         <td><input type="password" name="pwd" size="15"
            required="required"></td>
      </tr>
      <tr>
         <td align="center">Email</td>
         <td><input type="email" name="email" size="50" value="${ dto.email }"></td>
      </tr>
      <tr>
         <td align="center">제목</td>
         <td><input type="text" name="title" size="50"
            required="required" value="${ dto.title }"></td>
      </tr>
      <tr>
         <td align="center">내용</td>
         <td><textarea name="content" cols="50" rows="10">${ dto.content }</textarea></td>
      </tr>
      <tr>
         <td align="center">HTML</td>
         <td>
         	${ dto.tag }
         	<%-- 1.
         	<input type="radio" name="tag" value="1" ${ dto.tag == 1 ? "checked" : "" }>적용
            <input type="radio" name="tag" value="0" ${ dto.tag == 0 ? "checked" : "" }>비적용
             --%>
            <input type="radio" name="tag" value="1">적용
            <input type="radio" name="tag" value="0">비적용
            <script>
            <%-- 2.
            	$(":radio[name=tag]").each(function(index,element){
            		if(element.value == ${ dto.tag }){
            			element.checked = true;
            		}
            	});
             --%>
             // 위와 동일
             // 3.
             $(":radio[name=tag][value=${ dto.tag }]")
             	.attr("checked", "checked");
            </script>
         </td>
      </tr>
      <tr>
         <td colspan="2" align="center">
            <input type="submit"   value="작성 완료"> &nbsp;&nbsp;&nbsp; 
            <a href="javascript:history.back();">이전으로</a></td>
      </tr>
   </table>
</form>
  
</div>
</body>
</html>