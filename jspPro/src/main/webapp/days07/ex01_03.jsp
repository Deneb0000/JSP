<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
  </ul>
</header>
<div>
  <xmp class="code">
     ex01_03.jsp
     모든 쿠키 정보를 얻어와서 체크박스로 만들어서 출력하는 코딩
  </xmp>
  
  <form action="">
     <%
        Cookie [] cookieArr = request.getCookies();
        for(Cookie c : cookieArr){
           String cname = c.getName();
           // 주의할 점 : 디코딩을 꼭 해줘야된다.
           String cvalue = URLDecoder.decode( c.getValue(), "UTF-8" );
   %>
         <input type="checkbox" name="ckbCookie" value="<%= cname %>">
         <%= cname %> - <%= cvalue %>
         <br />
   <%
        } // for
     %>
  </form>
  <br />
  <a href="ex01.jsp">쿠키 Home</a><br>
  <a href="ex01_02.jsp">쿠키 생성</a><br>
  
  수정, 삭제할 쿠키를 체크 한 후 쿠키 수정, 삭제<br>
  <a href="ex01_04.jsp">쿠키 삭제</a><br>
  <a href="ex01_05.jsp">쿠키 수정</a><br>
  
  <script>
     // 쿠키 삭제 링크 태그
     /* 1.
     $("div a").eq(2).on("click",function(event){
        event.preventDefault();
        // alert("test");
        $("form")
           .attr("action","ex01_04.jsp")
           .submit();
     });
     */
     
     // 2.
     $("div a").eq(2).on("click",function(event){
        event.preventDefault();
        let url = $(this).attr("href");
        // $(":checkbox:checked").each() // value 속성값을 얻어온다. 이것도 가능하다.
        
        // serialize() : 직렬화 하는 메서드 쓰면 ckbCookie=id& 이런식으로 만들어진다.
        let queryString = $("form").serialize();
        location.href = `\${url}?\${queryString}`;
     });
  </script>
  
  <script>
  // 쿠키 수정
  $("div a").eq(3).on("click",function(event){
      event.preventDefault();
      let url = $(this).attr("href");
      let queryString = $("form").serialize();
      // ex01_05.jsp?ckbCookie=color&ckbCookie=age
      location.href = `\${url}?\${queryString}`;
   });
  </script>
  
</div>
</body>
</html>