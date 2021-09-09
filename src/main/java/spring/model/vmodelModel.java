package spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;

@Entity
@Table(name="vehicle_model")
public class vmodelModel implements Serializable {
	
	@Id
	@GeneratedValue
	private int vmodel_id;
	@Column(length=4)
	private String model_name;
	@Column(length=20)
	private int year;
	
	@ManyToOne
	@JoinColumn(name="company_id")
	@Expose(serialize = false)
	private companyModel cm;

	public vmodelModel() {
		super();
	}

	public vmodelModel(String model_name, int year, companyModel cm) {
		super();
		this.model_name = model_name;
		this.year = year;
		this.cm = cm;
	}

	public vmodelModel(int vmodel_id, String model_name, int year, companyModel cm) {
		super();
		this.vmodel_id = vmodel_id;
		this.model_name = model_name;
		this.year = year;
		this.cm = cm;
	}

	public vmodelModel(int vmodel_id) {
		super();
		this.vmodel_id = vmodel_id;
	}

	public int getVmodel_id() {
		return vmodel_id;
	}

	public String getModel_name() {
		return model_name;
	}

	public int getYear() {
		return year;
	}

	public companyModel getCm() {
		return cm;
	}
}
