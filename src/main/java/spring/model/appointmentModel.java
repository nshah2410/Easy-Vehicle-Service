package spring.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="appointment")
public class appointmentModel {

	public requestModel getRm() {
		return rm;
	}

	@Id
	@GeneratedValue
	private int appointment_id;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date date;
	
	@DateTimeFormat(pattern="HH:mm:ss")
	private Date time_slot;
	
	@OneToOne(fetch=FetchType.EAGER,cascade = CascadeType.ALL)
	@JoinColumn(name="emp_id")
	private employeeModel em;
	
	@OneToOne(fetch=FetchType.EAGER,cascade = {CascadeType.PERSIST, CascadeType.REFRESH} )
	@JoinColumn(name="request_id")
	private requestModel rm;

	public appointmentModel() {
		super();
	}

	public appointmentModel(int appointment_id) {
		super();
		this.appointment_id = appointment_id;
	}

	public appointmentModel(Date date, Date time_slot, employeeModel em, requestModel rm) {
		super();
		this.date = date;
		this.time_slot = time_slot;
		this.em = em;
		this.rm = rm;
	}

	public appointmentModel(int appointment_id, Date date, Date time_slot, employeeModel em, requestModel rm) {
		super();
		this.appointment_id = appointment_id;
		this.date = date;
		this.time_slot = time_slot;
		this.em = em;
		this.rm = rm;
	}

	public int getAppointment_id() {
		return appointment_id;
	}

	public Date getDate() {
		return date;
	}

	public Date getTime_slot() {
		return time_slot;
	}

	public employeeModel getEm() {
		return em;
	}

	public void setEm(employeeModel em) {
		this.em = em;
	}
	
}
