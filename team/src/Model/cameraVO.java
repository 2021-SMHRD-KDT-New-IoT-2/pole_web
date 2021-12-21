package Model;

import java.sql.Date;

public class cameraVO {
	
	private int camera_seq;
	private String mac_code;
	private String camera_date;
	
	public int getCamera_seq() {
		return camera_seq;
	}
	public void setCamera_seq(int camera_seq) {
		this.camera_seq = camera_seq;
	}
	public String getMac_code() {
		return mac_code;
	}
	public void setMac_code(String mac_code) {
		this.mac_code = mac_code;
	}

	public String getCamera_date() {
		return camera_date;
	}
	public void setCamera_date(String camera_date) {
		this.camera_date = camera_date;
	}
	public cameraVO(int camera_seq, String mac_code, String camera_date) {
		super();
		this.camera_seq = camera_seq;
		this.mac_code = mac_code;
		this.camera_date = camera_date;
	}
	
	public cameraVO() {
	}
	
	public cameraVO(String mac_code, String camera_date) {
		super();
		this.mac_code = mac_code;
		this.camera_date = camera_date;
	}
	
	
}
