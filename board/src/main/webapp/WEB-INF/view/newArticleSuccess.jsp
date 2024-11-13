<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>게시글 등록</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/SiSt.ico">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>

게시글을 등록했습니다.
<br>
${ctxPath = pageContext.request.contextPath ; ''}
<a href="${ctxPath}/article/list.do">[게시글목록보기]</a><br>
<a href="${ctxPath}/article/read.do?no=${newArticleNo}">[게시글내용보기]</a>

<br>
<br>
<a href="http://localhost/board/index.jsp">HOme</a>
</body>
</html>