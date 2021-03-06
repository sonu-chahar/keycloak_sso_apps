package com.keycloak.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.directwebremoting.annotations.DataTransferObject;
import org.directwebremoting.annotations.Param;
import org.directwebremoting.annotations.RemoteProperty;
import org.directwebremoting.hibernate.H4BeanConverter;

@Entity
@Table(name = "kcbase_customUserSessionRepresentation")
@DataTransferObject(type = "hibernate4", converter = H4BeanConverter.class, params = @Param(name = "assumeSession", value = "true"))
public class CustomUserSessionRepresentation implements Serializable {

	private static final long serialVersionUID = -5432494614782199979L;
	
	private Long id;
	private String username;
	private String userId;
	private String ipAddress;
	private Long start;
	private Long lastAccess;
	private Date insDate;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pk_customUserSessionRepresentation")
	@RemoteProperty
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "username")
	@RemoteProperty
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "userId")
	@RemoteProperty
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Column(name = "ipAddress")
	@RemoteProperty
	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	@Column(name = "start")
	@RemoteProperty
	public Long getStart() {
		return start;
	}

	public void setStart(Long start) {
		this.start = start;
	}

	@Column(name = "lastAccess")
	@RemoteProperty
	public Long getLastAccess() {
		return lastAccess;
	}

	public void setLastAccess(Long lastAccess) {
		this.lastAccess = lastAccess;
	}

	@Column(name = "insDate")
	@RemoteProperty
	public Date getInsDate() {
		return insDate;
	}

	public void setInsDate(Date insDate) {
		this.insDate = insDate;
	}

}
