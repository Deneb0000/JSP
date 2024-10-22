<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.nio.Buffer"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
  .demo{
     border: 1px solid gray;
     padding: 5px;
     margin-top:10px;
     max-height: 500px;
     overflow: auto; 
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
    ex05_03.jsp
    days06 폴더 안에 있는 파일명을 읽어와서
	select 태그에 option 태그를 만들어서 추가 할것이다
    
    하나의 option 태그를 선택하면 그 파일의 내용을 출력하는 코딩을 할것이다.
  </xmp>
  
  <%
String path = application.getInitParameter("path");
  //System.out.println(">path : " + path);			//>path : /days06	(출력됨)
  
  //실제로 배포되는 물리적인 서버 경로 	realPath
  String realPath = application.getRealPath(path);
  //System.out.println(">realPath : " + realPath);
  //>realPath : C:\Class\Workspace\JSPClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspPro\
  //>realPath : C:\Class\Workspace\JSPClass\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\jspPro\days06
  
  File dir = new File(realPath);	//디렉토리 객체 만들고
  File [] listFiles=	dir.listFiles(); //파일목록
  %>
  <form>
  <h3>days06</h3>
  <select id="file" name="file">
  <%
  for(int i = 0; i <listFiles.length ; i++){
	  if(listFiles[i].isFile()){ //파일이야?
			  String fileName = listFiles[i].getName(); // 파일의 이름
	%>
	<option> <%= fileName %></option>
	<%
	  }	  
  }//for
	%>
	</select>	  
  </form>
  <%
  String pfileName = request.getParameter("file");
  
  String fileName = pfileName =
		  pfileName == null? listFiles[0].getName() : pfileName; //"ex01.jsp"
		  
	fileName = String.format("%s\\%s", realPath, fileName);	  //리얼패스랑 합치기
	
		  String content = "";
	try(
			FileReader fr = new FileReader(fileName);
			BufferedReader br = new BufferedReader(fr);
			){
		String line = null;
		while( (line = br.readLine()) !=null){
			line += "\r\n";
			line = line.replaceAll("<","&lt;")
			.replaceAll(">","&gt;")
			.replaceAll("\r\n","<br>");
			content += line;
		}
	}catch(Exception e){
		e.printStackTrace();
		}finally{
			
		}
  %>
  
  <div class="demo">	<!-- 자바파일 출력할거야 -->
  <code>
<%= content %>
  </code>
  </div>
</div>
<script>
$("#file").on("change", function() {
	$(this).parent().submit;
});
$("#file").val('<%= pfileName %>'); 꼭 '' 붙이자
</script>
</body>
</html>