<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");

//이동할 경로
String location;
if(id.equals("admin") && passwd.equals("1234")){
	//관리자 로그인 성공
	location = "ex08_main.jsp";
}else if(id.equals("hong") && passwd.equals("1234")){
	//일반 로그인 성공
	location = "ex08_main.jsp";
}else{
	//로그인 실패
	location = "ex08.jsp?error";	//"ex08.jsp?파라미터"
}

//location.href = "ex08.jsp"; // 자바 코딩 여기는 서버 코딩중

//1. 리다이렉트 redirect											요청 1번 이상
/* response.sendRedirect(location); */

//2. 포워딩(forward)		Dispatcher : 발송담당자, 급파하는 사람.		요청 1번
RequestDispatcher dispatcher = request.getRequestDispatcher(location);
dispatcher.forward(request, response);
%>