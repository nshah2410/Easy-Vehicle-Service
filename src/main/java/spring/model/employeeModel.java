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

@Entity
@Table(name="employee")
public class employeeModel {
	
	@Id
	@GeneratedValue
	@Column(length=20)
	private int emp_id;
	@Column(length=50)
	private String emp_name;
	@Column(length=50,unique=true)
	private String email_id;
	@Column(length=10)
	private long mobile_no;
	@Column(length=10)
	private String gender;
	
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="dept_no")
	private departmentModel dm;
	
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="user_id")
	private loginModel rm;
	
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinColumn(name="garage_id")
	private garageModel gm;

	public employeeModel() {
		super();
	}

	public employeeModel(int emp_id) {
		super();
		this.emp_id = emp_id;
	}

	public employeeModel(String emp_name, String email_id, long mobile_no, String gender, departmentModel dm,
			loginModel rm, garageModel gm) {
		super();
		this.emp_name = emp_name;
		this.email_id = email_id;
		this.mobile_no = mobile_no;
		this.gender = gender;
		this.dm = dm;
		this.rm = rm;
		this.gm = gm;
	}

	public employeeModel(int emp_id, String emp_name, String email_id, long mobile_no, String gender,
			departmentModel dm, loginModel rm, garageModel gm) {
		super();
		this.emp_id = emp_id;
		this.emp_name = emp_name;
		this.email_id = email_id;
		this.mobile_no = mobile_no;
		this.gender = gender;
		this.dm = dm;
		this.rm = rm;
		this.gm = gm;
	}

	public int getEmp_id() {
		return emp_id;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public String getEmail_id() {
		return email_id;
	}

	public long getMobile_no() {
		return mobile_no;
	}

	public String getGender() {
		return gender;
	}

	public departmentModel getDm() {
		return dm;
	}

	public loginModel getRm() {
		return rm;
	}

	public garageModel getGm() {
		return gm;
	}
}
