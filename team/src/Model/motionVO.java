package Model;

public class motionVO {
	
	private int motion_num;
	private String pole_num;
	private String location;
	private String motion_date;
	private String user_id;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	private String date;
	
	public int getMotion_num() {
		return motion_num;
	}
	public void setMotion_num(int motion_num) {
		this.motion_num = motion_num;
	}
	public String getPole_num() {
		return pole_num;
	}
	public void setPole_num(String pole_num) {
		this.pole_num = pole_num;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMotion_date() {
		return motion_date;
	}
	public void setMotion_date(String motion_date) {
		this.motion_date = motion_date;
	}
	
}
