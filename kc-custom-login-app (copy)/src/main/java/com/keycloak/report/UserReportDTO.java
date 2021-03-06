package com.keycloak.report;

import java.util.Date;
import java.util.Set;

import org.springframework.format.annotation.DateTimeFormat;

import com.keycloak.model.ApplicationMaster;

public class UserReportDTO {

	private String name;
	private Boolean isActive;
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private Date fromDate;
	private Date toDate;
	private Set<ApplicationMaster> enrolledApplications;
	private Date lastLoginTime;
	private String lastLoginIp;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	public Date getFromDate() {
		return fromDate;
	}

	public void setFromDate(Date fromDate) {
		this.fromDate = fromDate;
	}

	public Date getToDate() {
		return toDate;
	}

	public void setToDate(Date toDate) {
		this.toDate = toDate;
	}

	public Set<ApplicationMaster> getEnrolledApplications() {
		return enrolledApplications;
	}

	public void setEnrolledApplications(Set<ApplicationMaster> enrolledApplications) {
		this.enrolledApplications = enrolledApplications;
	}

	public Date getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getLastLoginIp() {
		return lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}
}
