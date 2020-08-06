package com.keycloak.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.keycloak.model.UserMaster;
import com.unboundid.util.json.JSONException;
import com.unboundid.util.json.JSONObject;
import com.unboundid.util.json.JSONValue;

public class KeycloakHttpClientGetPostApp {
	private KeycloakHttpClientGetPostApp() {
	}

	public static final Logger LOGGER = LogManager.getLogger(KeycloakHttpClientGetPostApp.class);

	public static String demoPostRESTAPI(UserMaster userMaster) {
		String refreshTokenConstant = "refresh_token";

		String result = null;
		List<NameValuePair> nameValuePairs = new ArrayList<>();
		nameValuePairs.add(new BasicNameValuePair("username", "ndmc"));
		nameValuePairs.add(new BasicNameValuePair("password", "ndmc"));
		nameValuePairs.add(new BasicNameValuePair("grant_type", "password"));
		nameValuePairs.add(new BasicNameValuePair("client_id", "testApp1"));
		nameValuePairs.add(new BasicNameValuePair("client_secret", "91f8885c-a32b-43dd-8f72-3933eaaafac6"));

		// Define a postRequest request
		HttpPost postRequest = new HttpPost(
				"http://127.0.0.1:8180/auth/realms/testRealm1/protocol/openid-connect/token");
		try {
			postRequest.setEntity(new UrlEncodedFormEntity(nameValuePairs));
		} catch (UnsupportedEncodingException e1) {
			LOGGER.debug(e1.getStackTrace());
		}
		postRequest.setHeader(new BasicHeader("User-Agent",
				"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36"));
		postRequest.setHeader(new BasicHeader("Cache-Control", "no-cache"));
		postRequest.setHeader(new BasicHeader("Connection", "keep-alive"));
		try (CloseableHttpClient httpClient = HttpClientBuilder.create().build();
				CloseableHttpResponse response = httpClient.execute(postRequest);) {

			HttpEntity httpEntity = response.getEntity();

			if (httpEntity != null) {

				// A Simple JSON Response Read
				InputStream inputStream = httpEntity.getContent();
				result = convertStreamToString(inputStream);
				// now you have the string representation of the HTML request
				LOGGER.debug("RESPONSE: {}", result);
				inputStream.close();
			}

			// verify the valid error code first
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode != 200) {
				throw new RuntimeException("Failed with HTTP error code : " + statusCode);
			}
		} catch (Exception e) {
			LOGGER.debug(e.getStackTrace());
		}

		String refreshToken = null;
		if (result != null) {
			try {
				JSONObject myObject = new JSONObject(result);
				JSONValue jsonValue = myObject.getField(refreshTokenConstant);
				if (jsonValue != null) {
					refreshToken = jsonValue.toString();
				}
			} catch (JSONException e) {
				LOGGER.debug(e.getStackTrace());
			}
		}
		if (refreshToken != null) {

			List<NameValuePair> nameValuePairss = new ArrayList<>();
			nameValuePairss.add(
					new BasicNameValuePair(refreshTokenConstant, refreshToken.substring(1, refreshToken.length() - 1)));
			nameValuePairss.add(new BasicNameValuePair("grant_type", refreshTokenConstant));
			nameValuePairss.add(new BasicNameValuePair("client_id", "testApp1"));
			nameValuePairss.add(new BasicNameValuePair("client_secret", "91f8885c-a32b-43dd-8f72-3933eaaafac6"));
			HttpPost postRequest1 = new HttpPost(
					"http://127.0.0.1:8180/auth/realms/testRealm1/protocol/openid-connect/token");
			try {
				postRequest1.setEntity(new UrlEncodedFormEntity(nameValuePairss));
			} catch (UnsupportedEncodingException e1) {
				LOGGER.debug(e1.getStackTrace());
			}
			postRequest1.setHeader(new BasicHeader("User-Agent",
					"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36"));
			postRequest1.setHeader(new BasicHeader("Cache-Control", "no-cache"));
			postRequest1.setHeader(new BasicHeader("Connection", "keep-alive"));
			try (CloseableHttpClient httpClient1 = HttpClientBuilder.create().build();
					CloseableHttpResponse response1 = httpClient1.execute(postRequest1);) {

				HttpEntity httpEntity1 = response1.getEntity();

				if (httpEntity1 != null) {
					result = null;
					// A Simple JSON Response Read
					InputStream inputStream = httpEntity1.getContent();
					result = convertStreamToString(inputStream);
					// now you have the string representation of the HTML request
					LOGGER.debug("RESPONSE: {}", result);
					inputStream.close();
				}

				// verify the valid error code first
				int statusCode = response1.getStatusLine().getStatusCode();
				if (statusCode != 200) {
					throw new RuntimeException("Failed with HTTP error code : " + statusCode);
				}
			} catch (Exception e) {
				refreshToken = null;
				LOGGER.debug(e.getStackTrace());
			}

		}
		String accessToken = null;
		if (result != null) {
			try {
				JSONObject myObject = new JSONObject(result);
				JSONValue jsonValue = myObject.getField("access_token");
				if (jsonValue != null) {
					accessToken = myObject.getField("access_token").toNormalizedString();
					accessToken = accessToken.substring(1, accessToken.length() - 1);
				}
			} catch (JSONException e) {
				LOGGER.debug(e.getStackTrace());
			}
		}
		return accessToken;
	}

	private static String convertStreamToString(InputStream is) {

		BufferedReader reader = new BufferedReader(new InputStreamReader(is));
		StringBuilder sb = new StringBuilder();

		String line = null;
		try {
			while ((line = reader.readLine()) != null) {
				sb.append(line + "\n");
			}
		} catch (IOException e) {
			LOGGER.debug(e.getStackTrace());
		} finally {
			try {
				is.close();
			} catch (IOException e) {
				LOGGER.debug(e.getStackTrace());
			}
		}
		return sb.toString();
	}

}
