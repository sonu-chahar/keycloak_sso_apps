package com.keycloak.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicHeader;
import org.apache.http.message.BasicNameValuePair;

import com.keycloak.model.UserMaster;
import com.unboundid.util.json.JSONException;
import com.unboundid.util.json.JSONObject;
import com.unboundid.util.json.JSONValue;

public class KeycloakHttpClientGetPostApp {
//	public static void get() {
//        try {
//            HttpClient client = HttpClientBuilder.create().build();
//            HttpGet request = new HttpGet("https://www.technicalkeeda.com/get-request");
//            HttpResponse response = client.execute(request);
// 
//            int responseCode = response.getStatusLine().getStatusCode();
// 
//            System.out.println("**GET** request Url: " + request.getURI());
//            System.out.println("Response Code: " + responseCode);
//            System.out.println("Content:-\n");
//            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
// 
//            String line = "";
//            while ((line = rd.readLine()) != null) {
//                System.out.println(line);
//            }
// 
//        } catch (ClientProtocolException e) {
//            e.printStackTrace();
//        } catch (UnsupportedOperationException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
// 
//    public static void postRequest() {
//        HttpClient client = HttpClientBuilder.create().build();
//        HttpPost post = new HttpPost("https://www.technicalkeeda.com/post-request");
//        try {
//            List <NameValuePair> nameValuePairs = new ArrayList <NameValuePair> ();
//            nameValuePairs.add(new BasicNameValuePair("name", "Yashwant"));
//            post.setEntity(new UrlEncodedFormEntity(nameValuePairs));
// 
//            HttpResponse response = client.execute(post);
// 
//            int responseCode = response.getStatusLine().getStatusCode();
//            System.out.println("**POST** request Url: " + post.getURI());
//            System.out.println("Parameters : " + nameValuePairs);
//            System.out.println("Response Code: " + responseCode);
//            System.out.println("Content:-\n");
//            BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
//            String line = "";
//            while ((line = rd.readLine()) != null) {
//                System.out.println(line);
//            }
// 
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

