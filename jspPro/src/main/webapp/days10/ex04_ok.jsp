<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.multipart.FileRenamePolicy"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <h1 class="main"><a href="#" style="position: absolute;top:30px;">KenIk HOme</a></h1>
  <ul>
    <li><a href="#">로그인</a></li>
    <li><a href="#">회원가입</a></li>
  </ul>
</header>
<div>
  <xmp class="code">
       ex04_ok.jsp                    
  </xmp>
  <%
     // ㄴ.
     String saveDirectory = pageContext.getServletContext().getRealPath("/days10/upload");
     System.out.println( saveDirectory );     
     File f = new File(saveDirectory);
     if( !f.exists() ) f.mkdirs();     
     // ㄷ.
     int maxPostSize = 5 * 1024 * 1024 ; // 5MB byte(기본단위)
     // ㄹ. 
     String encoding = "UTF-8";
     // ㅁ.  a1.txt
     FileRenamePolicy policy = new DefaultFileRenamePolicy();
     
     // cos.jar 파일  MultipartRequest 클래스 ...
     MultipartRequest multiRequest = new MultipartRequest(
           request
           , saveDirectory
           , maxPostSize
           , encoding
           , policy
           );
     
     // multiRequest 객체가 생성되면 
     // 벌써 파일 업로드가 완료된 상태..(기억)
     // 파일 업로드 처리 코딩 X
     
     String msg = multiRequest.getParameter("msg");
  %>
  > 전송된 메시지 : <%= msg %>
  <br>
  <br>
  <%
    Enumeration en =  multiRequest.getFileNames();
    while( en.hasMoreElements()  ){
       // input type=file   name=file1    
       String inputFileNameAttr =  (String) en.nextElement();
       // File getFile( name속성값 )
       File attachFile = multiRequest.getFile(inputFileNameAttr);
       if( attachFile != null ){
          String fileName = attachFile.getName();
          // multiRequest 객체로 부터 원래원본 파일명, 저장 파일명
          String originalFileName = multiRequest.getOriginalFileName(inputFileNameAttr);
          String filesystemName = multiRequest.getFilesystemName(inputFileNameAttr);
          
  %>
  > 첨부된 파일명 : <%= fileName %><br>
  > 첨부된 파일 크기 : <%= attachFile.length() %>bytes<br>
  > 첨부된 원래 파일명 : <%= originalFileName %><br>
  > 실제 저장된 파일명 : <%= filesystemName %><br>
  <%          
       } // if
    } // while
  %>
    
</div> 
</body>
</html>







 

