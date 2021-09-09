package spring.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="privilege")
public class privilegeModel {

	@Id
	@GeneratedValue
	private int p_id;
	@Column(length = 50 , unique = true)
	private String privilege_name;
	
	@OneToMany(mappedBy="pm",fetch=FetchType.EAGER)
	private List<privilegeComponentModel> pcm;
	
	public privilegeModel(int p_id, String privilege_name) {
		super();
		this.p_id = p_id;
		this.privilege_name = privilege_name;
	}
	public privilegeModel(int p_id) {
		super();
		this.p_id = p_id;
	}
	public privilegeModel(String privilege_name) {
		super();
		this.privilege_name = privilege_name;
	}
	public int getP_id() {
		return p_id;
	}
	public String getPrivilege_name() {
		return privilege_name;
	}
	public privilegeModel() {
		super();
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public void setPrivilege_name(String privilege_name) {
		this.privilege_name = privilege_name;
	}
	public List<privilegeComponentModel> getPcm() {
		return pcm;
	}
	public void setPcm(List<privilegeComponentModel> pcm) {
		this.pcm = pcm;
	}
	
}
