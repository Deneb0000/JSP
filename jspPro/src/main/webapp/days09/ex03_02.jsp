<%@page import="java.util.Date"%>
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
       ex03_02.jsp                    
  </xmp>
  
  서버 요청 시간 : <%= new Date().toLocaleString() %>
  <br>
  
  <input type="button" value="jquery ajax">
  <br>
  
  <p id="demo"></p>
  
  <script>
     $(function (){
        $("input").on("click", function (event){
           // jquery ajax method : load(url, p, c ) 
           $("#demo").load(
                 "ex03_ajax_info.txt"
                 ,  function (responseText, status, xhr){
                    if( status == "success"){
                       let txt = responseText;
                       let names = txt.split(",");
                         $("#demo").empty();
                        for (let name of names) {
                           $("#demo") 
                              .append( $("<li></li>")
                                    .text(name) );
                         } // for
                    } // if
                    if ( status == "error" ) {
                        var msg = "Sorry but there was an error: ";
                        $( "#demo" ).html( msg + xhr.status + " " + xhr.statusText );
                    }
                 } // function        
           ); // load
        }); // click
     });
  </script>
  
</div> 
</body>
</html>







 

