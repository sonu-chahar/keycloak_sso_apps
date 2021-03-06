package com.chahar.keycloak.sms.utils;

public class CheckSubStringApp {
	public static void main(String[] args) {
		String str="123456789123456789";
		String str2="1234567890";
		System.out.println(str.substring(str.length()-10));
		System.out.println(str2.substring(str2.length()-10));
	}

}
