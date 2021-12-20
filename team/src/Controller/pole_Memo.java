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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String pole_code = request.getParameter("pole_code");
		String pole_coment = request.getParameter("pole_coment");

		
		poleDAO dao = new poleDAO();
		
		int cnt = dao.webmemo(pole_coment, pole_code);
		
		System.out.println(pole_coment);
		System.out.println(pole_code);
		if(cnt>0) {
			System.out.println("수정성공");
			
			//수정된 값 출력하도록 세션수정
			
			response.sendRedirect("managePole.jsp");
			
		}else {
			System.out.println("수정실패");
			response.sendRedirect("managePole.jsp");
		}
	}

}
