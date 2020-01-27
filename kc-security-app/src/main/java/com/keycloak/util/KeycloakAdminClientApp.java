package com.keycloak.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.core.Response;

import org.keycloak.OAuth2Constants;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.KeycloakBuilder;
import org.keycloak.admin.client.resource.RealmResource;
import org.keycloak.admin.client.resource.RolesResource;
import org.keycloak.admin.client.resource.UserResource;
import org.keycloak.admin.client.resource.UsersResource;
import org.keycloak.admin.client.token.TokenManager;
import org.keycloak.representations.AccessTokenResponse;
import org.keycloak.representations.idm.ClientRepresentation;
import org.keycloak.representations.idm.CredentialRepresentation;
import org.keycloak.representations.idm.RoleRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.keycloak.util.JsonSerialization;
import org.springframework.context.annotation.PropertySource;

import com.keycloak.model.UserMaster;

@PropertySource("applicationResources.properties")
public class KeycloakAdminClientApp {
	public static Map<String, AccessTokenResponse> map = new HashMap<>();
	public static final String SSO_SERVER_URL = Constants.pathString("SSO_SERVER_URL");
	public static final String SSO_REALM_NAME = Constants.pathString("SSO_REALM_NAME");
	public static final String SSO_CLIENT_ID = Constants.pathString("SSO_CLIENT_ID");
	public static final String SSO_CLIENT_SECRET_ID = Constants.pathString("SSO_CLIENT_SECRET_ID");
	public static final String SSO_USERNAME_SERVICE_ACCOUNT = Constants.pathString("SSO_USERNAME_SERVICE_ACCOUNT");
	public static final String SSO_PASSWORD_SERVICE_ACCOUNT = Constants.pathString("SSO_PASSWORD_SERVICE_ACCOUNT");

	private static Keycloak serviceKeycloak = null;

	public static boolean createUserAtKeycloak(UserMaster userMaster) {
		Keycloak keycloak = connectServiceAccount();
		UserRepresentation user = setUserForKeycloak(userMaster);

		// Get realm
		RealmResource realmResource = keycloak.realm(SSO_REALM_NAME);

		UsersResource userRessource = realmResource.users();
		Response response = null;
		try {
			response = userRessource.create(user);
			System.out.println("Repsonse: " + response.getStatusInfo());
			System.out.println(response.getLocation());
			String userId = response.getLocation().getPath().replaceAll(".*/([^/]+)$", "$1");

			System.out.printf("User created with userId: %s%n", userId);

			// Get realm role "tester" (requires view-realm role)
			RoleRepresentation testerRealmRole = realmResource.roles().get("tester").toRepresentation();

			// Assign realm role tester to user
			userRessource.get(userId).roles().realmLevel().add(Arrays.asList(testerRealmRole));

			// Get client
			ClientRepresentation app1Client = realmResource.clients().findByClientId(SSO_CLIENT_ID).get(0);

			// Get client level role (requires view-clients role)
//			RoleRepresentation userClientRole = realmResource.clients().get(app1Client.getId()) 
//					.roles().get("user").toRepresentation();

			// Assign client level role to user
//			userRessource.get(userId).roles() //
//					.clientLevel(app1Client.getId()).add(Arrays.asList(userClientRole));

			List<RoleRepresentation> userClientRoleList = realmResource.clients().get(app1Client.getId()).roles()
					.list();

			// Assign client level role to user
			userRessource.get(userId).roles() //
					.clientLevel(app1Client.getId()).add(userClientRoleList);

			// Define password credential
			CredentialRepresentation passwordCred = new CredentialRepresentation();
			passwordCred.setTemporary(false);
			passwordCred.setType(CredentialRepresentation.PASSWORD);

//			BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
			if (userMaster.getConfirmPassword() != null) {
				passwordCred.setValue(userMaster.getConfirmPassword());
//				passwordCred.setValue(bCryptPasswordEncoder.encode(userMaster.getConfirmPassword()));
			} else {
				passwordCred.setValue(userMaster.getTempPassword());
//				passwordCred.setValue(bCryptPasswordEncoder.encode(userMaster.getConfirmPassword()));
			}
			// Set password credential
			userRessource.get(userId).resetPassword(passwordCred);
			if (response.getStatus() == 201) {
				userMaster.setIsSSOUserCreated(true);
			}
			return true;
		} catch (ClientErrorException e) {
			handleClientErrorException(e);
		} catch (Exception e) {
			Throwable cause = e.getCause();
			if (cause instanceof ClientErrorException) {
				handleClientErrorException((ClientErrorException) cause);
			} else {
				e.printStackTrace();
			}
		}
		return false;
	}

