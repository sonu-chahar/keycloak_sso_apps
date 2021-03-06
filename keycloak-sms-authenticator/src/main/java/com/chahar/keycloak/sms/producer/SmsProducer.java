package com.chahar.keycloak.sms.producer;

public interface SmsProducer {

    void produce(String smsMessage, String destinationNumber,String email);

}
