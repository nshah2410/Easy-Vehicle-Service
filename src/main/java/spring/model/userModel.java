package spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class userModel {
	
	@Id
	@GeneratedValue
	private int user_id;
	
	@Column(length=500)
	private String name;
	@Column(length=500,unique=true)
	private String email_id;
	@Column(unique=true)
	private long mobile_no;
	@Column(length=100)
	private String password;
	@Column(length=10)
	private String gender;
	@Column(length=100)
	private String privilege;
	
	@OneToOne
	@JoinColumn(name="role_id")
	private roleModel rm1;
	
	public String getGender() {
		return gender;
	}

	public String getPrivilege() {
		return privilege;
	}
	
	public userModel(String name, String email_id, long mobile_no, String password, String gender, roleModel rm1,
			String privilege) {
		super();
		this.name = name;
		this.email_id = email_id;
		this.mobile_no = mobile_no;
		this.password = password;
		this.gender = gender;
		this.rm1 = rm1;
		this.privilege = privilege;
	}



	public userModel() {
		super();
	}

	public int getUser_id() {
		return user_id;
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

	public String getPassword() {
		return password;
	}

	public roleModel getRm1() {
		return rm1;
	}

	public userModel(int user_id, String name, String email_id, long mobile_no, String password, String gender,
			roleModel rm) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.email_id = email_id;
		this.mobile_no = mobile_no;
		this.password = password;
		this.gender = gender;
		this.rm1 = rm1;
	}	

	public userModel(int user_id) {
		super();
		this.user_id = user_id;
	}

	public userModel(String name, String email_id, long mobile_no, String password, String gender, roleModel rm1) {
		super();
		this.name = name;
		this.email_id = email_id;
		this.mobile_no = mobile_no;
		this.password = password;
		this.gender = gender;
		this.rm1 = rm1;
	}

	public userModel(int user_id, String privilege) {
		super();
		this.user_id = user_id;
		this.privilege = privilege;
	}

	public void setPrivilege(String privilege) {
		this.privilege = privilege;
	}
}
