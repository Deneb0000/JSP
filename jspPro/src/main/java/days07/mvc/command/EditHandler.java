package days07.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

public class EditHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		if (method.equals("GET")) {
			
			System.out.println("Edit.doGet()");
			
			String referer = request.getHeader("referer");
			// System.out.println("> referer : " + referer);
			
			long pseq = Long.parseLong( request.getParameter("seq") );
			
			Connection conn = ConnectionProvider.getConnection();
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
		    conn.close();
			
			// edit jsp 포워딩
		    request.setAttribute("dto", dto);
			
			return "/days07/board/edit.jsp";
			
		}else { //post
			
			request.setCharacterEncoding("UTF-8");
			System.out.println("Edit.doPost()");

			long pseq = Long.parseLong( request.getParameter("seq") );
			
		      String pwd = request.getParameter("pwd");
		      String email = request.getParameter("email");
		      String title = request.getParameter("title");
		      String content = request.getParameter("content");
		      int tag = Integer.parseInt( request.getParameter("tag") );
		      
		      Connection conn = ConnectionProvider.getConnection();
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
		      
		      conn.close();
		      
		      // 리다이렉트
		      String location = "/jspPro/board/view.do?seq="+pseq;
		      location += rowCount == 1 ? "&edit=success":"&edit=fail";
		      response.sendRedirect(location);
			
			}
		
		return null;
	}

}
