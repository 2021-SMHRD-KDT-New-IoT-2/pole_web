package Model;

import java.sql.Date;

public class tiltVO {
	private int tilt_seq;
	private String mac_code;
	private String tilt_value;
	private Date tilt_date;
	
	public int getTilt_seq() {
		return tilt_seq;
	}

	public void setTilt_seq(int tilt_seq) {
		this.tilt_seq = tilt_seq;
	}

	public String getMac_code() {
		return mac_code;
	}

	public void setMac_code(String mac_code) {
		this.mac_code = mac_code;
	}

	public String getTilt_value() {
		return tilt_value;
	}

	public void setTilt_value(String tilt_value) {
		this.tilt_value = tilt_value;
	}

	public Date getTilt_date() {
		return tilt_date;
	}

	public void setTilt_date(Date tilt_date) {
		this.tilt_date = tilt_date;
	}

	public tiltVO(int tilt_seq, String mac_code, String tilt_value, Date tilt_date) {
		super();
		this.tilt_seq = tilt_seq;
		this.mac_code = mac_code;
		this.tilt_value = tilt_value;
		this.tilt_date = tilt_date;
	}

	public tiltVO() {
		
	}
}
