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
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;

import com.keycloak.model.UserMaster;
import com.unboundid.util.json.JSONException;
import com.unboundid.util.json.JSONObject;
import com.unboundid.util.json.JSONValue;

public class HttpClientGetPostApp {

	public static void get() {
		HttpGet request = new HttpGet("https://eservices.ndmc.gov.in/emp_api/Emp/emp_dtls/313916");
		request.setHeader("API_KEY", "a474bd87e4e84938a71c35775e1788ce");
		request.setHeader("Content-Type", "application/json");
		try (CloseableHttpClient client = HttpClientBuilder.create().build();
				CloseableHttpResponse response = client.execute(request);) {

			int responseCode = response.getStatusLine().getStatusCode();

			System.out.println("**GET** request Url: " + request.getURI());
			System.out.println("Response Code: " + responseCode);
			System.out.println("Content:-\n");
			BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));

			String line = "";
			while ((line = rd.readLine()) != null) {
				System.out.println(line);
			}
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (UnsupportedOperationException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void postRequest() {
		HttpPost post = new HttpPost("https://www.technicalkeeda.com/post-request");
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
		nameValuePairs.add(new BasicNameValuePair("name", "Yashwant"));
		try {
			post.setEntity(new UrlEncodedFormEntity(nameValuePairs));
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}

		try (CloseableHttpClient client = HttpClientBuilder.create().build();
				CloseableHttpResponse response = client.execute(post);) {

			int responseCode = response.getStatusLine().getStatusCode();
			System.out.println("**POST** request Url: " + post.getURI());
			System.out.println("Parameters : " + nameValuePairs);
			System.out.println("Response Code: " + responseCode);
			System.out.println("Content:-\n");
			BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
			String line = "";
			while ((line = rd.readLine()) != null) {
				System.out.println(line);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static String demoPostRESTAPI(UserMaster userMaster) {

		String result = null;
		List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
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
		} catch (UnsupportedEncodingException e2) {
			e2.printStackTrace();
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
				System.out.println("RESPONSE: " + result);
				inputStream.close();
			}

			// verify the valid error code first
			int statusCode = response.getStatusLine().getStatusCode();
			if (statusCode != 200) {
				throw new RuntimeException("Failed with HTTP error code : " + statusCode);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		String refreshToken = null;
		if (result != null) {
			try {
				JSONObject myObject = new JSONObject(result);
				JSONValue jsonValue = myObject.getField("refresh_token");
				if (jsonValue != null) {
					refreshToken = jsonValue.toString();
				}
			} catch (JSONException e) {
				e.printStackTrace();
			}
		}
		if (refreshToken != null) {

			List<NameValuePair> nameValuePairss = new ArrayList<>();
			nameValuePairss
					.add(new BasicNameValuePair("refresh_token", refreshToken.substring(1, refreshToken.length() - 1)));
			nameValuePairss.add(new BasicNameValuePair("grant_type", "refresh_token"));
			nameValuePairss.add(new BasicNameValuePair("client_id", "testApp1"));
			nameValuePairss.add(new BasicNameValuePair("client_secret", "91f8885c-a32b-43dd-8f72-3933eaaafac6"));
			HttpPost postRequest1 = new HttpPost(
					"http://127.0.0.1:8180/auth/realms/testRealm1/protocol/openid-connect/token");
			try {
				postRequest1.setEntity(new UrlEncodedFormEntity(nameValuePairss));
			} catch (UnsupportedEncodingException e1) {
				e1.printStackTrace();
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
					System.out.println("RESPONSE: " + result);
					inputStream.close();
				}

				// verify the valid error code first
				int statusCode = response1.getStatusLine().getStatusCode();
				if (statusCode != 200) {
					throw new RuntimeException("Failed with HTTP error code : " + statusCode);
				}
			} catch (Exception e) {
				refreshToken = null;
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
				e.printStackTrace();
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
			e.printStackTrace();
		} finally {
			try {
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

}
