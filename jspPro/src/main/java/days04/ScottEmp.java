package days04;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.doit.domain.EmpVO;

import com.util.DBConn;


//@WebServlet("/scott/emp")
public class ScottEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
    	public ScottEmp() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(">ScottEmp.doGet()...");
	
		
		int deptno;
		String pDeptno = request.getParameter("deptno");
		try{
		deptno = Integer.parseInt(pDeptno);
			
		}catch(Exception e){
			deptno = 10;
		}

	Connection conn = null;		//db연결
		PreparedStatement psmt = null;
		String sql = " SELECT empno, ename, job, mgr, "
				+" TO_CHAR(hiredate,'yyyy-MM-dd')hiredate, sal,  comm, deptno "
				+ " FROM emp "
				+ " WHERE deptno = ? ";	// ? : 파라미터값 넘어올곳
		ResultSet rs = null;
						
		int empno,mgr;
		String ename, job;
		Date hiredate;
		//LocalDateTime hiredate;
		double sal, comm;
		


		EmpVO vo = null;
		ArrayList<EmpVO> list = null;
		Iterator<EmpVO> ir = null;
		
		try{
			conn = DBConn.getConnection();
			// System.out.println("> conn = " + conn);
			// System.out.println("> conn = " + conn.isClosed());	//닫혀있니? true : 닫혀있음 / False : 열려있음
			psmt = conn.prepareStatement(sql);
			//?파라미터 값을 줘야함
			psmt.setInt(1, deptno);	// 실행하기 전에 줘야할 값 줘야지				
					
			rs = psmt.executeQuery();
			if(rs.next()){
				list = new ArrayList<>();
				do{
					empno = rs.getInt("empno");
					ename = rs.getString("ename");
					job = rs.getString("job");
					mgr = rs.getInt("mgr");
					hiredate = rs.getDate("hiredate");
					//hiredate = rs.getTimestamp("hiredate").toLocalDateTime();
					sal = rs.getInt("sal");
					comm = rs.getInt("comm");
					
					vo = new EmpVO().builder()
									.empno(empno)
									.ename(ename)
									.job(job)
									.mgr(mgr)
									.hiredate(hiredate)
									.sal(sal)
									.comm(comm)
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
		
		request.setAttribute("list", list);
	      
	      String path = "/days04/ex01_emp.jsp";
	      RequestDispatcher dispatcher = request.getRequestDispatcher(path);
	      dispatcher.forward(request, response);
	}
	
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
