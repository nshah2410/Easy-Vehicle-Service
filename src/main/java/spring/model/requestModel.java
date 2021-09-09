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

import org.hibernate.annotations.Type;

import spring.model.serviceModel;

@Entity
@Table(name="request")
public class requestModel {

	@Id
	@GeneratedValue
	private int request_id;
	
	@Column(columnDefinition = "binary default 0", nullable = false, length = 1)
	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean request_status;

	@Column(columnDefinition = "binary default 1", nullable = false, length = 1)
	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean request_visibilty_status;

	@Column(columnDefinition = "binary default 0", nullable = false, length = 1)
	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean appointment_status;
	
	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL/*{CascadeType.PERSIST, CascadeType.REFRESH}*/ )
	@JoinColumn(name="service_id")
	private serviceModel sm;

	public requestModel() {
		super();
	}

	public requestModel(int request_id) {
		super();
		this.request_id = request_id;
	}

	public requestModel(boolean request_status, boolean request_visibilty_status, boolean appointment_status,
			serviceModel sm) {
		super();
		this.request_status = request_status;
		this.request_visibilty_status = request_visibilty_status;
		this.appointment_status = appointment_status;
		this.sm = sm;
	}

	public requestModel(int request_id, boolean request_status, boolean request_visibilty_status,
			boolean appointment_status, serviceModel sm) {
		super();
		this.request_id = request_id;
		this.request_status = request_status;
		this.request_visibilty_status = request_visibilty_status;
		this.appointment_status = appointment_status;
		this.sm = sm;
	}

	public int getRequest_id() {
		return request_id;
	}

	public boolean isRequest_status() {
		return request_status;
	}

	public boolean isRequest_visibilty_status() {
		return request_visibilty_status;
	}

	public boolean isAppointment_status() {
		return appointment_status;
	}

	public serviceModel getSm() {
		return sm;
	}

	public void setAppointment_status(boolean appointment_status) {
		this.appointment_status = appointment_status;
	}
	
}
