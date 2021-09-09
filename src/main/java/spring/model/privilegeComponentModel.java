package spring.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="privilege_component")
public class privilegeComponentModel {

	@Id
	@GeneratedValue
	private int pc_id;
	@Column(unique=true,length=500)
	private String component_name;
	@Column(unique=true,length=500)
	private String link;
	
	@ManyToOne
	@JoinColumn(name="p_id")
	private privilegeModel pm;
	
	public privilegeComponentModel(int pc_id) {
		super();
		this.pc_id = pc_id;
	}

	public privilegeComponentModel(String component_name, String link, privilegeModel pm) {
		super();
		this.component_name = component_name;
		this.link = link;
		this.pm = pm;
	}

	public privilegeComponentModel() {
		super();
	}

	public int getPc_id() {
		return pc_id;
	}

	public String getComponent_name() {
		return component_name;
	}

	public String getLink() {
		return link;
	}

	public privilegeModel getPm() {
		return pm;
	}
}
