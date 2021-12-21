package Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class tiltDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	tiltVO vo = null;
	int cnt = 0;
	
	public void connection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
	         String url="jdbc:mysql://project-db-stu.ddns.net:3307/pole_db";
	         String dbid="pole_db";
	         String dbpw="1004hw";

			System.out.println("연결성공");
			conn = DriverManager.getConnection(url, dbid, dbpw);

		} catch (Exception e) {
			System.out.println("연결실패");
			e.printStackTrace();
		}

	}

	public void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (Exception e2) {
			e2.printStackTrace();
		}
		
	} 
	
	// 기울기 업데이트
	public int tiltupdate(String mac_code, String tilt_value) {
		try {
			connection();
			
			String sql = "UPDATE pole_tilt_info SET tilt_value = ? where mac_code = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, tilt_value);
			psmt.setString(2, mac_code);
			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("기울기 업데이트 실패");
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	//그래프
	public ArrayList<tiltVO> tilt_info(String pole_code) {
		tiltVO vo = null;
		ArrayList<tiltVO> tal = new ArrayList<tiltVO>();
		try {
			connection();

			String sql = "select * from pole_tilt_info where mac_code = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, pole_code);

			rs = psmt.executeQuery();

			while (rs.next()) {
				
				double tilt_value=rs.getDouble("tilt_value");
				Date tilt_date=rs.getDate("tilt_date");

				vo= new tiltVO(tilt_value,tilt_date);
				
				tal.add(vo);
			}

		} catch (Exception e) {
			System.out.println("조회실패");
			e.printStackTrace();

		} finally {
			close();
		}
		
		return tal;
	}
	
}

