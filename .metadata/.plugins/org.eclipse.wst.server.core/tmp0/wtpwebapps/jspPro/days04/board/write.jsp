<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" type="image/x-icon"
	href="http://localhost/jspPro/images/SiSt.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="google" content="notranslate">
<link rel="stylesheet"
	href="http://localhost/jspPro/resources/cdn-main/example.css">
<script src="http://localhost/jspPro/resources/cdn-main/example.js"></script>
<style>
span.material-symbols-outlined {
	vertical-align: text-bottom;
}
</style>
</head>
<body>
	<header>
		<h1 class="main">
			<a href="#" style="position: absolute; top: 30px;">ddd Home</a>
		</h1>
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
		</ul>
	</header>
	<div>
		<xmp class="code"> write.jsp / 글쓰기 페이지 </xmp>

		<h2>글 쓰기</h2>
		<form method="post">	<%-- 속성이 잡혀있지않으면 다시 불러온다--%>
			<table>
				<tr>
					<td colspan="2" align="center"><b>글을 적어주세요</b></td>
				</tr>
				<tr>
					<td align="center">이름</td>
					<td><input type="text" name="writer" size="15"
						autofocus="autofocus" required="required"></td>
				</tr>
				<tr>
					<td align="center">비밀번호</td>
					<td><input type="password" name="pwd" size="15"
						required="required"></td>
				</tr>
				<tr>
					<td align="center">Email</td>
					<td><input type="email" name="email" size="50"></td>
				</tr>
				<tr>
					<td align="center">제목</td>
					<td><input type="text" name="title" size="50"
						required="required"></td>
				</tr>
				<tr>
					<td align="center">내용</td>
					<td><textarea name="content" cols="50" rows="10"></textarea></td>
				</tr>
				<tr>
					<td align="center">HTML</td>
					<td><input type="radio" name="tag" value="1" checked>적용
						<input type="radio" name="tag" value="0">비적용</td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="작성 완료"> &nbsp;&nbsp;&nbsp; <input type="reset"
						value="다시 작성"> &nbsp;&nbsp;&nbsp; <a
						href="<%=contextPath%>/cstvsboard/list.htm">Home</a></td>
				</tr>
			</table>
		</form>


	</div>
</body>
</html>