package days10;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


//@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UploadServlet() {
        super();
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}

	//첨부파일 처리는 post
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		//첨부파일 1개		request.getParameter(String name);
		Collection<Part> parts =	request.getParts();
		String contentType = request.getContentType();
		
		//out.print(contentType);
		//multipart/form-data; boundary=----WebKitFormBoundarynj0vnLgohFolWmLk
		
		if (contentType != null 
	            && contentType.toLowerCase().startsWith("multipart/")) {
	         printPartInfo(request, out);
	      } else {
	         out.print("> multipart 아니다. ");
	      } // 
		
		out.print("<html>");
		out.print("<body>");
	}


	private void printPartInfo(HttpServletRequest request, PrintWriter out) throws IOException, ServletException {
		Collection<Part> parts =	request.getParts();
		for (Part part : parts) {
			out.print("<br>");
			out.print("> name : " + part.getName());
			String contentType  = request.getContentType();
			out.print("<br> contentType : " + contentType);
			if(part.getHeader("Content-Disposition").contains("filename=")) {
				out.print("<br> > size : " + part.getSize());
				String fileName = part.getSubmittedFileName(); // 업로드된 파일 이름
				out.print("<br> > fileName :" + fileName); // a1.txt
				if (part.getSize() >0) {
					part.write("C:\\temp\\" + fileName);
					part.delete(); // 임시파일 삭제
				}//if
			}else { //일반파라미터
				String paramValue= request.getParameter( part.getName() );
	            out.println("<br> > paramValue : " + paramValue );
	         } // if
	         out.print("<hr>");
	      } // foreach
	   } // printPartInfo

	}

