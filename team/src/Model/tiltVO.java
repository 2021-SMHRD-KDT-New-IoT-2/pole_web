package Model;

import java.sql.Date;

public class tiltVO {
	
	private String mac_code;
	private double tilt_value;
	private Date tilt_date;
	
	public tiltVO () {
		
	}
	
	public tiltVO(String mac_code, double tilt_value, Date tilt_date) {
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
	public double getTilt_value() {
		return tilt_value;
	}
	public void setTilt_value(double tilt_value) {
		this.tilt_value = tilt_value;
	}
	public Date getTilt_date() {
		return tilt_date;
	}
	public void setTilt_date(Date tilt_date) {
		this.tilt_date = tilt_date;
	}
	
	

}
