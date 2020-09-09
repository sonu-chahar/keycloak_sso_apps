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
import org.directwebremoting.annotations.RemoteProperty;
import org.directwebremoting.hibernate.H4BeanConverter;

@Entity
@Table(name = "kcbase_userStats")
@DataTransferObject(type = "hibernate4", converter = H4BeanConverter.class, params = @Param(name = "assumeSession", value = "true"))
public class UserStats implements Serializable {
	private static final long serialVersionUID = -8650965411741170481L;
	private Integer id;
	private String allUsers;
	private String activeUsers;
	private String integratedApps;
	private String activeSessions;
	private String inactiveUsers;
	private String dateSaved;

	public String getDateSaved() {
		return dateSaved;
	}

	public void setDateSaved(String dateSaved) {
		this.dateSaved = dateSaved;
	}

	public UserStats() {
	}

	public UserStats(String integratedApps, String allUsers, String activeUsers, String activeSessions) {
		super();
		this.integratedApps = integratedApps;
		this.allUsers = allUsers;
		this.activeUsers = activeUsers;
		this.activeSessions = activeSessions;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pk_userStats")
	@RemoteProperty
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "allUsers")
	@RemoteProperty
	public String getAllUsers() {
		return allUsers;
	}

	public void setAllUsers(String allUsers) {
		this.allUsers = allUsers;
	}

	@Column(name = "activeUsers")
	@RemoteProperty
	public String getActiveUsers() {
		return activeUsers;
	}

	public void setActiveUsers(String activeUsers) {
		this.activeUsers = activeUsers;
	}

	@Column(name = "integratedApps")
	@RemoteProperty
	public String getIntegratedApps() {
		return integratedApps;
	}

	public void setIntegratedApps(String integratedApps) {
		this.integratedApps = integratedApps;
	}

	@Column(name = "activeSessions")
	@RemoteProperty
	public String getActiveSessions() {
		return activeSessions;
	}

	public void setActiveSessions(String activeSessions) {
		this.activeSessions = activeSessions;
	}

	@Column(name = "inactiveUsers")
	@RemoteProperty
	public String getInactiveUsers() {
		return inactiveUsers;
	}

	public void setInactiveUsers(String inactiveUsers) {
		this.inactiveUsers = inactiveUsers;
	}

}
