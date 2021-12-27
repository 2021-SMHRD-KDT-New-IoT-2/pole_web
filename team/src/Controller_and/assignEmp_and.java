package Controller_and;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.emp_infoDAO;

@WebServlet("/assignEmp_and")

public class assignEmp_and extends HttpServlet { 
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	

		response.setCharacterEncoding("UTF-8");
		
		
		String emp_id = request.getParameter("emp_id");
		String emp_pw = request.getParameter("emp_pw");
		String emp_name = request.getParameter("emp_name");
		String emp_office = request.getParameter("emp_office");
		String emp_phone = request.getParameter("emp_phone");
		String admin_yesno = request.getParameter("admin_yesno");
		
		System.out.println(emp_id);
		System.out.println(emp_pw);	
		System.out.println(emp_name);
		System.out.println(emp_office);
		System.out.println(emp_phone);
		System.out.println(admin_yesno);
		
		emp_infoDAO dao = new emp_infoDAO();

		int cnt = dao.addemp(emp_id, emp_pw, emp_name, emp_office, emp_phone, admin_yesno);
		
		
		if(cnt>0) {
			System.out.println("가입성공!");
		} else {
			System.out.println("가입실패!");
		}

		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
	}

	

 

}