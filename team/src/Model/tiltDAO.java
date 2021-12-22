package Model;

import java.sql.Connection;
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
	
public ArrayList<tiltVO> tiltvalue() {
		
		tiltVO tvo = new tiltVO();
		ArrayList<tiltVO> al = new ArrayList<tiltVO>();
		
		try {
			
		connection();

		String sql = "Select * from pole_tilt_info";
		
		psmt = conn.prepareStatement(sql);

		rs = psmt.executeQuery();
		
		while(rs.next()){
			
			String getMac_code = rs.getString("mac_code");
			String getTilt_date = rs.getString("tilt_date");
			int getTilt_value = rs.getInt("tilt_value");
			
			tvo = new tiltVO(getMac_code,getTilt_date,getTilt_value);
			
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
	//그래프
	public ArrayList<tiltVO> tilt_info(String mac_code) {
		tiltVO vo = null;
		ArrayList<tiltVO> tal = new ArrayList<tiltVO>();
		try {
			connection();

			String sql = "select * from pole_tilt_info where mac_code = ? order by tilt_value desc";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, mac_code);

			rs = psmt.executeQuery();

			while (rs.next()) {
				
				int tilt_value=rs.getInt("tilt_value");
				String tilt_date=rs.getString("tilt_date");

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

