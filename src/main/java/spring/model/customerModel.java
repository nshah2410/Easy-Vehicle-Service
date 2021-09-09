package spring.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="customer")
public class customerModel {

	@Id
	@GeneratedValue
	private int cust_id;
	@Column(length=50)
	private String name;
	@Column(length=50,unique = true)
	private String email_id;
	@Column(length=10)
	private long mobile_no;
	@Column(length=200)
	private String address;
	@Column(length=10)
	private String gender;
	
	@OneToMany(mappedBy="cm",fetch=FetchType.EAGER)
	private List<userVehicleModel> uvm;
	
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="user_id")
	private loginModel rm;
	
	public loginModel getRm() {
		return rm;
	}
	public customerModel(String name, String email_id, long mobile_no, String address, String gender, loginModel rm) {
		super();
		this.name = name;
		this.email_id = email_id;
		this.mobile_no = mobile_no;
		this.address = address;
		this.gender = gender;
		this.rm = rm;
	}
	public int getCust_id() {
		return cust_id;
	}
	public String getName() {
		return name;
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
	public String getGender() {
		return gender;
	}
	public customerModel(String name, String email_id, long mobile_no, String address, String gender) {
		super();
		this.name = name;
		this.email_id = email_id;
		this.mobile_no = mobile_no;
		this.address = address;
		this.gender = gender;
	}
	public customerModel(int cust_id, String name, String email_id, long mobile_no, String address, String gender) {
		super();
		this.cust_id = cust_id;
		this.name = name;
		this.email_id = email_id;
		this.mobile_no = mobile_no;
		this.address = address;
		this.gender = gender;
	}
	public customerModel(String name, String email_id, long mobile_no, loginModel rm) {
		super();
		this.name = name;
		this.email_id = email_id;
		this.mobile_no = mobile_no;
		this.rm = rm;
	}
	public customerModel(int cust_id) {
		super();
		this.cust_id = cust_id;
	}
	public customerModel() {
		super();
	}
	public customerModel(int cust_id, String name, String email_id, long mobile_no, String address, String gender,
			loginModel rm) {
		super();
		this.cust_id = cust_id;
		this.name = name;
		this.email_id = email_id;
		this.mobile_no = mobile_no;
		this.address = address;
		this.gender = gender;
		this.rm = rm;
	}
	public List<userVehicleModel> getUvm() {
		return uvm;
	}
	
}
