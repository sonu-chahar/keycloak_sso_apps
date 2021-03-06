package com.chahar.keycloak.sms;

public class Constants {

    // User attributes
    public static final String ATTR_MOBILE = "mobile_number";

    // Answer field names
    public static final String ANSW_SMS_CODE = "sms_code";
    public static final String ANSW_MOBILE_NUMBER = "mobile_number";
    public static final String ANSW_RESEND_SMS_CODE = "resend_sms_code";
    public static final String ANSW_CANCEL_RESEND_SMS_CODE = "resend_sms_cancel";

    // Froms
    public static final String FROM_RESEND_SMS = "resend-sms.ftl";
    public static final String FORM_SMS_VALIDATION = "sms-code.ftl";

    // Messages
    public static final String MESSAGE_MOBILE_NUMBER_NO_VALID = "mobile_number.no.valid";
    public static final String MESSAGE_SMS_CODE_NO_VALID = "sms_code.no.valid";
    public static final String MESSAGE_MOBILE_NUMBER_NOT_EQUAL = "mobile_number.not.equal";
    public static final String MESSAGE_SMS_TEXT = "sms_text_format";
    public static final String MESSAGE_SMS_CODE_PROMPT = "sms_code.prompt";
    public static final String MESSAGE_MOBILE_NUMBER_PROMPT = "mobile_number.prompt";
    
    public static final String MAIL_HOST="smtp.gmail.com";
    public static final String MAIL_PORT="465";
    public static final String MAIL_USERNAME="demo12345677@gmail.com";
    public static final String MAIL_PASSWORD="Rocket@90";

    private Constants() {
    }
}
