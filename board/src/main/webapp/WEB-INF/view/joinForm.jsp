<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>가입</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<form action="join.do" method="post">
<p>
	아이디:<br/><input type="text"  id="id"  name="id" value="${param.id}">
	<c:if test="${errors.id}">ID를 입력하세요.</c:if>
	<c:if test="${errors.duplicateId}">이미 사용중인 아이디입니다.</c:if>
	
	<input type="button" id="btnIDDuplicateCheck" value="ID 중복체크"><br>
	<p id="notice"></p>
    <br>
    
    <script>
	  $("#btnIDDuplicateCheck").on("click", function (){
		     //var params = $("form").serialize();		// ?deptno=10
		     var params = null;
		     params = "memberid="+$("#id").val();   
			 $.ajax({
				 url:"/board/idcheck.ajax" , 
				 dataType:"json",
				 type:"GET",
				 data: params,
				 cache:false ,
				 //                              {  "count":1 } 
				 success: function ( data,  textStatus, jqXHR ){
					 if( data.count == 0 ){
						 $("#notice").css("color", "black").text("사용 가능한 ID입니다.");
					 }else{  // 1
						 $("#notice").css("color", "red").text("이미 사용 중인 ID입니다.");
					 }
					 
				 },
				 error:function (){
					 alert("에러~~~ ");
				 }
				 
			 });
	  });
	</script>
	
</p>
<p>
	이름:<br/><input type="text" name="name" value="${param.name}">
	<c:if test="${errors.name}">이름을 입력하세요.</c:if>
</p>
<p>
	암호:<br/><input type="password" name="password">
	<c:if test="${errors.password}">암호를 입력하세요.</c:if>
</p>
<p>
	확인:<br/><input type="password" name="confirmPassword">
	<c:if test="${errors.confirmPassword}">확인을 입력하세요.</c:if>
	<c:if test="${errors.notMatch}">암호와 확인이 일치하지 않습니다.</c:if>
</p>
<input type="submit" value="가입">
</form>

<br>
<br>
<a href="http://localhost/board/index.jsp">HOme</a>
</body>
</html>