package days03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(description = "서블릿에서 get방식과 post방식 요청 test", urlPatterns = { "/method/info.htm" })
public class Info extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public Info() {
		super();
	}

	//get
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//"text/html; charset=UTF-8"
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("> Info. doGet()...");
		PrintWriter out =  response.getWriter();

		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));

		System.out.printf("G : name=%s, age=%d\n", name, age);
		
		out.print("> 이름 : " + name + "<br>");
		out.print("> 나이 : " + age + "<br>");
	}

	//post
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//"text/html; charset=UTF-8"
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("> Info. doPost()...");
		PrintWriter out =  response.getWriter();

		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		System.out.printf("P : name=%s, age=%d\n", name, age);


		out.print("> 이름 : " + name + "<br>");
		out.print("> 나이 : " + age + "<br>");

	}

}