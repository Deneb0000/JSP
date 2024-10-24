package days07.mvc.command;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAOImpl;

public class ViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("View.doGet()");
		// referer : 참조자 라는 뜻 / 이전 페이지에 url 을 확인할 때 쓴다.
		String referer = request.getHeader("referer");
		// System.out.println("> referer : " + referer);
		
		long pseq = Long.parseLong( request.getParameter("seq") );
		
		Connection conn = ConnectionProvider.getConnection();
	    BoardDAOImpl dao = new BoardDAOImpl(conn);
	    int rowCount = 0;
	    BoardDTO dto = null;
		
	    // 트랜잭션 처리 필요한 부분
	    try {
			rowCount = dao.increaseReaded(pseq);
			dto = dao.view(pseq);
		} catch (SQLException e) {
			System.out.println("ViewHandler.doGet() Exception");
			e.printStackTrace();
		} // try
	    conn.close();
	    
	    // view jsp 포워딩
	    request.setAttribute("dto", dto);
		
	    return "/days07/board/view.jsp";
		
	}

}
