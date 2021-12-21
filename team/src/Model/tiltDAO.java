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
	
public ArrayList<tiltVO> tiltvalue(double tilt_value, String mac_code) {
		
		tiltVO tvo = new tiltVO();
		ArrayList<tiltVO> al = new ArrayList<tiltVO>();
		
		try {
			
		connection();

		String sql = "Select * from pole_tilt_info";
		
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, mac_code);
		psmt.setDouble(2, tilt_value);

		rs = psmt.executeQuery();
		
		while(rs.next()){
			
			String getMac_code = rs.getString("mac_code");
			double getTilt_value = rs.getDouble("tilt_value");
			
			
			tvo = new tiltVO(getMac_code, getTilt_value);
			
			al.add(tvo);
			}
		
		} catch (Exception e) {
			System.out.println();
			e.printStackTrace();
			} finally {
				close();
		}
		return al;
	}
}

