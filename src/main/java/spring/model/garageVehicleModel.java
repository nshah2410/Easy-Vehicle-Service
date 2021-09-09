package spring.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="garageVehicle")
public class garageVehicleModel {
	
	@Id
	@GeneratedValue
	private int gv_id;
	
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="vmodel_id")
	private vmodelModel vm;

	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="garage_id")
	private garageModel gm;

	public garageVehicleModel() {
		super();
	}

	public garageVehicleModel(int gv_id) {
		super();
		this.gv_id = gv_id;
	}

	public garageVehicleModel(int gv_id, vmodelModel vm, garageModel gm) {
		super();
		this.gv_id = gv_id;
		this.vm = vm;
		this.gm = gm;
	}

	public garageVehicleModel(vmodelModel vm, garageModel gm) {
		super();
		this.vm = vm;
		this.gm = gm;
	}

	public int getGv_id() {
		return gv_id;
	}

	public vmodelModel getVm() {
		return vm;
	}

	public garageModel getGm() {
		return gm;
	}
	
}
