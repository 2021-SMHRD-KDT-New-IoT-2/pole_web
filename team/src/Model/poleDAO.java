package Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class poleDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	poleVO vo = null;
	int cnt = 0;
	ArrayList<poleVO> al = null;
	ArrayList<poleVO> lal = null;
	boolean check = false;

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
	
	//필터
	@SuppressWarnings("null")
	public ArrayList<poleVO> filter(String pole_height, String pole_date, String emp_id, String transformer_yn, String pole_office) {
		try {
			
			lal = new ArrayList<poleVO>();
			
			connection();
			String sql = "select * from pole_info where 1=1";
			// 조건이 추가 될 때마다 쿼리를 추가

			psmt = conn.prepareStatement(sql);

			// 웹에서 가져오는 검색 조건의 값만 바인딩
			
			/*
			 * psmt.setString(1, pole_height); psmt.setString(2, pole_date);
			 * psmt.setString(3, transformer_yn); psmt.setString(4, emp_id);
			 * psmt.setString(5, pole_office);
			 */
			 

			rs = psmt.executeQuery();

			while(rs.next()) {

				String getpole_height = rs.getString("pole_height");
				String gettransformer_yn = rs.getString("transformer_yn");
				
				//성민
				String getpole_code = rs.getString("pole_code");
				String getpole_office = rs.getString("pole_office");
				Date getpole_date = rs.getDate("pole_date");
				String getemp_id = rs.getString("emp_id");
				String getpole_eday = rs.getString("pole_eday");
				
				String addQuery = "";

				// 컬럼의 값이 null인지 check, !null이라면 addQuery해서 검색 값 필터링
				if (pole_office != null || !pole_office.equals("")) {
					addQuery += " AND" + getpole_office + "like '%" + pole_office + "%'";
				}
				if (emp_id != null || !emp_id.equals("")) {
					addQuery += " AND" + getemp_id + "like '%" + emp_id + "%'";
				}
				if (pole_date != null || !pole_date.equals("")) {
					addQuery += " AND" + getpole_date + "like '%" + pole_date + "%'";
				}
				if (pole_height != null || !pole_height.equals("")) {
					addQuery += " AND" + getpole_height + "like '%" + pole_height + "%'";
				}
				if (transformer_yn != null || !transformer_yn.equals("")) {
					addQuery += " AND" + gettransformer_yn + "like '%" + transformer_yn + "%'";
				}

				sql += addQuery;

				vo = new poleVO(getpole_code,getpole_date,getemp_id,getpole_eday,getpole_office);
				
				lal.add(vo);				
				
				System.out.println(sql);
			}
		} catch (Exception e) {
			System.out.println("오류로 인한 필터링 실패");
			e.printStackTrace();

		} finally {
			close();
		}
		return lal;
	}
	
	//기기 추가
	public int addmachine(String mac_code) {
		
		try {
			
			connection();
			
			String sql = "insert into machine_info value (?)";
			
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, mac_code);
			
			cnt = psmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("등록실패");
		}finally {
			close();
		}
		
		return cnt;
	}
	
	
	
	// 전주 추가
	public int addpole(String pole_code,String mac_code, String pole_height, String pole_addr, String pole_high, String pole_down, String pole_com, String transformer_yn, String pole_level, String emp_id, String pole_office) {
		try {

			connection();

//	   	         3. 실행할 sql문 정의 (실행할때마다 값이 달라지는 부분은 ? 작성)

			String sql = "insert into pole_info (pole_code,mac_code,pole_height,"
					+ "pole_addr,pole_date,pole_high,pole_down,"
					+ "pole_com,transformer_yn,emp_id, pole_office) "
					+ "values(?,?,?,?,now(),?,?,?,?,?,?)";

//	   	         4. sql문 실행객체 (PreparedStatment)생성

			psmt = conn.prepareStatement(sql);

//	   	         5. 바인드 변수(?) 채우기

			psmt.setString(1, pole_code);
			psmt.setString(2, pole_code);
			psmt.setString(3, pole_height);
			psmt.setString(4, pole_addr);
			psmt.setString(5, pole_high);
			psmt.setString(6, pole_down);
			psmt.setString(7, pole_com);
			psmt.setString(8, transformer_yn);
			psmt.setString(9, emp_id);
			psmt.setString(10, pole_office);
			

//	   	         6. sql문 실행 후 결과처리

			cnt = psmt.executeUpdate();

		} catch (Exception e) {

			System.out.println("등록실패");
			e.printStackTrace();

		} finally {
			close();
		}
		return cnt;
	}

	
	
	// 전주 정보 수정

	public int pole_update(String pole_code, String pole_height, String pole_addr, String pole_high, String pole_down,
			String pole_com, String transformer_yn, String pole_level, String emp_id) {

		try {

			connection();

			String sql = "UPDATE pole_info SET pole_height = ?, pole_addr = ?, pole_high = ?, pole_down = ?, pole_com = ?, transformer_yn = ?, pole_level = ?, emp_id = ?  WHERE pole_code = ?";

			psmt.setString(1, pole_height);
			psmt.setString(2, pole_addr);
			psmt.setString(3, pole_high);
			psmt.setString(4, pole_down);
			psmt.setString(5, pole_com);
			psmt.setString(6, transformer_yn);
			psmt.setString(7, pole_level);
			psmt.setString(8, emp_id);
			psmt.setString(9, pole_code);

			cnt = psmt.executeUpdate();

			System.out.println("수정성공");

		} catch (Exception e) {
			System.out.println("수정실패");
			e.printStackTrace();

		} finally {
			close();
		}
		return cnt;

	}

	// 전주정보 관리

	public ArrayList<poleVO> pole_selectAll() {

		try {

			al = new ArrayList<poleVO>();

			connection();

			String sql = "select * from pole_info";
			
			psmt = conn.prepareStatement(sql);

			rs = psmt.executeQuery();

			while (rs.next()) {

				String getPole_code = rs.getString("pole_code");
				String getMac_code = rs.getString("mac_code");
				String getPole_height = rs.getString("pole_height"); 
				String getPole_addr = rs.getString("pole_addr");
				Date getPole_date = rs.getDate("pole_date");
				String getEmp_id = rs.getString("emp_id");
				String getTransformer_yn = rs.getString("transformer_yn");
				String getPole_com = rs.getString("pole_com");
				String getpole_high = rs.getString("pole_high");
				String getpole_down = rs.getString("pole_down");
				String getPole_coment = rs.getString("pole_coment");
				String getPole_eday = rs.getString("pole_eday");
				String getPole_office= rs.getString("pole_office");
				String getPole_level = rs.getString("pole_level");

				vo = new poleVO(getPole_code, getMac_code, getPole_height, getPole_addr, getPole_date, getEmp_id, getTransformer_yn, getPole_com, getpole_high, getpole_down, getPole_coment, getPole_eday, getPole_level, getPole_office);


//	   	            vo값을 al에 add

				al.add(vo);

			}

		} catch (Exception e) {
			System.out.println("조회실패");
			e.printStackTrace();

		} finally {
			close();
		}
		return al;
	}
	
	// 전주정보

		public poleVO pole_selectONE(String pole_code) {

			try {
				connection();

				String sql = "select * from pole_info where pole_code = ?";
				
				psmt = conn.prepareStatement(sql);
				
				psmt.setString(1, pole_code);

				rs = psmt.executeQuery();

				while (rs.next()) {

					String getPole_code = rs.getString("pole_code");
					String getMac_code = rs.getString("mac_code");
					String getPole_height = rs.getString("pole_height"); 
					String getPole_addr = rs.getString("pole_addr");
					Date getPole_date = rs.getDate("pole_date");
					String getEmp_id = rs.getString("emp_id");
					String getTransformer_yn = rs.getString("transformer_yn");
					String getPole_com = rs.getString("pole_com");
					String getpole_high = rs.getString("pole_high");
					String getpole_down = rs.getString("pole_down");
					String getPole_coment = rs.getString("pole_coment");
					String getPole_eday = rs.getString("pole_eday");
					String getPole_office= rs.getString("pole_office");
					String getPole_level = rs.getString("pole_level");

					vo = new poleVO(getPole_code, getMac_code, getPole_height, getPole_addr, getPole_date, getEmp_id, getTransformer_yn, getPole_com, getpole_high, getpole_down, getPole_coment, getPole_eday,getPole_level, getPole_office);

				}

			} catch (Exception e) {
				System.out.println("조회실패");
				e.printStackTrace();

			} finally {
				close();
			}
			return vo;
		}
		
		
	

	// 전주 삭제

	public int pole_delete(String pole_code) {
		try {
			connection();

			String sql = "DELETE from pole_info where pole_num = ? ";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pole_code);
			cnt = psmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			close();

		}

		return cnt;

	}
	
	

}
