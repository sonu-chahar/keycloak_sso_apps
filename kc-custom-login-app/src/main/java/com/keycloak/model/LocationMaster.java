package com.keycloak.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.directwebremoting.annotations.DataTransferObject;
import org.directwebremoting.annotations.Param;
import org.directwebremoting.hibernate.H4BeanConverter;

@Entity
@Table(name = "kcbase_locationMaster")
@DataTransferObject(type = "hibernate4", converter = H4BeanConverter.class, params = @Param(name = "assumeSession", value = "true"))
public class LocationMaster extends BaseEntity implements Serializable {

	private static final long serialVersionUID = 2243176202598079944L;

	private Integer id;

	private String countryName;
	private String stateName;
	private String cityName;
	private String localityName;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pk_locationMaster")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "countryName")
	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	@Column(name = "stateName")
	public String getStateName() {
		return stateName;
	}

	public void setStateName(String stateName) {
		this.stateName = stateName;
	}

	@Column(name = "cityName")
	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	@Column(name = "localityName")
	public String getLocalityName() {
		return localityName;
	}

	public void setLocalityName(String localityName) {
		this.localityName = localityName;
	}

}
