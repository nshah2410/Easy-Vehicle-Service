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
@Table(name="garage_inventory")
public class garageInventoryModel {

	@Id
	@GeneratedValue
	private int gi_id;
	
	@Column(length=100)
	private String price;
	
	@Column(length=100)
	private String quantity;
	
	@Column(length=100)
	private String parts;
	
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="vmodel_id")
	private vmodelModel vm;

	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="garage_id")
	private garageModel gm;

	public garageInventoryModel() {
		super();
	}
	
	public garageInventoryModel(int gi_id) {
		super();
		this.gi_id = gi_id;
	}

	public garageInventoryModel(String price, String quantity, String parts, vmodelModel vm, garageModel gm) {
		super();
		this.price = price;
		this.quantity = quantity;
		this.parts = parts;
		this.vm = vm;
		this.gm = gm;
	}

	public garageInventoryModel(int gi_id, String price, String quantity, String parts, vmodelModel vm,
			garageModel gm) {
		super();
		this.gi_id = gi_id;
		this.price = price;
		this.quantity = quantity;
		this.parts = parts;
		this.vm = vm;
		this.gm = gm;
	}

	public int getGi_id() {
		return gi_id;
	}

	public String getPrice() {
		return price;
	}

	public String getQuantity() {
		return quantity;
	}

	public String getParts() {
		return parts;
	}

	public vmodelModel getVm() {
		return vm;
	}

	public garageModel getGm() {
		return gm;
	}
	
}
