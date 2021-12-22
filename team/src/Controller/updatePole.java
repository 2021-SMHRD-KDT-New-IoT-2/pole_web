package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Model.poleDAO;
import Model.poleVO;

@WebServlet("/updatePole")
public class updatePole extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");

		HttpSession session = request.getSession(); 
		poleVO vo = (poleVO)session.getAttribute("pole"); 
		String pole_code = vo.getPole_code(); 
		
		String pole_office = request.getParameter("pole_office");
		String pole_high = request.getParameter("pole_high");
		String pole_down = request.getParameter("pole_down");
		String pole_com = request.getParameter("pole_com");
		String transformer_yn = request.getParameter("transformer_yn");
		String pole_level = request.getParameter("pole_level");
		String emp_id = request.getParameter("emp_id");
		
		poleDAO dao = new poleDAO();
		
		int cnt = dao.pole_update(pole_code,pole_office, pole_high, pole_down, pole_com, transformer_yn, pole_level, emp_id);
		

		if(cnt>0) {
			System.out.println("수정성공");
			
			//수정된 값 출력하도록 세션수정
			poleVO vo2 = new poleVO(pole_code,pole_office, pole_high, pole_down, pole_com, transformer_yn, pole_level, emp_id);
			
			session.setAttribute("pole", vo2);
			
			response.sendRedirect("managePole.jsp");
			
		}else {
			System.out.println("수정실패");
			response.sendRedirect("managePole.jsp");
		}
		
	}

}
