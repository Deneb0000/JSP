package days07.mvc.persistence;

import java.sql.SQLException;
import java.util.ArrayList;

import days04.board.domain.BoardDTO;

public interface BoardDAO {

	// 1. 페이징 처리 x + 게시글 목록 추상메서드 선언
	ArrayList<BoardDTO> select() throws SQLException;
	
	ArrayList<BoardDTO> select(int currentPage, int numberPerPage) throws SQLException;

	// 2. 게시글 쓰기
	int insert(BoardDTO dto) throws SQLException;
	
	// 3. 조회수 증가
	int increaseReaded(long seq) throws SQLException;
	// 3-2. 상세보기
	BoardDTO view(long seq) throws SQLException;
	
	// 5. 게시글 수정 - 제목, 내용, 이메일
	int update(BoardDTO dto) throws SQLException;
	
	String getOriginalPwd(long seq) throws SQLException;
	
	// 4. 게시글 삭제
	int delete(long seq) throws SQLException;
	
	// 1-3. 총 레코드 수
	   int getTotalRecords() throws SQLException;
	   int getTotalRecords( String searchCondition, String searchWord ) throws SQLException;
	   // 1-4. 총 페이지 수
	   int getTotalPages(int numberPerPage) throws SQLException;
	   // 검색시 총페이지
	   int getTotalPages(int numberPerPage, String searchCondition, String searchWord) throws SQLException;
	   
	 //페이징처리가 된 검색 기능	
	ArrayList<BoardDTO> search(String searchCondition, String searchWord, int currentPage, int numberPerPage) throws SQLException;
} // interface
