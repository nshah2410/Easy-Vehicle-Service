package spring.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.gson.annotations.Expose;

@Entity
@Table(name="area")
public class areaModel implements Serializable{

	@Id
	@GeneratedValue
	private int area_id;
	@Column(length=6,unique=true)
	private int pincode;
	@Column(length=20,unique=true)
	private String area_name;
	
	@ManyToOne
	@JoinColumn(name="city_id")
	@Expose(serialize = false)
	private cityModel cm;
	
	public areaModel() {
		super();
	}
	public areaModel(int area_id) {
		super();
		this.area_id = area_id;
	}
	public areaModel(int pincode, String area_name) {
		super();
		this.pincode = pincode;
		this.area_name = area_name;
	}
	public areaModel(int area_id, int pincode, String area_name) {
		super();
		this.area_id = area_id;
		this.pincode = pincode;
		this.area_name = area_name;
	}
	public areaModel(int pincode, String area_name, cityModel cm) {
		super();
		this.pincode = pincode;
		this.area_name = area_name;
		this.cm = cm;
	}
	public areaModel(int area_id, int pincode, String area_name, cityModel cm) {
		super();
		this.area_id = area_id;
		this.pincode = pincode;
		this.area_name = area_name;
		this.cm = cm;
	}
	public int getArea_id() {
		return area_id;
	}
	public int getPincode() {
		return pincode;
	}
	public String getArea_name() {
		return area_name;
	}
	public cityModel getCm() {
		return cm;
	}
	
}