	private static Keycloak connectServiceAccount() {
		// Client "idm-client" needs service-account with at least "manage-users,
		// view-clients, view-realm, view-users" roles for "realm-management"

		Keycloak keycloak = KeycloakBuilder.builder() //
				.serverUrl(SSO_SERVER_URL) //
				.realm(SSO_REALM_NAME) //
				.grantType(OAuth2Constants.CLIENT_CREDENTIALS) //
				.clientId(SSO_CLIENT_ID) //
				.clientSecret(SSO_CLIENT_SECRET_ID) //
				.username(SSO_USERNAME_SERVICE_ACCOUNT) //
				.password(SSO_PASSWORD_SERVICE_ACCOUNT) //
				.build();
		return keycloak;
	}

	public static Keycloak connectServiceAccount2(UserMaster userMaster) {
		// Client "idm-client" needs service-account with at least "manage-users,
		// view-clients, view-realm, view-users" roles for "realm-management"

		Keycloak keycloak = KeycloakBuilder.builder() //
				.serverUrl(SSO_SERVER_URL) //
				.realm(SSO_REALM_NAME) //
				.grantType(OAuth2Constants.CLIENT_CREDENTIALS) //
				.clientId(SSO_CLIENT_ID) //
				.clientSecret(SSO_CLIENT_SECRET_ID) //
				.username(userMaster.getUsername()) //
				.password(userMaster.getConfirmPassword()) //
				.build();
		return keycloak;
	}

	public static Keycloak connectUserAccount(UserMaster userMaster) {
		/*
		 * Keycloak keycloak = KeycloakBuilder.builder() // .serverUrl(SSO_SERVER_URL)
		 * // .realm(SSO_REALM_NAME) // .grantType(OAuth2Constants.PASSWORD) //
		 * .clientId(userMaster.getUserType()) //
		 * .clientSecret(userMaster.getUserType().getClientSecretId()) //
		 * .username(userMaster.getUsername()) //
		 * .password(userMaster.getConfirmPassword()) // .build();
		 */
		return null;
	}

	private static Keycloak connectUserAccount2(UserMaster userMaster) {
		Keycloak keycloak = KeycloakBuilder.builder() //
				.serverUrl(SSO_SERVER_URL) //
				.realm(SSO_REALM_NAME) //
				.grantType(OAuth2Constants.PASSWORD) //
				.clientId(SSO_CLIENT_ID) //
				.clientSecret(SSO_CLIENT_SECRET_ID)//
				.username(userMaster.getUsername()) //
				.password("ndmc").build();
		return keycloak;
	}

	public static Keycloak connectToUserAccountByUserType(UserMaster userMaster) {
		/*
		 * Keycloak keycloak = KeycloakBuilder.builder() // .serverUrl(SSO_SERVER_URL)
		 * // .realm(SSO_REALM_NAME) // .grantType(OAuth2Constants.PASSWORD) //
		 * .clientId(userMaster.getUserType().getClientId()) //
		 * .clientSecret(userMaster.getUserType().getClientSecretId())//
		 * .username(userMaster.getUsername()) //
		 * .password(userMaster.getPassword()).build();
		 */
		return null;
	}

	public static void getAccessToken(UserMaster userMaster) {
//		Keycloak keycloak=Keycloak.getInstance(SSO_SERVER_URL,SSO_REALM_NAME, "test-user", "test-user","testApp1");
//		Keycloak keycloak=connectUserAccount(userMaster);
//		Keycloak keycloak=connectServiceAccount();
		Keycloak keycloak = connectUserAccount2(userMaster);
		TokenManager tokenManager = keycloak.tokenManager();
		AccessTokenResponse accessTokenResponse = tokenManager.getAccessToken();
//		AccessTokenResponse accessTokenResponse2 = tokenManager.getAccessToken();

		Keycloak keycloak2 = KeycloakBuilder.builder().serverUrl(SSO_SERVER_URL).realm(SSO_REALM_NAME)
				.grantType(OAuth2Constants.PASSWORD).clientId(SSO_CLIENT_ID).clientSecret(SSO_CLIENT_SECRET_ID)
				.username("ndmc").password("ndmc").authorization(accessTokenResponse.getRefreshToken()).build();

		tokenManager = keycloak2.tokenManager();
		accessTokenResponse = tokenManager.getAccessToken();

	}

