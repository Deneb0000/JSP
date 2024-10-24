package days07.mvc.command;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import days04.board.domain.BoardDTO;
import days04.board.persistence.BoardDAO;
import days04.board.persistence.BoardDAOImpl;
import days04.board.vo.PagingVO;

public class ListHandler implements CommandHandler{
	
	
    int currentPage = 1;		//	현재 페이지 번호	
    int numberPerPage = 10;		//  한 페이지에 출력할 게시글 수
    int numberPageBlock = 10;	//	[1] 2 3 4 5 6 7 8 9 10 >
    int totalRecords = 0;		//  총 레코드
    int totalPages = 0 ;		//  총 페이지 수


	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		try {
			this.currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} catch (Exception e) {
			this.currentPage = 1;
			}
		//아무값도 안넘어왔다면 1로 설정하겠다
		
		try {
			this.numberPerPage = Integer.parseInt(request.getParameter("numberPerPage"));
		} catch (Exception e) {
			this.numberPerPage = 10;
		}
		
		String searchCondition = null;
		try {
			searchCondition = request.getParameter("searchCondition");
		} catch (Exception e) {
			searchCondition = "title";
		}
		
		//검색어가 없는 경우 null;
		String searchWord = request.getParameter("searchWord");
		 
		
		// 1. 로직 처리
		Connection conn = ConnectionProvider.getConnection();
		BoardDAO dao = new BoardDAOImpl(conn);
		ArrayList<BoardDTO> list = null;
		
		PagingVO pvo = null;
		
		//검색어가 넘어오지 않는 경우
		
		
		
		//페이징 처리 해주는 곳
		try {
			
			if(searchWord == null || searchWord.equals("")) {
				// 검색기능이 없는 목록
				
				//PagingVO pvo = new PagingVO(currentPage, numberPerPage, numberPageBlock);
				pvo = new PagingVO(currentPage, numberPerPage, numberPageBlock);
				//페이징 처리가 안된 셀렉트 함수
				//list = dao.select();	
				//페이징 처리가 된 셀렉트 함수
				list = dao.select(this.currentPage, this.numberPerPage);
				
			}else{
				// 검색목록
				pvo = new PagingVO(currentPage, numberPerPage, numberPageBlock
						,searchCondition, searchWord);
				list = dao.search(searchCondition, searchWord, currentPage, numberPerPage);
			}
				
		} catch (Exception e) {
			System.out.println("> List.doGet() Exception");
			e.printStackTrace();
		} finally {
			conn.close();	//	 커넥션풀에 반환 시키는 것
		} // try
		
		// 2. 포워딩
				request.setAttribute("list", list);
				request.setAttribute("pvo", pvo);
		
		System.out.println("> listhandler.process");
		return "/days07/board/list.jsp";
	}//m[v]c

}
