package spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="user_vehicle")
public class userVehicleModel {

	@Id
	@GeneratedValue
	private int uv_id;
	@Column(length=15)
	private String vehicle_no;
	
	@ManyToOne
	@JoinColumn(name="cust_id")
	private customerModel cm;
	
	@ManyToOne
	@JoinColumn(name="vmodel_id")
	private vmodelModel vm;

	public userVehicleModel() {
		super();
	}

	public userVehicleModel(int uv_id) {
		super();
		this.uv_id = uv_id;
	}

	public userVehicleModel(String vehicle_no, customerModel cm, vmodelModel vm) {
		super();
		this.vehicle_no = vehicle_no;
		this.cm = cm;
		this.vm = vm;
	}

	public userVehicleModel(int uv_id, String vehicle_no, customerModel cm, vmodelModel vm) {
		super();
		this.uv_id = uv_id;
		this.vehicle_no = vehicle_no;
		this.cm = cm;
		this.vm = vm;
	}

	public int getUv_id() {
		return uv_id;
	}

	public String getVehicle_no() {
		return vehicle_no;
	}

	public customerModel getCm() {
		return cm;
	}

	public vmodelModel getVm() {
		return vm;
	}
}
