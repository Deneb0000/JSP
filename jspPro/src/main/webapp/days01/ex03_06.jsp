<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
//int num = Integer.parseInt(request.getParameter("num"));
//http://localhost/jspPro/days01/ex03_06.jsp?num=		500오류 : 서버체크 > script
String pNum = request.getParameter("num");

int num=0;
if(pNum != null){
	num = Integer.parseInt(pNum);
}
//int num = request.getParameter("num")==null?0:Integer.parseInt(request.getParameter("num"));

%>
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
  <!-- <form> -->
  <%-- 정수 : <input type = "text" id= "num" name="num" value="<%= num %>" autofocus><br> --%>
  <%-- 정수 : <input type = "text" id= "num" name="num" value='<%= pNum == null?"":pNum %>' autofocus><br> --%>
  정수 : <input type = "text" id= "num" name="num" autofocus><br>
  <!-- </form> -->
  
  <!-- 숫자만 입력되게, 유효성검사  엔터를 칠때 '3' 입력시 1+2+3-->
  
<p id="demo">
 <%
 if(pNum != null){
  int sum = 0;
  for(int i=1; i<=num; i++){
	  sum += i;
	%><%= i %>+<%	
  }//for
 %>=<%= sum %>
 <%}
 %>
</p>
   <script>
    <%-- if (<%=num%> == 0){
	  $("#num").val("");
   }
  $("#num").select(); 							.select() 선택되게 해주는데 따로 주거나 마지막에 붙혀도 될듯--%>
  $("#num")
  .css("text-align","center")
  .val('${param.num}')		//el 을 사용하면 
  .on({
	  "keydown": function(e) {
		  if ( !(e.which >= 48 && e.which <= 57
	              || e.which == 8
	              || e.which == 13
	              || e.which == 229
	          )){
			  alert("숫자만 입력")
			  e.preventDefault();
		  }//if
	  },
	  "keyup": function(event) {
		  //if($("num").val().length != 0 && event.which == 13){	//입력이 된 상태
			  if( event.which == 13){	//입력이 된 상태
			  
			  //$("form").submit();
			  let numValue = $("#num").val();
			location.href = `ex03_06.jsp?num=\${numValue}`;	//무조건 get방식
		  }
	  }
  })
  .select()
  </script>
</div>
</body>
</html>