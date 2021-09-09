package spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="role")
public class roleModel {

	@GeneratedValue
	@Id
	private int role_id;
	
	@Column(length=100,unique = true)
	private String role_name;
	
	@Column(length=200)
	private String privilege_name;

	public roleModel() {
		super();
	}

	public roleModel(int role_id) {
		super();
		this.role_id = role_id;
	}

	public roleModel(String role_name) {
		super();
		this.role_name = role_name;
	}

	public roleModel(int role_id, String role_name) {
		super();
		this.role_id = role_id;
		this.role_name = role_name;
	}

	public int getRole_id() {
		return role_id;
	}

	public String getRole_name() {
		return role_name;
	}

	public String getPrivilege_name() {
		return privilege_name;
	}
	
}
