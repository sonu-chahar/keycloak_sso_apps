package com.keycloak.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.directwebremoting.annotations.DataTransferObject;
import org.directwebremoting.annotations.Param;
import org.directwebremoting.hibernate.H4BeanConverter;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
@Table(name = "kcbase_userMaster")
@DataTransferObject(type = "hibernate4", converter = H4BeanConverter.class, params = @Param(name = "assumeSession", value = "true"))
public class UserMaster implements Serializable {

	private static final long serialVersionUID = -5609381941572546394L;

	private Long id;
	private String firstName;
	private String lastName;
	private String fatherName;
	private String dateOfBirth;
	private String emailId;
	private Boolean isPhoneVerified;
	private String mobileNumber;
	private String gender;
	private String locality;
	private String city;
	private String state;
	private String country;
	private Integer pinCode;
	private String userType;
	private String adharCardNumber;
	private String voterIdNumber;
	private String passportNumber;
	private String waterConsumerNumber;
	private String electricityConsumerNumber;
	private String propertyId;
	private String estatePropertyId;

	private String username;
	private String password;
	private String confirmPassword;

	private Boolean isActive;
	private String imageName;
	private String fileExtension;
	private CommonsMultipartFile imageFile;

	private Boolean isSSOUserCreated;
	private String tempPassword;
	private String kcUserId;
	private String userIpAddress;

	// private Set<RoleMaster> roles;
	@Column(name = "kcUserId")
	public String getKcUserId() {
		return kcUserId;
	}

	public void setKcUserId(String kcUserId) {
		this.kcUserId = kcUserId;
	}

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pk_userMaster")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "firstName")
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "lastName")
	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name = "fatherName")
	public String getFatherName() {
		return fatherName;
	}

	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}

	@Column(name = "dateOfBirth")
	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	@Column(name = "emailId")
	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	@Column(name = "gender")
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Column(name = "locality")
	public String getLocality() {
		return locality;
	}

	public void setLocality(String locality) {
		this.locality = locality;
	}

	@Column(name = "city")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Column(name = "state")
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "country")
	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Column(name = "pinCode")
	public Integer getPinCode() {
		return pinCode;
	}

	public void setPinCode(Integer pinCode) {
		this.pinCode = pinCode;
	}

	@Column(name = "userType")
	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Column(name = "adharCardNumber")
	public String getAdharCardNumber() {
		return adharCardNumber;
	}

	public void setAdharCardNumber(String adharCardNumber) {
		this.adharCardNumber = adharCardNumber;
	}

	@Column(name = "voterIdNumber")
	public String getVoterIdNumber() {
		return voterIdNumber;
	}

	public void setVoterIdNumber(String voterIdNumber) {
		this.voterIdNumber = voterIdNumber;
	}

	@Column(name = "passportNumber")
	public String getPassportNumber() {
		return passportNumber;
	}

	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}

	@Column(name = "waterConsumerNumber")
	public String getWaterConsumerNumber() {
		return waterConsumerNumber;
	}

	public void setWaterConsumerNumber(String waterConsumerNumber) {
		this.waterConsumerNumber = waterConsumerNumber;
	}

	@Column(name = "electricityConsumerNumber")
	public String getElectricityConsumerNumber() {
		return electricityConsumerNumber;
	}

	public void setElectricityConsumerNumber(String electricityConsumerNumber) {
		this.electricityConsumerNumber = electricityConsumerNumber;
	}

	@Column(name = "propertyId")
	public String getPropertyId() {
		return propertyId;
	}

	public void setPropertyId(String propertyId) {
		this.propertyId = propertyId;
	}

	@Column(name = "estatePropertyId")
	public String getEstatePropertyId() {
		return estatePropertyId;
	}

	public void setEstatePropertyId(String estatePropertyId) {
		this.estatePropertyId = estatePropertyId;
	}

	@Column(name = "username")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "isActive")
	public Boolean getIsActive() {
		return isActive;
	}

	public void setIsActive(Boolean isActive) {
		this.isActive = isActive;
	}

	@Column(name = "imageName")
	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	@Column(name = "fileExtension")
	public String getFileExtension() {
		return fileExtension;
	}

	public void setFileExtension(String fileExtension) {
		this.fileExtension = fileExtension;
	}

	@Transient
	public CommonsMultipartFile getImageFile() {
		return imageFile;
	}

	@Transient
	public void setImageFile(CommonsMultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	@Transient
	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	/*
	 * @ManyToMany public Set<RoleMaster> getRoles() { return roles; }
	 * 
	 * public void setRoles(Set<RoleMaster> roles) { this.roles = roles; }
	 */

	@Column(name = "mobileNumber")
	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	@Column(name = "isSSOUserCreated")
	public Boolean getIsSSOUserCreated() {
		return isSSOUserCreated;
	}

	public void setIsSSOUserCreated(Boolean isSSOUserCreated) {
		this.isSSOUserCreated = isSSOUserCreated;
	}

	@Column(name = "tempPassword")
	public String getTempPassword() {
		return tempPassword;
	}

	public void setTempPassword(String tempPassword) {
		this.tempPassword = tempPassword;
	}

	@Column(name = "userIpAddress")
	public String getUserIpAddress() {
		return userIpAddress;
	}

	public void setUserIpAddress(String userIpAddress) {
		this.userIpAddress = userIpAddress;
	}

	@Column(name = "isPhoneVerified")
	public Boolean getIsPhoneVerified() {
		return isPhoneVerified;
	}

	public void setIsPhoneVerified(Boolean isPhoneVerified) {
		this.isPhoneVerified = isPhoneVerified;
	}

	@Override
	public String toString() {
		return "UserMaster [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", fatherName="
				+ fatherName + ", dateOfBirth=" + dateOfBirth + ", emailId=" + emailId + ", mobileNumber="
				+ mobileNumber + ", gender=" + gender + ", locality=" + locality + ", city=" + city + ", state=" + state
				+ ", country=" + country + ", pinCode=" + pinCode + ", userType=" + userType + ", adharCardNumber="
				+ adharCardNumber + ", voterIdNumber=" + voterIdNumber + ", passportNumber=" + passportNumber
				+ ", waterConsumerNumber=" + waterConsumerNumber + ", electricityConsumerNumber="
				+ electricityConsumerNumber + ", propertyId=" + propertyId + ", estatePropertyId=" + estatePropertyId
				+ ", username=" + username + ", password=" + password + ", confirmPassword=" + confirmPassword
				+ ", isActive=" + isActive + ", imageName=" + imageName + ", fileExtension=" + fileExtension
				+ ", imageFile=" + imageFile + ", isSSOUserCreated=" + isSSOUserCreated + ", tempPassword="
				+ tempPassword + ", kcUserId=" + kcUserId + ", userIpAddress=" + userIpAddress + ", isPhoneVerified="
				+ isPhoneVerified + "]";
	}
}
