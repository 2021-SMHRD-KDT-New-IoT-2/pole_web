package Controller;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.emp_infoDAO;

@WebServlet("/assignEmp")

public class assignEmp extends HttpServlet { 
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	

		request.setCharacterEncoding("euc-kr");		
		String emp_id = request.getParameter("emp_id");
		String emp_pw = request.getParameter("emp_pw");
		String emp_name = request.getParameter("emp_name");
		String emp_office = request.getParameter("emp_office");
		String emp_phone = request.getParameter("emp_phone");
		String emp_yesno = request.getParameter("emp_yesno");
		
		System.out.println(emp_id);
		System.out.println(emp_pw);	
		System.out.println(emp_name);
		System.out.println(emp_office);
		System.out.println(emp_phone);
		System.out.println(emp_yesno);
		
		emp_infoDAO dao = new emp_infoDAO();

		int cnt = dao.addemp(emp_id, emp_pw, emp_name, emp_office, emp_phone, emp_yesno);
		

		if(cnt>0) {

			System.out.println("가입성공!");

			

			//forward 방식으로 페이지 이동

			RequestDispatcher rd = request.getRequestDispatcher("assignEmp.jsp");

			

			//request영역에 기억해야할 데이터 설정

			request.setAttribute("emp_name", emp_name);

			

			//페이지 이동할 시 request, response객체 전달

			rd.forward(request, response);

			

		} else {

			System.out.println("가입실패!");

			response.sendRedirect("Main.jsp");

		}

		

	}

	

 

}