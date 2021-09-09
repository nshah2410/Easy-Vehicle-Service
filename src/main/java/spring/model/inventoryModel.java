package spring.model;

import java.io.Serializable;

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
@Table(name="inventory")
public class inventoryModel implements Serializable {

	@Id
	@GeneratedValue
	private int part_id;
	@Column(length=20)
	private String part_name;
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="vmodel_id")
	private vmodelModel vm;
	public inventoryModel() {
		super();
	}
	public inventoryModel(int part_id) {
		super();
		this.part_id = part_id;
	}
	
	public inventoryModel(String part_name, vmodelModel vm) {
		super();
		this.part_name = part_name;
		this.vm = vm;
	}
	public inventoryModel(int part_id, String part_name) {
		super();
		this.part_id = part_id;
		this.part_name = part_name;
	}
	public inventoryModel(int part_id, String part_name, vmodelModel vm) {
		super();
		this.part_id = part_id;
		this.part_name = part_name;
		this.vm = vm;
	}
	public int getPart_id() {
		return part_id;
	}
	public String getPart_name() {
		return part_name;
	}
	public vmodelModel getVm() {
		return vm;
	}
	
}
