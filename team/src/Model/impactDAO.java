package Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class impactDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	impactVO vo = null;
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
public ArrayList<impactVO> impactvalue(String impact_date, String mac_code) {
		
		impactVO ivo = new impactVO();
		ArrayList<impactVO> al = new ArrayList<impactVO>();
		
		try {
			
		connection();

		String sql = "Select * from pole_impact_info";
		
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, mac_code);
		psmt.setString(2, impact_date);

		rs = psmt.executeQuery();
		
		while(rs.next()){
			
			String getMac_code = rs.getString("mac_code");
			String getImpact_date = rs.getString("impact_date");
			
			
			ivo = new impactVO(getMac_code, getImpact_date);
			
			al.add(ivo);
			
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
