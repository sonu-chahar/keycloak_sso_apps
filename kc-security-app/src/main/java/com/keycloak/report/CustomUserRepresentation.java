package com.keycloak.report;

public class CustomUserRepresentation {

	private String kcUserId;
	private String firstName;
	private String lastName;
	private String emailId;
	private Long createdTime;

	public String getKcUserId() {
		return kcUserId;
	}

	public void setKcUserId(String kcUserId) {
		this.kcUserId = kcUserId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public Long getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Long createdTime) {
		this.createdTime = createdTime;
	}

}
