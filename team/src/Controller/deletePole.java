package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.poleDAO;

 

@WebServlet("/deletePole")

public class deletePole extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		PrintWriter out = response.getWriter();		
		String pole_code = request.getParameter("pole_code");		

		System.out.println("delete 서블릿 들어옴");

		poleDAO dao = new poleDAO();

		int cnt = dao.pole_delete(pole_code);

		if(cnt > 0) {

			System.out.println("삭제성공");

			response.sendRedirect("Main.jsp");

		}else {

			System.out.println("삭제실패");

		}

	}

 

}