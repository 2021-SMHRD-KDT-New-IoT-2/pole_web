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

import Model.poleDAO;
import Model.poleVO;

@WebServlet("/poleList_and")
public class poleList_and extends HttpServlet {
   private static final long serialVersionUID = 1L;

   protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

      response.setCharacterEncoding("UTF-8");
      
      poleDAO dao = new poleDAO();
      ArrayList<poleVO> al = dao.pole_selectAll();
      
      // memberList 메소드를 만든 후 아래에서 반복문을 통해 콘솔에 회원정보를 출력
      for (int i = 0; i < al.size(); i++) {
         System.out.println(al.get(i).toString());

      }
      PrintWriter out = response.getWriter();
      response.setCharacterEncoding("UTF-8");
      
      Gson gson = new Gson();
      String result = gson.toJson(al);

      out.print(result);
      
      
   }

}