	public static String demoPostRESTAPI(UserMaster userMaster) {

		HttpClient httpClient = HttpClientBuilder.create().build();
		String result = null;
		try {

			List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
			nameValuePairs.add(new BasicNameValuePair("username", "ndmc"));
			nameValuePairs.add(new BasicNameValuePair("password", "ndmc"));
			nameValuePairs.add(new BasicNameValuePair("grant_type", "password"));
			nameValuePairs.add(new BasicNameValuePair("client_id", "testApp1"));
			nameValuePairs.add(new BasicNameValuePair("client_secret", "91f8885c-a32b-43dd-8f72-3933eaaafac6"));

			// Define a postRequest request
			HttpPost postRequest = new HttpPost(
					"http://127.0.0.1:8180/auth/realms/testRealm1/protocol/openid-connect/token");
			postRequest.setEntity(new UrlEncodedFormEntity(nameValuePairs));
			postRequest.setHeader(new BasicHeader("User-Agent","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36"));
			postRequest.setHeader(new BasicHeader("Cache-Control","no-cache"));
			postRequest.setHeader(new BasicHeader("Connection","keep-alive"));
//			postRequest.setHeader(new BasicHeader("Cookie","AUTH_SESSION_ID=2f38e806-8c98-486b-acc1-cb7750ccbcdf.chahar-pc; KEYCLOAK_IDENTITY=eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJhODFlN2M4ZC00NDZkLTQyMWEtYWVlZi1mNGIxZjBkMDg3MjMifQ.eyJqdGkiOiJiNWQxOTA4Yy02OGY2LTRmYTQtYTk5NC0wZmVhNzI0YzUzNTAiLCJleHAiOjE1Nzg1MTI5MTEsIm5iZiI6MCwiaWF0IjoxNTc4NDc2OTExLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgxODAvYXV0aC9yZWFsbXMvdGVzdFJlYWxtMSIsInN1YiI6IjcyMjIwZWJmLWJiOTYtNGI0OC04MmRlLTJkOGUzNzYxZDY5NCIsInR5cCI6IlNlcmlhbGl6ZWQtSUQiLCJhdXRoX3RpbWUiOjAsInNlc3Npb25fc3RhdGUiOiIyZjM4ZTgwNi04Yzk4LTQ4NmItYWNjMS1jYjc3NTBjY2JjZGYiLCJzdGF0ZV9jaGVja2VyIjoiQmRZSkttQ2g0d1pvcHlwejRzRlpYMDZNLUluano2c2Y1OEhFVkQ3cnlhbyJ9.Tk1LsysGzzAXMHi1GcGKwh-zIhnh7bpy2Y1__J_1onc; KEYCLOAK_SESSION=testRealm1/72220ebf-bb96-4b48-82de-2d8e3761d694/2f38e806-8c98-486b-acc1-cb7750ccbcdf; JSESSIONID=8D7F0AF2BDC715047D161D5882E9A5D1.chahar-pc; JSESSIONID=8D7F0AF2BDC715047D161D5882E9A5D1"));
			// Set the API media type in http content-type header
			// postRequest.addHeader("content-type", "application/x-www-form-urlencoded");

			// Set the request post body
			// StringEntity userEntity = new StringEntity(writer.getBuffer().toString());
			// postRequest.setEntity(userEntity);

			// Send the request; It will immediately return the response in HttpResponse
			// object if any
			HttpResponse response = httpClient.execute(postRequest);
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
			HttpClient httpClient1 = HttpClientBuilder.create().build();
			List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();
			nameValuePairs.add(new BasicNameValuePair("refresh_token", refreshToken.substring(1,refreshToken.length()-1)));
			nameValuePairs.add(new BasicNameValuePair("grant_type", "refresh_token"));
			nameValuePairs.add(new BasicNameValuePair("client_id", "testApp1"));
			nameValuePairs.add(new BasicNameValuePair("client_secret", "91f8885c-a32b-43dd-8f72-3933eaaafac6"));
			HttpPost postRequest1 = new HttpPost(
					"http://127.0.0.1:8180/auth/realms/testRealm1/protocol/openid-connect/token");
			try {
				postRequest1.setEntity(new UrlEncodedFormEntity(nameValuePairs));
				postRequest1.setHeader(new BasicHeader("User-Agent","Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.79 Safari/537.36"));
				postRequest1.setHeader(new BasicHeader("Cache-Control","no-cache"));
				postRequest1.setHeader(new BasicHeader("Connection","keep-alive"));
				//postRequest1.setHeader(new BasicHeader("Cookie","AUTH_SESSION_ID=2f38e806-8c98-486b-acc1-cb7750ccbcdf.chahar-pc; KEYCLOAK_IDENTITY=eyJhbGciOiJIUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJhODFlN2M4ZC00NDZkLTQyMWEtYWVlZi1mNGIxZjBkMDg3MjMifQ.eyJqdGkiOiJiNWQxOTA4Yy02OGY2LTRmYTQtYTk5NC0wZmVhNzI0YzUzNTAiLCJleHAiOjE1Nzg1MTI5MTEsIm5iZiI6MCwiaWF0IjoxNTc4NDc2OTExLCJpc3MiOiJodHRwOi8vbG9jYWxob3N0OjgxODAvYXV0aC9yZWFsbXMvdGVzdFJlYWxtMSIsInN1YiI6IjcyMjIwZWJmLWJiOTYtNGI0OC04MmRlLTJkOGUzNzYxZDY5NCIsInR5cCI6IlNlcmlhbGl6ZWQtSUQiLCJhdXRoX3RpbWUiOjAsInNlc3Npb25fc3RhdGUiOiIyZjM4ZTgwNi04Yzk4LTQ4NmItYWNjMS1jYjc3NTBjY2JjZGYiLCJzdGF0ZV9jaGVja2VyIjoiQmRZSkttQ2g0d1pvcHlwejRzRlpYMDZNLUluano2c2Y1OEhFVkQ3cnlhbyJ9.Tk1LsysGzzAXMHi1GcGKwh-zIhnh7bpy2Y1__J_1onc; KEYCLOAK_SESSION=testRealm1/72220ebf-bb96-4b48-82de-2d8e3761d694/2f38e806-8c98-486b-acc1-cb7750ccbcdf; JSESSIONID=8D7F0AF2BDC715047D161D5882E9A5D1.chahar-pc; JSESSIONID=8D7F0AF2BDC715047D161D5882E9A5D1"));
				
				HttpResponse response1 = httpClient1.execute(postRequest1);
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
					accessToken=accessToken.substring(1, accessToken.length()-1);
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
