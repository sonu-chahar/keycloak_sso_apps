package com.chahar.keycloak.sms.service;

public class SmsServiceException extends RuntimeException {

	private static final long serialVersionUID = 7L;

	public SmsServiceException(String message) {
        super(message);
    }

    public SmsServiceException(String message, Throwable cause) {
        super(message, cause);
    }

}
