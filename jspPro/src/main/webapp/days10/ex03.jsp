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
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
        [ 파일 업로드 방법 ]
    1. 개발자가 직접 구현 X   
       request.getInputStream(); 
       name = "홍길동"
       
    2. 외부 라이브러리 사용 ***  		업로드 컴퍼넌트
       ㄱ.  http://www.servlets.com  <-사이트 죽어있음
       ㄴ. cos-22.05.zip 다운로드
                    cos.jar
                   WEB-INF>lib 폴더 저장  
       ㄷ.  form method=post
                 encoding=multipart/form-data 
            
            request 객체로 파라미터를 얻어올 수 없다. null
            cos.jar 추가
              ㄴ [MultipartRequest] 클래스 제공 
          
          
          예) upload폴더
          		ㄴ a.txt
          		ㄴ a_1.txt		a.txt를 업로드했지만 같은파일을 업로드된건 다를수 있음
          		
     	실습)
          (개념 이해)
   MultipartRequest mrequest = new MultipartRequest(ㄱ,ㄴ,ㄷ,ㄹ,ㅁ);  
       ㄱ - JSP의 request 객체    
       ㄴ - 서버에 저장될 위치(업로드 경로) 
       ㄷ - 최대 파일 크기
       ㄹ - 파일의 인코딩 방식
       ㅁ - 파일 중복 처리위한 인자(클래스 제공)
       
       실습)
       ex02.jsp
       ex02_ok.jsp
                 
    3. 서블릿 3.0 또는 3.1 에서 제공하는 라이브러리 . 
    1) HttpServletReqeust request 의 
        [getPart()]를 이용해서 
        업로드된 데이터(파일) 접근할 수 있는 [Part 객체]
            .getName() : 파라미터 이름
            .getContentType() : Content Type 
            .getSize() : 업로드한 파일 크기
            .getSubmittedFileName() : 업로드한 파일명 
            .getInputStream()  
            .write() : Part의 업로드 데이터를 파일명이 지정한 파일에 복사.
            .delete() : 생성된 임시 파일을 삭제.
            .getHeader() : 해당 Part에서 지정한 이름의 헤더 값을 얻어온다.
            
    2) 서블릿이  multipart 데이터를 처리할 수 있도록 .. 
         - web.xml 설정
         - @MultpartConfig 어노테이션을 사용해서 설정.
  </xmp>
</div>
</body>
</html>