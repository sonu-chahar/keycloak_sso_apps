package com.keycloak.model;

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
@Table(name = "kcbase_userApplicationMapping")
@DataTransferObject(type = "hibernate4", converter = H4BeanConverter.class, params = @Param(name = "assumeSession", value = "true"))
public class UserApplicationMapping {
	private Long id;
	private Long userMasterId;
	private Integer applicationId;
	
	public UserApplicationMapping() {
	}

	public UserApplicationMapping(Long userMasterId, Integer applicationId) {
		this.userMasterId = userMasterId;
		this.applicationId = applicationId;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pk_userApplicationMapping")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getUserMasterId() {
		return userMasterId;
	}

	public void setUserMasterId(Long userMasterId) {
		this.userMasterId = userMasterId;
	}

	public Integer getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(Integer applicationId) {
		this.applicationId = applicationId;
	}
}
