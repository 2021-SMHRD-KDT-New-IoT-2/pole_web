package Model;

import java.sql.Date;

public class tiltVO {
	private String mac_code;
	private int tilt_value;
	private Date tilt_date;
	
	public tiltVO() {
		super();
	}
		
	public tiltVO(String mac_code, int tilt_value) {
		super();
		this.mac_code = mac_code;
		this.tilt_value = tilt_value;
	}

	public tiltVO(int tilt_value, Date tilt_date) {
		super();
		this.tilt_value = tilt_value;
		this.tilt_date = tilt_date;
	}
	
	public tiltVO(String mac_code, int tilt_value, Date tilt_date) {
		super();
		this.mac_code = mac_code;
		this.tilt_value = tilt_value;
		this.tilt_date = tilt_date;
	}
	
	public String getMac_code() {
		return mac_code;
	}
	
	public void setMac_code(String mac_code) {
		this.mac_code = mac_code;
	}
	
	public int getTilt_value() {
		return tilt_value;
	}
	
	public void setTilt_value(int tilt_value) {
		this.tilt_value = tilt_value;
	}
	
	public Date getTilt_date() {
		return tilt_date;
	}
	
	public void setTilt_date(Date tilt_date) {
		this.tilt_date = tilt_date;
	}
	
}
