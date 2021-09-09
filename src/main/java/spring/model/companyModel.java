package spring.model;

import java.io.Serializable;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="vehicle_company")
public class companyModel implements Serializable {

	@Id
	@GeneratedValue
	private int company_id;
	@Column(length=20, unique = true)
	private String company_name;
	
	@OneToMany(mappedBy="cm",fetch=FetchType.EAGER)
	@JsonIgnore
	private List<vmodelModel> vm;
	
	public companyModel(String company_name, List<vmodelModel> vm) {
		super();
		this.company_name = company_name;
		this.vm = vm;
	}
	public companyModel(int company_id, String company_name, List<vmodelModel> vm) {
		super();
		this.company_id = company_id;
		this.company_name = company_name;
		this.vm = vm;
	}
	public companyModel(int company_id, String company_name) {
		super();
		this.company_id = company_id;
		this.company_name = company_name;
	}
	public companyModel() {
		super();
	}
	public companyModel(int company_id) {
		super();
		this.company_id = company_id;
	}
	public companyModel(String company_name) {
		super();
		this.company_name = company_name;
	}
	public int getCompany_id() {
		return company_id;
	}
	public String getCompany_name() {
		return company_name;
	}
	public List<vmodelModel> getVm() {
		return vm;
	}
	
	
}
