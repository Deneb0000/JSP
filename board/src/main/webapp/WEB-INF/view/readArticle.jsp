<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>게시글 읽기</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<table border="1" width="100%">
<tr>
	<td>번호</td>
	<td>${articleData.article.number}</td>
</tr>
<tr>
	<td>작성자</td>
	<td>${articleData.article.writer.name}</td>
</tr>
<tr>
	<td>제목</td>
	<td><c:out value='${articleData.article.title}' /></td>
</tr>
<tr>
	<td>내용</td>
	<td><u:pre value='${articleData.content}'/></td>
</tr>
<tr>
	<td colspan="2">
		<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo}" />
		<a href="list.do?pageNo=${pageNo}">[목록]</a>
		<c:if test="${authUser.id == articleData.article.writer.id}">
			<a href="modify.do?no=${articleData.article.number}">[게시글수정]</a>
			<a href="delete.do?no=${articleData.article.number}">[게시글삭제]</a>
		</c:if>
	</td>
</tr>
</table>

</body>
</html>