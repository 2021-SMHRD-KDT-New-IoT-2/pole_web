package Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class cameraDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	poleVO vo = null;
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
	
	// 모션감지 업데이트
	public int camupdate(String mac_code, Date camera_date) {
		try {
			connection();
			
			String sql = "UPDATE pole_camera_info SET camera_date = ? where mac_code = ?";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setDate(1, camera_date);
			psmt.setString(2, mac_code);
			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("모션감지 업데이트 실패");
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}
	
}
