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
		<table border="1" summary="" class="SP_tableSt02_isThead SP_cateBoard_table" >
			<tr style="background: gray; color: white; font-weight: bold">
				<td width="100%" align="center">제 목</td>
			</tr>
			<tbody>
				<c:if test="${ empty list }">
					<tr class="data">
						<td align="center" colspan="1">
							<h3>작성된 게시글이 없습니다.</h3>
						</td>
					</tr>
	 			</c:if>

				<c:if test="${ not empty list }">
					<c:forEach items="${ list }" var="dto">
						<tr class="data">
							<td>
							<c:if test="${ dto.depth gt 0 }"> <!-- dto에 체크박스 인식하는걸 만들고 싶은데... -->										
<a href="view.do?num=${ dto.num }&page=${ param.page }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }" style="font-weight: bold;">${ dto.subject }</a>
								</c:if>
		<a href="view.do?num=${ dto.num }&page=${ param.page }&searchCondition=${ param.searchCondition }&searchWord=${ param.searchWord }">${ dto.subject }</a>
						</td>
						</tr>
					</c:forEach>
					<tr>
						<td align="center">
							${ pageBlock }
						</td>
					</tr>
				</c:if>


			</tbody>

		</table>
		<form>
			<table>
				<tr>
					<td align="center" style="padding: 3px;">
						<%-- <select id="searchCondition" name="searchCondition" style="font-size: 15px;">
							<option value="subject" ${ param.searchCondition eq "subject" ? "selected" : "" }>제목</option>
					</select> --%> <input type="text" name="searchWord"
						value='${ param.searchWord }'> <input type="button"
						style="height: 22px; width: 50px" value="검색" id="searchBtn">
					</td>
				</tr>
			</table>
		</form>


		<table>
			<tr>
				<td align="right"><a href="write.do">글쓰기</a></td>
			</tr>
		</table>
		
</div>
</body>
</html>