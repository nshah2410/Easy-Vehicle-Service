package spring.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import spring.model.serviceModel;

public class requestpartModel {

	@OneToOne(fetch=FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name="request_id")
	private requestModel rm;
	
	private List<ArrayList> parts;

	public requestpartModel(requestModel rm, List<ArrayList> parts) {
		super();
		this.rm = rm;
		this.parts = parts;
	}

	public requestModel getRm() {
		return rm;
	}

	public List<ArrayList> getParts() {
		return parts;
	}

	public requestpartModel() {
		super();
	}
	
}
