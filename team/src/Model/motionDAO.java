package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class motionDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	motionVO vo = null;
	int cnt = 0;

}
