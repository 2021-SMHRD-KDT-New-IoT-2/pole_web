package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import Model.poleDAO;
import Model.poleVO;


@WebServlet("/pole_Memo")
public class pole_Memo extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("EUC-KR");
		response.setCharacterEncoding("EUC-KR");
		
		String pole_code = request.getParameter("pole_code");
		String pole_comment = request.getParameter("pole_comment");
		String pole_memo = request.getParameter("pole_memo");

		if(pole_comment == null || pole_comment.equals("null")) {
			pole_comment="";
		}
		
		poleDAO dao = new poleDAO();
		
		int cnt = dao.webmemo(pole_memo, pole_comment, pole_code);
		
		if(cnt>0) {
			System.out.println("수정성공");
			
			//수정된 값 출력하도록 세션수정
			
			response.sendRedirect("managePole.jsp?pole_code="+pole_code);
			
		}else {
			System.out.println("수정실패");
			response.sendRedirect("managePole.jsp?pole_code="+pole_code);
		}
	}

}
