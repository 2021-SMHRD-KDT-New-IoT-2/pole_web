package Controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/poleInfo")
public class poleInfo extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		
		String pole_code = request.getParameter("pole_code");
		String pole_height = request.getParameter("pole_height");
		String pole_addr = request.getParameter("pole_addr");
		String pole_date = request.getParameter("pole_date");
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date to = null;
		
		try {
			to = (Date) transFormat.parse(pole_date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String pole_office = request.getParameter("pole_office");
		String pole_high = request.getParameter("pole_high");
		String pole_down = request.getParameter("pole_down");
		String pole_com = request.getParameter("pole_com");
		String transformer_yn = request.getParameter("transformer_yn");
		String pole_level = request.getParameter("pole_level");
	}

}
