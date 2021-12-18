package Model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
 

public class emp_infoDAO {
   
   Connection conn = null;
   PreparedStatement psmt = null;
   ResultSet rs = null;
   emp_infoVO vo = null;
   ArrayList<emp_infoVO> al =null;
   boolean check= false;
   int cnt = 0;

   //동적연결
   public void connection() {
   
      try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         String url="jdbc:mysql://project-db-stu.ddns.net:3307/pole_db";
         String dbid="pole_db";
         String dbpw="1004hw";

         System.out.println("연결성공");
         conn = DriverManager.getConnection(url,dbid,dbpw);
         
      	} catch (Exception e) {

    	 System.out.println("연결실패");
         e.printStackTrace();

      }

   }

   

//   접속끊기

   public void close() {
      try {
         if(rs!=null) {
            rs.close();
      }
         if(psmt!=null) {
            psmt.close();
         }
         if(conn!=null) {
            conn.close();
         }

         
      } catch (Exception e2) {
         e2.printStackTrace();

      }

   }

   

   // 관리자 추가

   public int addemp(String emp_id,String emp_pw,String emp_name, String emp_office, String emp_phone, String emp_yesno) {
   
      try {

         

         connection();

         

//         3. 실행할 sql문 정의 (실행할때마다 값이 달라지는 부분은 ? 작성)

         String sql = "insert into emp_info values (?,?,?,?,?,now(),?)";

         

//         4. sql문 실행객체 (PreparedStatment)생성

         psmt = conn.prepareStatement(sql);

         

//         5. 바인드 변수(?) 채우기

         psmt.setString(1,emp_id);

         psmt.setString(2,emp_pw);

         psmt.setString(3,emp_name);

         psmt.setString(4,emp_office);

         psmt.setString(5,emp_phone);

         psmt.setString(6, emp_yesno);

 

         

//         6. sql문 실행 후 결과처리

         cnt = psmt.executeUpdate();

         

      } catch (Exception e) {

         

         System.out.println("가입실패");

         e.printStackTrace();

         

      }finally {

         close();

      }

      return cnt;

   }

   

   // 로그인

   public emp_infoVO login(String emp_id, String emp_pw) {


      try {
         connection();

         String sql = "select * from emp_info where emp_id=? and emp_pw =?";
         psmt = conn.prepareStatement(sql);
         psmt.setString(1,emp_id);
         psmt.setString(2,emp_pw);       
         
         rs = psmt.executeQuery();
       

         if(rs.next()){
            System.out.println("로그인성공!");

            String getemp_id = rs.getString("emp_id");
            String getemp_pw = rs.getString("emp_pw");
            String getemp_name = rs.getString("emp_name");
            String getemp_Office = rs.getString("emp_office");
            String getemp_phone = rs.getString("emp_phone");
            String getadmin_yesno = rs.getString("admin_yesno");

            vo = new emp_infoVO(getemp_id, getemp_pw, getemp_name, getemp_Office, getemp_phone, getadmin_yesno);
           

         }else {
            System.out.println("로그인실패!");
         }   

      } catch (Exception e) {
         System.out.println("로그인실패");
         e.printStackTrace();
         

      }finally {
         close();
      }
      return vo;
   }

   

   // 관리자 정보 수정

   public int update(String emp_id, String emp_pw,String emp_name, String emp_office, String emp_phone, String emp_yesno) {

      try {

         connection();

         

         String sql = "UPDATE emp_info SET emp_pw = ?, emp_name =?, emp_office = ?, emp_phone = ?, emp_yesno = ? WHERE emp_id = ?";

         

         psmt = conn.prepareStatement(sql);

         

         psmt.setString(1,emp_pw);

         psmt.setString(2,emp_name);

         psmt.setString(3,emp_office);

         psmt.setString(4,emp_phone);

         psmt.setString(5,emp_yesno);

         psmt.setString(6,emp_id);

 

         cnt = psmt.executeUpdate();

         

      } catch (Exception e) {

         System.out.println("수정실패");

         e.printStackTrace();

         

      }finally {

         close();

      }

      return cnt;

   }

   

//  회원정보 관리

   public ArrayList<emp_infoVO> selectAll() {

      try {

//         회원정보를 저장할 ArrayList

         al = new ArrayList<emp_infoVO>();

         

         connection();

//         3. 실행할 sql문 정의 (실행할때마다 값이 달라지는 부분은 ? 작성)

         String sql = "select * from emp_info";

         

//         4. sql문 실행객체 (PreparedStatment)생성

         psmt = conn.prepareStatement(sql);

 

//         6. sql문 실행 후 결과처리

         rs = psmt.executeQuery();

         

         while(rs.next()){

            

            String getemp_id = rs.getString("emp_id");

            String getemp_name = rs.getString("emp_name");

            String getemp_office = rs.getString("emp_office");

            String getemp_phone = rs.getString("emp_phone");

            String getemp_yesno = rs.getString("emp_yesni");

            

            vo = new emp_infoVO(getemp_id,getemp_name,getemp_office,getemp_phone,getemp_yesno);   

//            vo값을 al에 add

            al.add(vo);

         }

            

      } catch (Exception e) {

         System.out.println("조회실패");

         e.printStackTrace();

         

      }finally {

         close();

      }

      return al;

   }

   

   

   

   

   

   

   

   

//   관리자 삭제

   public int delete(String emp_id) {

//      삭제완료 => 삭제완료!

//      삭제미완료 => 삭제실패!

      try {

         connection();

         

            String sql = "DELETE from admin where emp_id=?";

                  

         

   //         4. sql문 실행객체 (PreparedStatment)생성

            psmt = conn.prepareStatement(sql);

 

            psmt.setString(1, emp_id);

   //         6. sql문 실행 후 결과처리

            cnt = psmt.executeUpdate();

            

      } catch (Exception e) {

         e.printStackTrace();

      }finally {

         close();   

      }

      return cnt;

   }

 

}