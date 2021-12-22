package Controller;

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

@WebServlet("/AjaxTest")
public class AjaxChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String pole_code = request.getParameter("pole_code");
		tiltDAO tdao = new tiltDAO();
		ArrayList<tiltVO> tal = tdao.tilt_info(pole_code);
		
		Gson gson = new Gson();
		
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		out.print(gson.toJson(tal));
		
	
	
	}

}