	public static String getAccessTokenByUserType(UserMaster userMaster) {
//		Keycloak keycloak=Keycloak.getInstance(SSO_SERVER_URL,SSO_REALM_NAME, "test-user", "test-user","testApp1");
//		Keycloak keycloak=connectUserAccount(userMaster);
//		Keycloak keycloak=connectServiceAccount();
		// Keycloak keycloak =Keycloak.getInstance(SSO_SERVER_URL, SSO_REALM_NAME,
		// userMaster.getUsername(), userMaster.getPassword(),
		// userMaster.getUserType().getClientId());

		Keycloak keycloak = connectServiceAccount();
		// Keycloak keycloak = connectToUserAccountByUserType(userMaster);
		TokenManager tokenManager = keycloak.tokenManager();
//		tokenManager.grantToken();
		return tokenManager.getAccessTokenString();
	}

	public static boolean resetPassword(UserMaster userMaster) {
		if (serviceKeycloak == null) {
			serviceKeycloak = connectServiceAccount();
		}
		// Get realm
		RealmResource realmResource = serviceKeycloak.realm(SSO_REALM_NAME);

		UsersResource usersRessource = realmResource.users();

		try {
			
			UserResource userResource = usersRessource.get(userMaster.getKcUserId());
//			UserResource userResource = usersRessource.get("e55f79cf-f75c-4628-9642-a5f73fff4800");
			CredentialRepresentation passwordCred = new CredentialRepresentation();
			passwordCred.setTemporary(false);
			passwordCred.setType(CredentialRepresentation.PASSWORD);
			passwordCred.setValue(userMaster.getConfirmPassword());
			userResource.resetPassword(passwordCred);
			return true;
		} catch (ClientErrorException e) {
			handleClientErrorException(e);
		} catch (Exception e) {
			Throwable cause = e.getCause();
			if (cause instanceof ClientErrorException) {
				handleClientErrorException((ClientErrorException) cause);
			} else {
				e.printStackTrace();
			}
		}
		return false;
	}

	public static boolean resetPassword(UserResource userResource, UserMaster userMaster) {
		try {
			CredentialRepresentation passwordCred = new CredentialRepresentation();
			passwordCred.setTemporary(false);
			passwordCred.setType(CredentialRepresentation.PASSWORD);
			passwordCred.setValue(userMaster.getConfirmPassword());
			userResource.resetPassword(passwordCred);
			return true;
		} catch (ClientErrorException e) {
			handleClientErrorException(e);
		} catch (Exception e) {
			Throwable cause = e.getCause();
			if (cause instanceof ClientErrorException) {
				handleClientErrorException((ClientErrorException) cause);
			} else {
				e.printStackTrace();
			}
		}
		return false;
	}

	public static UserRepresentation setUserForKeycloak(UserMaster userMaster) {
		// Define user
		UserRepresentation user = new UserRepresentation();
		user.setEnabled(true);
		user.setUsername(userMaster.getUsername());
		user.setFirstName(userMaster.getFirstName());
		user.setLastName(userMaster.getLastName());
		user.setEmail(userMaster.getEmailId());
		// user.setAttributes(Collections.singletonMap("origin",
		// Arrays.asList("testApp1")));
		return user;
	}

	public static boolean createRoleInGivenRealm(String role) {
		Keycloak keycloak = connectServiceAccount();
		RealmResource realmResource = keycloak.realm(SSO_REALM_NAME);

		RolesResource rolesResource = realmResource.roles();

		try {
			List<RoleRepresentation> rolesRepresenetionList = rolesResource.list();
			if (rolesRepresenetionList.size() > 0) {
				boolean isRoleAlreadyExist = false;
				findExistingRole: for (int i = 0; i < rolesRepresenetionList.size(); i++) {
					RoleRepresentation savedRoleRepresentation = rolesRepresenetionList.get(i);
					if (role.equals(savedRoleRepresentation.getName())) {
						isRoleAlreadyExist = true;
						break findExistingRole;
					}
				}
				if (!isRoleAlreadyExist) {
					RoleRepresentation roleRepresentation = new RoleRepresentation();
					roleRepresentation.setName(role);
					roleRepresentation.setClientRole(true);
					rolesResource.create(roleRepresentation);
					return true;
				}
			}
		} catch (ClientErrorException e) {
			handleClientErrorException(e);
		} catch (Exception e) {
			Throwable cause = e.getCause();
			if (cause instanceof ClientErrorException) {
				handleClientErrorException((ClientErrorException) cause);
			} else {
				e.printStackTrace();
			}
		}
		return false;
	}

	@SuppressWarnings("rawtypes")
	private static void handleClientErrorException(ClientErrorException e) {
		e.printStackTrace();
		Response response = e.getResponse();
		try {
			System.out.println("status: " + response.getStatus());
			System.out.println("reason: " + response.getStatusInfo().getReasonPhrase());
			Map error = JsonSerialization.readValue((ByteArrayInputStream) response.getEntity(), Map.class);
			System.out.println("error: " + error.get("error"));
			System.out.println("error_description: " + error.get("error_description"));
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}