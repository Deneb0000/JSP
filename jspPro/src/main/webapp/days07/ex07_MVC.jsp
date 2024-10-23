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
    ex07_MVC.jsp
    ***p516 Chapter18 MVC 패턴 구현***
    jsp가 모두 담당하면 모델 1
    분리되어있는것 모델 2
    ㄴ 컨트롤러는 사용자의 요청에 대해서 알맞은 모델(M)
    사용자에게 보여줄 뷰(V) 비즈니스 로직에는 포함x 전체 웹 APPlication 일괄적으로 적영되는 기능을 컨트롤러(C)에서 처리
    
    브라우저를 통해서 명령어를 전달하는 방법
    	- 특정 이름의 파라미터로 명령어를 전달
    		http://localhost/jspPro/controller?cmd=boardlist&cp=1&npp=15

    	- 요청 URL 자체를 명령어로 사용		<< 우린 이걸로 작업할꺼야
    		http://localhost/jspPro/board/write
    	
    	----------------------------------------
	실습)    	 days04.board 폴더
				days04.board 패키지
				
				=> MVC 패턴으로 변환...
				days07.mvc.domain : BoardDTO.java
				days07.mvc.persistence : BoardDAO.java   BoardDAOImpl.java
				days07.mvc.command	:	로직 처리 담당 클래스
							CommandHandler 인터페이스
							public String process();
							ListHandler.java
							WritHandler.java
				days07.mvc.service	: 서비스 클래스 (트랜잭션 처리)
				days07.mvc.controlloer : MV[C] 서블릿 클래스 모든 요청을 받고 요청을 분석함
					/JspPro/board/list.do=ListHandle
					
				controller 서블릿 -> web.xml 등록	
				
				web.xml 복사+붙이기 web_days07.xml
  </xmp>
  
  <a href="/jspPro/board/list.do">/board/list.do</a>
  
</div>
</body>
</html>