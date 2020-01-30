package com.keycloak.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.keycloak.KeycloakSecurityContext;

import com.keycloak.model.UserMaster;

public class KeycloakResetPasswordUtil {
	public static final String CONSTANT_FOR_SLASH = "/";
	public static final String SSO_SERVER_URL = Constants.pathString("SSO_SERVER_URL");
	public static final String SSO_REALM_NAME = Constants.pathString("SSO_REALM_NAME");
	public static final String SSO_CLIENT_ID = Constants.pathString("SSO_CLIENT_ID");
	public static final String SSO_CLIENT_SECRET_ID = Constants.pathString("SSO_CLIENT_SECRET_ID");
	public static final String SSO_USERNAME_SERVICE_ACCOUNT = Constants.pathString("SSO_USERNAME_SERVICE_ACCOUNT");
	public static final String SSO_PASSWORD_SERVICE_ACCOUNT = Constants.pathString("SSO_PASSWORD_SERVICE_ACCOUNT");

//	private static class UserMasterDTO{
//		
//		public UserMasterDTO() {
//		}
//		public UserMasterDTO(String type, Boolean temporary, String value) {
//			super();
//			this.type = type;
//			this.temporary = temporary;
//			this.value = value;
//		}
//		private String type;
//		private Boolean temporary;
//		private String value;
//		
//		public String getType() {
//			return type;
//		}
//		public void setType(String type) {
//			this.type = type;
//		}
//		public Boolean getTemporary() {
//			return temporary;
//		}
//		public void setTemporary(Boolean temporary) {
//			this.temporary = temporary;
//		}
//		public String getValue() {
//			return value;
//		}
//		public void setValue(String value) {
//			this.value = value;
//		}
//	}
	public static boolean resetPassword(HttpServletRequest request, UserMaster userMaster) {
		try (CloseableHttpClient httpclient = HttpClients.createDefault()) {
//			KeycloakResetPasswordUtil.UserMasterDTO userMasterDTO=new KeycloakResetPasswordUtil.UserMasterDTO("password",true,userMaster.getConfirmPassword());
			String url = SSO_SERVER_URL + CONSTANT_FOR_SLASH + "admin/realms" + CONSTANT_FOR_SLASH + SSO_REALM_NAME
					+ CONSTANT_FOR_SLASH + "users" + CONSTANT_FOR_SLASH + userMaster.getKcUserId() + CONSTANT_FOR_SLASH
					+ "reset-password";
			HttpPut httpPut = new HttpPut(url);
//			httpPut.setHeader("Accept", "application/json");
//			KeycloakSecurityContext context = (KeycloakSecurityContext) request
//					.getAttribute(KeycloakSecurityContext.class.getName());
//			context.getIdTokenString();
//			httpPut.setHeader("Authorization", "Bearer " + context.getIdTokenString());
			httpPut.setHeader("Content-type", "application/json");
			String json = "{\r\n" + "  \"type\": \"password\",\r\n" + "  \"temporary\": false,\r\n" + "  \"value\": "
					+ "\"" + userMaster.getConfirmPassword() + "\"\r\n" + "}";
			StringEntity stringEntity;
			try {
				stringEntity = new StringEntity(json);
				httpPut.setEntity(stringEntity);

				System.out.println("Executing request " + httpPut.getRequestLine());

				// Create a custom response handler
				ResponseHandler<String> responseHandler = response -> {
					int status = response.getStatusLine().getStatusCode();
					if (status >= 200) {
						HttpEntity entity = response.getEntity();
						return entity != null ? EntityUtils.toString(entity) : null;
					} else {
						throw new ClientProtocolException("Unexpected response status: " + status);
					}
				};
				String responseBody = httpclient.execute(httpPut, responseHandler);

				System.out.println("----------------------------------------");
				System.out.println(responseBody);
				return true;
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (ClientProtocolException e) {
				e.printStackTrace();
			}
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return false;

	}
}
