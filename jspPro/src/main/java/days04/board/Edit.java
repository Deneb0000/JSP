package days04.board;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

//@WebServlet("/cstvsboard/edit.htm")
public class Edit extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Edit() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("Edit.doGet()");
		
		String referer = request.getHeader("referer");
		// System.out.println("> referer : " + referer);
		
		long pseq = Long.parseLong( request.getParameter("seq") );
		
		Connection conn = DBConn.getConnection();
	    BoardDAOImpl dao = new BoardDAOImpl(conn);
	    int rowCount = 0;
	    BoardDTO dto = null;
		
	    // View.java 에서 조회수 증가는 삭제했다.
	    try {
			dto = dao.view(pseq);
		} catch (SQLException e) {
			System.out.println("Edit.doGet() Exception");
			e.printStackTrace();
		} // try
	    DBConn.close();
		
		// edit jsp 포워딩
	    request.setAttribute("dto", dto);
		
		String path = "/days04/board/edit.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
	} // doGet

	// http://localhost/jspPro/cstvsboard/edit.htm?seq=2
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		System.out.println("Edit.doPost()");

		long pseq = Long.parseLong( request.getParameter("seq") );
		
	      String pwd = request.getParameter("pwd");
	      String email = request.getParameter("email");
	      String title = request.getParameter("title");
	      String content = request.getParameter("content");
	      int tag = Integer.parseInt( request.getParameter("tag") );
	      
	      Connection conn = DBConn.getConnection();
	      BoardDAOImpl dao = new BoardDAOImpl(conn);
	      int rowCount = 0;
	      BoardDTO dto = BoardDTO.builder()
	    		  					.seq(pseq)
	    		  					.pwd(pwd)
	    		  					.email(email)
	    		  					.title(title)
	    		  					.content(content)
	    		  					.tag(tag)
	    		  					.build();
	      
	      try {
	         rowCount = dao.update(dto);
	      } catch (SQLException e) { 
	         System.out.println("> Edit.doPost() Exception...");
	         e.printStackTrace();
	      } // try
	      
	      DBConn.close();
	      
	      // 리다이렉트
	      String location = "/jspPro/cstvsboard/view.htm?seq="+pseq;
	      location += rowCount == 1 ? "&edit=success":"&edit=fail";
	      response.sendRedirect(location);
		
	} // doPost

} // class
