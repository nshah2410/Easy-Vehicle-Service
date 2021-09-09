package spring.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.NumberFormat;

@Entity
@Table(name="garage")
public class garageModel {

	@Id
	@GeneratedValue
	private int garage_id;
	@Column(length=50)
	private String garage_name;
	@Column(length=25)
	private String email_id;
	@Column(length=10)
	private long mobile_no;
	@Column(length=100)
	private String address;

	@Column(length=1,columnDefinition = "default 0", nullable=true)
	@NumberFormat(pattern = "#.##")
	private Float feedback;
	
	public void setFeedback(float feedback) {
		this.feedback = feedback;
	}


	public Float getFeedback() {
		return feedback;
	}


	public garageModel(int garage_id, String garage_name, String email_id, long mobile_no, String address,
			Float feedback, cityModel cm, areaModel am, loginModel rm) {
		super();
		this.garage_id = garage_id;
		this.garage_name = garage_name;
		this.email_id = email_id;
		this.mobile_no = mobile_no;
		this.address = address;
		this.feedback = feedback;
		this.cm = cm;
		this.am = am;
		this.rm = rm;
	}

	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="city_id")
	private cityModel cm;
	
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="area_id")
	private areaModel am;
	
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="user_id")
	private loginModel rm;
	
	public garageModel() {
		super();
	}
	

	public loginModel getRm() {
		return rm;
	}


	public garageModel(int garage_id, String garage_name, String email_id, long mobile_no, String address,
			cityModel cm, areaModel am, loginModel rm) {
		super();
		this.garage_id = garage_id;
		this.garage_name = garage_name;
		this.email_id = email_id;
		this.mobile_no = mobile_no;
		this.address = address;
		this.cm = cm;
		this.am = am;
		this.rm = rm;
	}


	public garageModel(String garage_name, String email_id, long mobile_no, String address, cityModel cm, areaModel am,
			loginModel rm) {
		super();
		this.garage_name = garage_name;
		this.email_id = email_id;
		this.mobile_no = mobile_no;
		this.address = address;
		this.cm = cm;
		this.am = am;
		this.rm = rm;
	}


	public int getGarage_id() {
		return garage_id;
	}

	public String getGarage_name() {
		return garage_name;
	}

	public String getEmail_id() {
		return email_id;
	}

	public long getMobile_no() {
		return mobile_no;
	}

	public String getAddress() {
		return address;
	}

	public cityModel getCm() {
		return cm;
	}

	public areaModel getAm() {
		return am;
	}
}
