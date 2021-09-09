package spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="department")
public class departmentModel {
	
	@Id
	@GeneratedValue
	private int dept_no;
	@Column(length=20, unique = true)
	private String department_name;
	
	public int getDept_no() {
		return dept_no;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public departmentModel(int dept_no, String department_name) {
		super();
		this.dept_no = dept_no;
		this.department_name = department_name;
	}
	public departmentModel(int dept_no) {
		super();
		this.dept_no = dept_no;
	}
	public departmentModel(String department_name) {
		super();
		this.department_name = department_name;
	}
	public departmentModel() {
		super();
	}

}
