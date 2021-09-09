package spring.model;

import java.sql.Date;

import javax.annotation.Generated;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

import spring.model.customerModel;
import spring.model.garageModel;
import spring.model.userVehicleModel;

@Entity
@Table(name="service")
public class serviceModel {

	@Id
	@GeneratedValue
	private int service_id;
	
	@DateTimeFormat(pattern="dd-MMM-yyyy")
	private java.util.Date service_date;
	
	@DateTimeFormat(pattern="dd-MMM-yyyy")
	private java.util.Date delivery_date;
	
	@Column(length=100)
	private String amount;
	
	@Column(length=100)
	private String parts;
	
	@NumberFormat(pattern = "#,###,###,###.##")
	private float t_amount;
	
	@Column(columnDefinition = "binary default 0", nullable = false, length = 1)
	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean recieved_status;
	
	@Column(columnDefinition = "binary default 0", nullable = false, length = 1)
	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean delivered_status;
	
	@Column(columnDefinition = "binary default 0", nullable = false, length = 1)
	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean feedback_status;
	
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.MERGE)
	@JoinColumn(name="garage_id")
	private garageModel gm;
	
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="uv_id")
	private userVehicleModel uvm;
	
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="cust_id")
	private customerModel cm;

	public serviceModel() {
		super();
	}

	public serviceModel(int service_id) {
		super();
		this.service_id = service_id;
	}

	public serviceModel(java.util.Date service_date, java.util.Date delivery_date, String amount, String parts,
			float t_amount, garageModel gm, userVehicleModel uvm, customerModel cm) {
		super();
		this.service_date = service_date;
		this.delivery_date = delivery_date;
		this.amount = amount;
		this.parts = parts;
		this.t_amount = t_amount;
		this.gm = gm;
		this.uvm = uvm;
		this.cm = cm;
	}

	public serviceModel(java.util.Date service_date, String amount, String parts, float t_amount, garageModel gm,
			userVehicleModel uvm, customerModel cm) {
		super();
		this.service_date = service_date;
		this.amount = amount;
		this.parts = parts;
		this.t_amount = t_amount;
		this.gm = gm;
		this.uvm = uvm;
		this.cm = cm;
	}

	public int getService_id() {
		return service_id;
	}

	public java.util.Date getService_date() {
		return service_date;
	}

	public java.util.Date getDelivery_date() {
		return delivery_date;
	}

	public String getAmount() {
		return amount;
	}

	public String getParts() {
		return parts;
	}

	public garageModel getGm() {
		return gm;
	}

	public userVehicleModel getUvm() {
		return uvm;
	}

	public customerModel getCm() {
		return cm;
	}

	public boolean isRecieved_status() {
		return recieved_status;
	}

	public boolean isDelivered_status() {
		return delivered_status;
	}

	public serviceModel(int service_id, java.util.Date service_date, java.util.Date delivery_date, String amount,
			String parts, float t_amount, boolean recieved_status, boolean delivered_status, garageModel gm,
			userVehicleModel uvm, customerModel cm) {
		super();
		this.service_id = service_id;
		this.service_date = service_date;
		this.delivery_date = delivery_date;
		this.amount = amount;
		this.parts = parts;
		this.t_amount = t_amount;
		this.recieved_status = recieved_status;
		this.delivered_status = delivered_status;
		this.gm = gm;
		this.uvm = uvm;
		this.cm = cm;
	}

	public serviceModel(java.util.Date service_date, java.util.Date delivery_date, String amount, String parts,
			float t_amount, boolean recieved_status, boolean delivered_status, garageModel gm, userVehicleModel uvm,
			customerModel cm) {
		super();
		this.service_date = service_date;
		this.delivery_date = delivery_date;
		this.amount = amount;
		this.parts = parts;
		this.t_amount = t_amount;
		this.recieved_status = recieved_status;
		this.delivered_status = delivered_status;
		this.gm = gm;
		this.uvm = uvm;
		this.cm = cm;
	}

	public serviceModel(String amount, String parts, float t_amount, garageModel gm, userVehicleModel uvm,
			customerModel cm) {
		super();
		this.amount = amount;
		this.parts = parts;
		this.t_amount = t_amount;
		this.gm = gm;
		this.uvm = uvm;
		this.cm = cm;
	}

	public void setService_date(java.util.Date service_date) {
		this.service_date = service_date;
	}

	public void setDelivery_date(java.util.Date delivery_date) {
		this.delivery_date = delivery_date;
	}

	public void setRecieved_status(boolean recieved_status) {
		this.recieved_status = recieved_status;
	}

	public void setDelivered_status(boolean delivered_status) {
		this.delivered_status = delivered_status;
	}
	
	public float getT_amount() {
		return t_amount;
	}

	public boolean isFeedback_status() {
		return feedback_status;
	}

	public serviceModel(int service_id, java.util.Date service_date, java.util.Date delivery_date, String amount,
			String parts, float t_amount, boolean recieved_status, boolean delivered_status, boolean feedback_status,
			garageModel gm, userVehicleModel uvm, customerModel cm) {
		super();
		this.service_id = service_id;
		this.service_date = service_date;
		this.delivery_date = delivery_date;
		this.amount = amount;
		this.parts = parts;
		this.t_amount = t_amount;
		this.recieved_status = recieved_status;
		this.delivered_status = delivered_status;
		this.feedback_status = feedback_status;
		this.gm = gm;
		this.uvm = uvm;
		this.cm = cm;
	}

	public void setFeedback_status(boolean feedback_status) {
		this.feedback_status = feedback_status;
	}
}

