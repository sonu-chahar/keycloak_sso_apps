package com.chahar.keycloak.sms.producer;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Properties;

import javax.inject.Singleton;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import lombok.ToString;

@Singleton
@ToString(callSuper = true)
public class LogsSmsProducer implements SmsProducer {

	private static final String SMTP_SERVER = "smtp.gmail.com";
	private static final String USERNAME = "noreply.ssondmc@gmail.com";
	private static final String PASSWORD = "Ndmc@123";
	private static final String EMAIL_FROM = "noreply.ssondmc@gmail.com";
	private static final String EMAIL_SUBJECT = "OTP for login in NDMC SSO Portal";

	private Logger logger = LoggerFactory.getLogger(LogsSmsProducer.class);

	@Override
	public void produce(String otpCode, String destinationNumber,String email) {
		String generatedMsg = "Your OTP for login in SSO App is " + otpCode;
		sendSms(destinationNumber, generatedMsg);
		sendEmailByJakartaApi(email, generatedMsg);
		//logger.info("produce sms with message=" + otpCode + " for destination=" + destinationNumber);
	}

	private void sendSms(String mobileNumber, String generatedMsg) {

		if (mobileNumber != null && mobileNumber.startsWith("+")) {
			mobileNumber = mobileNumber.substring(3);
		}

		CloseableHttpResponse httpResponse = null;
		HttpGet getRequest = null;
		try {
			getRequest = new HttpGet("http://sms.ndmc.gov.in/?SenderId=NDMCIT&Mobile="
					+ URLEncoder.encode(mobileNumber, StandardCharsets.UTF_8.toString()) + "&message="
					+ URLEncoder.encode(generatedMsg, StandardCharsets.UTF_8.toString()));

		} catch (UnsupportedEncodingException e1) {
			logger.debug(e1.getMessage());
		}

		if (getRequest != null) {
			try (CloseableHttpClient client = HttpClients.createDefault()) {

				httpResponse = client.execute(getRequest);
			} catch (UnsupportedOperationException | IOException e) {
				logger.debug(e.getMessage());
			} finally {
				if (httpResponse != null) {
					try {
						httpResponse.close();
					} catch (IOException e) {
						logger.debug(e.getMessage());
					}
				}
				httpResponse = null;
			}
		}
	}

	public void sendEmailByJakartaApi( String recipient,String generatedMsg) {

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.host", SMTP_SERVER);
		props.put("mail.smtp.port", "465");

		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(USERNAME, PASSWORD);
			}
		});

		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(EMAIL_FROM));
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
			message.setSubject(EMAIL_SUBJECT);
			message.setText(generatedMsg);

			Transport.send(message);

		//	System.out.println("Sent message successfully....");

		} catch (MessagingException e) {
			//throw new RuntimeException(e);
		}
	}

}
