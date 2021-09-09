package spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="login")
public class loginModel {
	
	@GeneratedValue
	@Id
	private int user_id;
	@Column(length=50, unique = true)
	private String username;
	@Column(length=50)
	private String password;
	@Column(length=20)
	private String role;
	public int getUser_id() {
		return user_id;
	}
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public String getRole() {
		return role;
	}
	public loginModel(String username, String password, String role) {
		super();
		this.username = username;
		this.password = password;
		this.role = role;
	}
	public loginModel(int user_id, String username, String password, String role) {
		super();
		this.user_id = user_id;
		this.username = username;
		this.password = password;
		this.role = role;
	}
	public loginModel() {
		super();
	}
	
}
