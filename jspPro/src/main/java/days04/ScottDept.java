package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.doit.domain.DeptVO;

import com.util.DBConn;

// urlPatterns = {" /scott/dept "} // 밑과 동일
// @WebServlet("/scott/dept") 
public class ScottDept extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ScottDept() {
		super();

	}

	// post 요청, get 요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet()");

		// 로직 처리
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = " SELECT * "
				+ " FROM dept ";
		ResultSet rs = null;

		int deptno;
		String dname, loc;
		DeptVO vo = null;
		ArrayList<DeptVO> list = null;
		Iterator<DeptVO> ir = null;

		try{
			conn = DBConn.getConnection();
			// System.out.println("> Conn = " + conn);
			// System.out.println("> isClosed = " + conn.isClosed());
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				list = new ArrayList<>();
				do{

					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");

					vo = new DeptVO().builder()
							.deptno(deptno).dname(dname).loc(loc).build();

					list.add(vo);

				}while(rs.next());
			} // if
		}catch(Exception e){

		}finally{
			try{
				pstmt.close();
				DBConn.close();
			}catch(Exception e){
				e.printStackTrace();
			}

		} // try

		// 1. jsp 페이지에 전달 + request 객체에다 저장한다.
		// EL 로 받으면 "list" 이름을 따라간다.
		request.setAttribute("list", list); // 보낸다.
		// ex01_dept.jsp 포워딩
		// 서블릿이 이미 /jspPro 안에 있어서 contextPath 가 없어도 상관없다.
		// String path = "/days04/ex01_dept.jsp";
		String path = "/days04/ex01_dept_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	} // doGet

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
