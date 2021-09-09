package spring.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="city")
public class cityModel implements Serializable{
	
	@Id
	@GeneratedValue
	private int city_id;
	@Column(length= 20, unique = true)
	private String city_name;
	
	@OneToMany(mappedBy="cm",fetch=FetchType.EAGER)
	@JsonIgnore
	private List<areaModel> am;
	
	public cityModel() {
		super();
	}
	public cityModel(int city_id) {
		super();
		this.city_id = city_id;
	}
	public cityModel(String city_name) {
		super();
		this.city_name = city_name;
	}
	public cityModel(int city_id, String city_name) {
		super();
		this.city_id = city_id;
		this.city_name = city_name;
	}
	public List<areaModel> getAm() {
		return am;
	}
	public cityModel(int city_id, String city_name, List<areaModel> am) {
		super();
		this.city_id = city_id;
		this.city_name = city_name;
		this.am = am;
	}
	public int getCity_id() {
		return city_id;
	}
	public String getCity_name() {
		return city_name;
	}

	
	
}
