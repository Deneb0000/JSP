package days07.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days04.board.persistence.BoardDAOImpl;

public class DeleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Delete.doGet()");
		
		String method = request.getMethod();
		
		if(method.equals("GET")) {
			return "/days07/board/delete.jsp";
			
		}else {
			request.setCharacterEncoding("UTF-8");
			System.out.println("Delete.doPost()");

			long pseq = Long.parseLong( request.getParameter("seq") );
			
		      String ppwd = request.getParameter("pwd");

		      Connection conn = ConnectionProvider.getConnection();
		      BoardDAOImpl dao = new BoardDAOImpl(conn);
		      int rowCount = 0;
		      String originalPwd;
		      String location = "/jspPro/board/";
		      
		      try {
		    	  originalPwd = dao.getOriginalPwd(pseq);
		    	  if(originalPwd.equals(ppwd)) {
		    		  rowCount = dao.delete(pseq);
		    		  location += "list.do";
		    	  }else {
		    		  // location += "delete.htm?seq="+pseq+"&delete=fail";
		    		  // 모달창 삭제 / 뷰로 이동
		    		  location += "view.do?seq="+pseq+"&delete=fail";
		    	  } // if
		      } catch (SQLException e) { 
		         System.out.println("> Delete.doPost() Exception...");
		         e.printStackTrace();
		      } // try
		      
		      conn.close();
		      
		      // 리다이렉트
		      response.sendRedirect(location);
		}
		return null;
		
		
		
	}

}
