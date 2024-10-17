package days02;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿규약을 따르는 서블릿 클래스 선언
// ↓퍼블릭
public class Now extends HttpServlet {

	@Override		//doGet
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
	}

	@Override		//doPost
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}

	@Override
	protected void service(HttpServletRequest request
			, HttpServletResponse response) throws ServletException, IOException {
		
		//<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
		response.setContentType("text/html; charset=utf-8");
		
		//자바코딩 안에 html 코드가 들어있는게 불편해서 잘 안쓰게 된것
		// out 개체 받아오기
		PrintWriter out = response.getWriter();
		
		Date now = new Date();
		String pattern = "yyyy-MM-dd hh:mm:ss";
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		String strNow = sdf.format(now);
		
	out.write("<!DOCTYPE html>");
	out.write("<html>");
	out.write("<head>");
	out.write("<meta charset='UTF-8'>");
	out.write("<title>Insert title here</title>");
	out.write("<link rel='shortcut icon' type='image/x-icon' href='http://localhost/jspPro/images/SiSt.ico'>");
	out.write("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js'></script>");
	out.write("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
	out.write("<meta name='google' content='notranslate'>");
	out.write("<link rel='stylesheet' href='http://localhost/jspPro/resources/cdn-main/example.css'>");
	out.write("<script src='http://localhost/jspPro/resources/cdn-main/example.js'></script>");
	out.write("<style>");
	out.write(" span.material-symbols-outlined{");
	out.write("    vertical-align: text-bottom;");
	out.write(" }");
	out.write("</style>");
	out.write("</head> ");
	out.write("<body>  ");
	out.write("<header>");
	out.write("  <h1 class='main'><a href='#' style='position: absolute;top:30px;'>ddd Home</a></h1>");
	out.write("  <ul>");
	out.write("    <li><a href='#'>로그인</a></li>");
	out.write("    <li><a href='#'>회원가입</a></li> ");
	out.write("  </ul>");
	out.write("</header>");
	out.write("<div>");
	out.write("  <xmp class='code'>");
	
	out.write("<h3> 현재 날짜 시간 : '+strNow+'</h3>");
	
	out.write("  </xmp>");
	out.write("</div>");
	out.write("</body>");
	out.write("</html>");
	
	}

}
