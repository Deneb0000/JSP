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


//urlPatterns = { "/scott/dept" }) 이 코딩이랑 같은거다 아래를 썼으면 urlPatterns을 생략해도 된다
//@WebServlet("/scott/dept")	
public class ScottDept extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ScottDept() {
		super();
	}

	//post요청, get 요청
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">ScottDept.doget()...");

		//부서정보를 담는 작업 days02>ex01.jsp
		//로직을 처리하는 부분
		Connection conn = null;
		PreparedStatement psmt = null;
		String sql = " SELECT * "
				+ " FROM dept ";
		ResultSet rs = null;
		

		int deptno;
		String dname, loc;
		DeptVO vo = null;
		ArrayList<DeptVO> list = null;
		Iterator<DeptVO> ir;

		try{
			conn = DBConn.getConnection();
			// System.out.println("> conn = " + conn);
			// System.out.println("> conn = " + conn.isClosed());	//닫혀있니? true : 닫혀있음 / False : 열려있음
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			if(rs.next()){
				list = new ArrayList<>();
				do{
					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");

					vo = new DeptVO().builder()
							.deptno(deptno).dname(dname).loc(loc)
							.build();
					list.add(vo);

				}while(rs.next());
			}//if

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				psmt.close();
				DBConn.close();

			}catch(Exception e){
				e.printStackTrace();
			}//try/catch
		}//try/catch/finally


		//ex01_dept.jsp 포워딩..
		// 1) 포워딩하는 jsp 페이지에 전달 하라 +request 객체 저장.
		request.setAttribute("list", list);
		
		String path = "/days04/ex01_dept_jstl.jsp";
		//↑ 404 오류가 뜨는 이유  1.  파일이 없거나		2. 잘못된 경로를 입력
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
		
		//emp
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
