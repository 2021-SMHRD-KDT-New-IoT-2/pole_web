package Controller_and;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.poleDAO;

 

@WebServlet("/deletePole_and")

public class deletePole_and extends HttpServlet {
	private static final long serialVersionUID = 1L;

 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8"); // 안드로이드는 UTF-8
		
		PrintWriter out = response.getWriter();		
		String pole_code = request.getParameter("pole_code");		

		System.out.println("delete 서블릿 들어옴");

		poleDAO dao = new poleDAO();
		System.out.println("code:"+pole_code);
		int cnt=dao.pole_delete(pole_code);
		/*try {
			cnt = dao.pole_delete(pole_code);
		}catch(Exception e) {
			out.print("fail");
		}*/
		if(cnt > 0) {

			System.out.println("삭제성공");

			//response.sendRedirect("Main.jsp");
			out.print("ok");

		}else {

			System.out.println("삭제실패");
			out.print("fail");
		}

		request.setCharacterEncoding("UTF-8"); // 안드로이드는 UTF-8
	}

 

}