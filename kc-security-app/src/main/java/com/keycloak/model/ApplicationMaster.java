package com.keycloak.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.directwebremoting.annotations.DataTransferObject;
import org.directwebremoting.annotations.Param;
import org.directwebremoting.annotations.RemoteProperty;
import org.directwebremoting.hibernate.H4BeanConverter;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
@Table(name = "kcbase_applicationMaster")
@DataTransferObject(type = "hibernate4", converter = H4BeanConverter.class, params = @Param(name = "assumeSession", value = "true"))
public class ApplicationMaster {
	private Integer id;
	private String applicationDisplayName;
	private String applicationUrl;
	private Boolean isActive;
	private String applicationLanguage;
	private String logoImageName;
	private String logoImageExtension;
	private CommonsMultipartFile logoImageFile;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pk_applicationMaster")
	@RemoteProperty
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "applicationDisplayName")
	@RemoteProperty
	public String getApplicationDisplayName() {
		return applicationDisplayName;
	}

	public void setApplicationDisplayName(String applicationDisplayName) {
		this.applicationDisplayName = applicationDisplayName;
	}

	@Column(name = "applicationUrl")
	@RemoteProperty
	public String getApplicationUrl() {
		return applicationUrl;
	}

	public void setApplicationUrl(String applicationUrl) {
		this.applicationUrl = applicationUrl;
	}

	@Column(name = "isActive")
	@RemoteProperty
	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	@Column(name = "applicationLanguage")
	@RemoteProperty
	public String getApplicationLanguage() {
		return applicationLanguage;
	}

	public void setApplicationLanguage(String applicationLanguage) {
		this.applicationLanguage = applicationLanguage;
	}

	@Column(name = "logoImageName")
	@RemoteProperty
	public String getLogoImageName() {
		return logoImageName;
	}

	public void setLogoImageName(String logoImageName) {
		this.logoImageName = logoImageName;
	}

	@Column(name = "logoImageExtension")
	@RemoteProperty
	public String getLogoImageExtension() {
		return logoImageExtension;
	}

	public void setLogoImageExtension(String logoImageExtension) {
		this.logoImageExtension = logoImageExtension;
	}

	@Transient
	public CommonsMultipartFile getLogoImageFile() {
		return logoImageFile;
	}

	public void setLogoImageFile(CommonsMultipartFile logoImageFile) {
		this.logoImageFile = logoImageFile;
	}

}
