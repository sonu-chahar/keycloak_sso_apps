package com.keycloak.util;

public class GeoIP {
	public GeoIP(String ipAddress, String city, String latitude, String longitude) {
		super();
		this.ipAddress = ipAddress;
		this.latitude = latitude;
		this.longitude = longitude;
		this.city = city;
	}

	public GeoIP(String ipAddress, String country) {
		super();
		this.ipAddress = ipAddress;
		this.country = country;
	}

	private String ipAddress;
	private String city;
	private String country;
	private String latitude;

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	private String longitude;

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
}