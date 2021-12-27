package Controller_and;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Model.tiltDAO;
import Model.tiltVO;

@WebServlet("/pole_tilt_info_get")
public class pole_tilt_info_get extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("utf-8");
		System.out.println("žë´Ù");
		String pole_code = request.getParameter("pole_code");
		tiltDAO tdao = new tiltDAO();
		ArrayList<tiltVO> tal = tdao.tilt_info(pole_code);
		System.out.println(pole_code);
		System.out.println(tal.get(1).getTilt_date());
		System.out.println(tal.get(2).getTilt_date());
		System.out.println(tal.get(3).getTilt_date());
		System.out.println(tal.get(4).getTilt_date());
		System.out.println(tal.size());
		
		Gson gson = new Gson();
		
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		out.print(gson.toJson(tal));
		
	
	
	}

}
