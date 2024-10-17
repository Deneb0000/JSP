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
  
  정수 : <input type = "text" id= "num" autofocus="autofocus"><br>
  <p id="demo">1+2+3=6</p>
  <!-- 숫자만 입력되게, 유효성검사  엔터를 칠때 '3' 입력시 1+2+3-->
  <script>
  $("#num")
  .css("text-align","center")
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
		  if(event.which == 13){
		//	  alert("출력 처리")
		$("#demo").empty();
		let n = $(this).val();
		let sum = 0;
		for(var i=1 ; i<=n;i++){
			sum+=i;
			$("#demo").html(function (index, oldhtml) {

			return oldhtml + i + (i==n?"":"+");})
		}
		$(this).select();

		  }
	  }
  })
  /*
  //let num = $("#num").val()
  function enter(e) {
	if(e.keycode == 13){
	 alert($("#num").val());	
						}
  }
  //$("%demo").val();
  */
  </script>
</div>
</body>
</html>