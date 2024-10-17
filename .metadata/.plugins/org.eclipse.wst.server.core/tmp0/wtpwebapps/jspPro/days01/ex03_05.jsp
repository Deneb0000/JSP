<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  </xmp>
  
  정수 : <input type = "text" id= "num" name="num" autofocus><br>
  
  <!-- 숫자만 입력되게, 유효성검사  엔터를 칠때 '3' 입력시 1+2+3-->
  <%
  String numStr = request.getParameter("num");
  int num = 0; 

  try{num = Integer.parseInt(numStr);
  }catch(Exception e){
	  out.println("<script> alert('숫자만 입력하세요.'); history.back(); </script>");
	  return;
	  }
  
      int sum = 0;
      for (int i = 1; i <= num; i++) {
         sum += i;
       out.write(i+"+");
   	 }//for
   out.write("="+sum);
%>
<p id="demo"><%= sum %></p>
  <script>
   //실행하면 가운데 커서, 숫자 아닌값 alert, enter치면~ 서버에 갔다가 채워지고 뿌려지기...............
  </script>
</div>
</body>
</html>