package days04.board.persistence;

import java.sql.SQLException;
import java.util.ArrayList;

import days04.board.domain.BoardDTO;

public interface BoardDAO {
	
	ArrayList<BoardDTO> select() throws SQLException;
	
	// 2. 게시글 쓰기
	   int insert(BoardDTO dto) throws SQLException;

}
