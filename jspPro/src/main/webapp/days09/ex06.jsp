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
<script src="httpRequest.js"></script>
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
    ex06.jsp
    xml 파일을 읽어와서 ajax 처리
    (xml DOM 처리)
    
    ex06_cd_catalog.xml
  </xmp>
  
  <button type="button" onclick="loadXml()">Get my CD Collection</button>
  <br /><br />
  <p id="demo"></p>
  
  <script>
  function loadXml() {
	  sendRequest("ex06_cd_catalog.xml", null, callback, "GET");

}
  function callback() {
	  if (httpRequest.readyState == 4) {  // 서버 요청 완료
	         if (httpRequest.status == 200) {  // 응답 성공
	            /* $("#demo").html( httpRequest.responseText ); */
	            //alert( httpRequest.responseXML)
	            let xmlDocument = httpRequest.responseXML;
	            const cdList = 	xmlDocument.getElementsByTagName("CD");
	            let tblcdlist = `<table>
	           <tr>
	             <th>TITLE</th><th>ARTIST</th>
	            </tr>`
	            for(let i = 0; i <cdList.length; i++){
	            title = cdList[i].getElementsByTagName("TITLE")[0].childNodes[0].nodeValue ;
                artist = cdList[i].getElementsByTagName("ARTIST")[0].childNodes[0].nodeValue ;
	            
                tblcdlist += `<tr>
                <td>\${title}</td><td>\${artist}</td>
                </tr>`;
	            }
	            tblcdlist += `</table>`;
	            $("#demo").html(tblcdlist);
	       
	         }else{
	            alert("에이작스 실패 : " + httpRequest.status );
	         }
	     }
}
  </script>
</div>
</body>
</html>