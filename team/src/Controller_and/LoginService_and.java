package Controller_and;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Model.emp_infoDAO;
import Model.emp_infoVO;

@WebServlet("/LoginService_and")
public class LoginService_and extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String emp_id = request.getParameter("emp_id");
		String emp_pw = request.getParameter("emp_pw");
		System.out.println("로그인 확인");
		System.out.println(emp_id);
		System.out.println(emp_pw);

		emp_infoDAO dao = new emp_infoDAO();
		emp_infoVO vo = dao.login(emp_id, emp_pw);

		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		if(vo != null) {
			System.out.println("로그인 성공");
			Gson gson = new Gson();
			String result = gson.toJson(vo);
			out.print(result);
		}else {
			System.out.println("로그인 실패");
			out.print("fail");
		}
		
	}

}
