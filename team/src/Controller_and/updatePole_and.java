package Controller_and;

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

@WebServlet("/updatePole_and")
public class updatePole_and extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		response.setCharacterEncoding("UTF-8");
		/*
		 * HttpSession session = request.getSession(); poleVO vo =
		 * (poleVO)session.getAttribute("pole"); String pole_code = vo.getPole_code();
		 */
		String pole_code = request.getParameter("pole_code");
		String pole_height = request.getParameter("pole_height");
		String pole_addr = request.getParameter("pole_addr");
		String pole_date = request.getParameter("pole_date");
		String pole_office = request.getParameter("pole_office");
		String pole_high = request.getParameter("pole_high");
		String pole_down = request.getParameter("pole_down");
		String pole_com = request.getParameter("pole_com");
		String transformer_yn = request.getParameter("transformer_yn");
		String pole_level = request.getParameter("pole_level");
		String emp_id = request.getParameter("emp_id");
		
		poleDAO dao = new poleDAO();
		
		int cnt = dao.pole_update(pole_height, pole_addr, pole_date, pole_office, pole_high, pole_down, pole_com, transformer_yn, pole_level, emp_id, pole_code);
		
		if(cnt>0) {
			System.out.println("수정성공");
			
		}else {
			System.out.println("수정실패");
	
		}
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
	}

}
