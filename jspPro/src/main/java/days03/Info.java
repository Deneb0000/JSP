package days03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//																													수정
// @WebServlet(description = "서블릿에서 get/post 방식 요청 테스트", urlPatterns = { "/method/info.htm" })
public class Info extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Info() {
        super();

    }
    
    // pdf p80~ *복습
    // get : 보낼 때 iso? 여서 깨졌다. 그래서 utf-8 로 맞춰야된다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 보낼 때 맞춘 코딩
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("> Info.doGet()");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
     	int age = Integer.parseInt(request.getParameter("age"));
     	
     	System.out.printf("Get : name=%s, age=%d\n",name, age);
     	
     	out.print("> 이름 : " + name + "<br>");
     	out.print("> 나이 : " + age + "<br>");
	}
	
	// post : 받을 때 부터 한글이 깨지고 보낼때 iso? 도 맞춰야 된다.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 받을 때 맞춘 코딩
		request.setCharacterEncoding("utf-8");
		// 보낼 때 맞춘 코딩
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("> Info.doPost()");
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
     	int age = Integer.parseInt(request.getParameter("age"));
     	
     	System.out.printf("Post : name=%s, age=%d\n",name, age);
     	
     	out.print("> 이름 : " + name + "<br>");
     	out.print("> 나이 : " + age + "<br>");
	}

}
