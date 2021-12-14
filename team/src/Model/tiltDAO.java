package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class tiltDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	tiltVO vo = null;
	int cnt = 0;
}
