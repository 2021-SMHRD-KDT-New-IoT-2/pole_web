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

import Model.cameraDAO;
import Model.cameraVO;

@WebServlet("/al_camera")
public class al_camera extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setCharacterEncoding("utf-8");
		System.out.println("žë´Ù");
		
		cameraDAO cdao = new cameraDAO();
		
		ArrayList<cameraVO> cal = cdao.cameravalue();	

		System.out.println(cal.get(0).getCamera_date());
		
		Gson gson = new Gson();
		
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();

		out.print(gson.toJson(cal));
	}

}
