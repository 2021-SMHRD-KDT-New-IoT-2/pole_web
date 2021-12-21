package Model;


public class impactVO {
	private int impact_seq;
	private String mac_code;
	private String impact_date;
	
	public int getImpact_seq() {
		return impact_seq;
	}
	public void setImpact_seq(int impact_seq) {
		this.impact_seq = impact_seq;
	}
	public String getMac_code() {
		return mac_code;
	}
	public void setMac_code(String mac_code) {
		this.mac_code = mac_code;
	}
	public String getImpact_date() {
		return impact_date;
	}
	public void setImpact_date(String impact_date) {
		this.impact_date = impact_date;
	}
	public impactVO(int impact_seq, String mac_code, String impact_date) {
		super();
		this.impact_seq = impact_seq;
		this.mac_code = mac_code;
		this.impact_date = impact_date;
	}
	
	public impactVO(){
		
	}
	
	public impactVO(String mac_code, String impact_date) {
		super();
		this.mac_code = mac_code;
		this.impact_date = impact_date;
	}
	
	
}
