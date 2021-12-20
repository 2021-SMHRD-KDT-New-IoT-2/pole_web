package Model;

import java.sql.Date;

public class poleVO {
	private String pole_code;
	private String mac_code;
	private String pole_height;
	private String pole_addr;
	private String pole_date;
	private String emp_id;
	private String transformer_yn;
	private String pole_com;
	private String pole_high;
	private String pole_down;
	private String pole_comment;
	private String pole_eday;
	private String pole_level;
	private String pole_office;
	
	
	public String getPole_level() {
		return pole_level;
	}


	public void setPole_level(String pole_level) {
		this.pole_level = pole_level;
	}


	public String getPole_office() {
		return pole_office;
	}


	public void setPole_office(String pole_office) {
		this.pole_office = pole_office;
	}



	public String getPole_code() {
		return pole_code;
	}
	public void setPole_code(String pole_code) {
		this.pole_code = pole_code;
	}
	public String getMac_code() {
		return mac_code;
	}
	public void setMac_code(String mac_code) {
		this.mac_code = mac_code;
	}
	public String getPole_height() {
		return pole_height;
	}
	public void setPole_height(String pole_height) {
		this.pole_height = pole_height;
	}
	public String getPole_addr() {
		return pole_addr;
	}
	public void setPole_addr(String pole_addr) {
		this.pole_addr = pole_addr;
	}
	public String getPole_date() {
		return pole_date;
	}
	public void setPole_date(String pole_date) {
		this.pole_date = pole_date;
	}
	public String getEmp_id() {
		return emp_id;
	}
	public void setEmp_id(String emp_id) {
		this.emp_id = emp_id;
	}
	public String getTransformer_yn() {
		return transformer_yn;
	}
	public void setTransformer_yn(String transformer_yn) {
		this.transformer_yn = transformer_yn;
	}
	public String getPole_com() {
		return pole_com;
	}
	public void setPole_com(String pole_com) {
		this.pole_com = pole_com;
	}
	public String getPole_high() {
		return pole_high;
	}
	public void setPole_high(String pole_high) {
		this.pole_high = pole_high;
	}
	public String getPole_down() {
		return pole_down;
	}
	public void setPole_down(String pole_down) {
		this.pole_down = pole_down;
	}
	public String getPole_comment() {
		return pole_comment;
	}
	public void setPole_comment(String pole_comment) {
		this.pole_comment = pole_comment;
	}
	public String getPole_eday() {
		return pole_eday;
	}
	public void setPole_eday(String pole_eday) {
		this.pole_eday = pole_eday;
	}


	@Override
	public String toString() {
		return "poleVO [pole_code=" + pole_code + ", mac_code=" + mac_code + ", pole_height=" + pole_height
				+ ", pole_addr=" + pole_addr + ", pole_date=" + pole_date + ", emp_id=" + emp_id + ", transformer_yn="
				+ transformer_yn + ", pole_com=" + pole_com + ", pole_high=" + pole_high + ", pole_down=" + pole_down
				+ ", pole_comment=" + pole_comment + ", pole_eday=" + pole_eday + ", pole_level=" + pole_level
				+ ", pole_office=" + pole_office + "]";
	}


	public poleVO(String pole_code, String mac_code, String pole_height, String pole_addr, String pole_date,
			String emp_id, String transformer_yn, String pole_com, String pole_high, String pole_down,
			String pole_comment, String pole_eday, String pole_level, String pole_office) {
		super();
		this.pole_code = pole_code;
		this.mac_code = mac_code;
		this.pole_height = pole_height;
		this.pole_addr = pole_addr;
		this.pole_date = pole_date;
		this.emp_id = emp_id;
		this.transformer_yn = transformer_yn;
		this.pole_com = pole_com;
		this.pole_high = pole_high;
		this.pole_down = pole_down;
		this.pole_comment = pole_comment;
		this.pole_eday = pole_eday;
		this.pole_level = pole_level;
		this.pole_office = pole_office;
	}


	public poleVO(String pole_code, String pole_office, String emp_id, String pole_date, String pole_height, String transformer_yn) {
		super();
		this.pole_code = pole_code;
		this.pole_office = pole_office;
		this.emp_id = emp_id;
		this.pole_date = pole_date;
		this.pole_height = pole_height;
		this.transformer_yn = transformer_yn;
		
	}


	public poleVO() {
		
	}


	public poleVO(String mac_code, String pole_comment) {
		super();
		this.mac_code = mac_code;
		this.pole_comment = pole_comment;
	}
	

	
}

