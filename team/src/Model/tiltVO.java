package Model;


public class tiltVO {
	private String mac_code;
	private String tilt_date;
	private int tilt_value;
	
	private String camera_date;
	private String impact_date;
	
	public tiltVO() {
		super();
	}
		
	public tiltVO(String mac_code, String tilt_date, int tilt_value) {
		super();
		this.mac_code = mac_code;
		this.tilt_date = tilt_date;
		this.tilt_value = tilt_value;
	}

	public tiltVO(String mac_code, int tilt_value) {
		super();
		this.mac_code = mac_code;
		this.tilt_value = tilt_value;
	}

	public tiltVO(int tilt_value, String tilt_date) {
		super();
		this.tilt_value = tilt_value;
		this.tilt_date = tilt_date;
	}
	
	public tiltVO(String mac_code, int tilt_value, String tilt_date) {
		super();
		this.mac_code = mac_code;
		this.tilt_value = tilt_value;
		this.tilt_date = tilt_date;
	}
	/*---------------------------------------- 모든알람---------------------------------------- */
	public tiltVO(String mac_code, String tilt_date, int tilt_value, String camera_date, String impact_date) {
		super();
		this.mac_code = mac_code;
		this.tilt_date = tilt_date;
		this.tilt_value = tilt_value;
		this.camera_date = camera_date;
		this.impact_date = impact_date;
	}
	/*---------------------------------------- 모든알람---------------------------------------- */
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
	
	public String getTilt_date() {
		return tilt_date;
	}
	
	public void setTilt_date(String tilt_date) {
		this.tilt_date = tilt_date;
	}
	
}
