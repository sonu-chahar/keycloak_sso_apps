package com.keycloak.util;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.core.Response;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
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

import com.keycloak.controller.AbstractPageController;
import com.keycloak.model.UserMaster;

public class KeycloakAdminClientApp {

	protected static final Logger log = LogManager.getLogger(KeycloakAdminClientApp.class);

	public static final String SSO_SERVER_URL = Constants.pathString("SSO_SERVER_URL");
	public static final String SSO_REALM_NAME = Constants.pathString("SSO_REALM_NAME");
	public static final String SSO_CLIENT_ID = Constants.pathString("SSO_CLIENT_ID");
	public static final String SSO_CLIENT_SECRET_ID = Constants.pathString("SSO_CLIENT_SECRET_ID");
	public static final String SSO_USERNAME_SERVICE_ACCOUNT = Constants.pathString("SSO_USERNAME_SERVICE_ACCOUNT");
	public static final String SSO_PASSWORD_SERVICE_ACCOUNT = Constants.pathString("SSO_PASSWORD_SERVICE_ACCOUNT");

	private static Keycloak serviceKeycloak = null;

	public static Keycloak getServiceKeycloak() {
		if (serviceKeycloak == null) {
			serviceKeycloak = connectServiceAccount();
		}
		return serviceKeycloak;
	}

	public static boolean createUserAtKeycloak(UserMaster userMaster, RealmResource realmResource,
			UsersResource userRessource, UserRepresentation user) {
		if (userRessource != null && user != null) {
			try (Response response = userRessource.create(user);) {

				log.debug("Repsonse: {}", response.getStatusInfo());
				log.debug(response.getLocation());
				String userId = response.getLocation().getPath().replaceAll(".*/([^/]+)$", "$1");

				log.debug("User created with userId: {}", userId);

				// Get realm role "tester" (requires view-realm role)
				RoleRepresentation testerRealmRole = realmResource.roles().get("tester").toRepresentation();

				// Assign realm role tester to user
				userRessource.get(userId).roles().realmLevel().add(Arrays.asList(testerRealmRole));

				// Get client
				ClientRepresentation app1Client = realmResource.clients().findByClientId(SSO_CLIENT_ID).get(0);

				List<RoleRepresentation> userClientRoleList = realmResource.clients().get(app1Client.getId()).roles()
						.list();

				// Assign client level role to user
				userRessource.get(userId).roles() //
						.clientLevel(app1Client.getId()).add(userClientRoleList);

				// Define password credential
				CredentialRepresentation passwordCred = new CredentialRepresentation();
				passwordCred.setTemporary(false);
				passwordCred.setType(CredentialRepresentation.PASSWORD);

				if (userMaster.getConfirmPassword() != null) {
					passwordCred.setValue(userMaster.getConfirmPassword());
				} else {
					passwordCred.setValue(userMaster.getTempPassword());
				}
				// Set password credential
				userRessource.get(userId).resetPassword(passwordCred);
				if (response.getStatus() == 201) {
					userMaster.setIsSSOUserCreated(true);
					userMaster.setSsoUserCreatedStatus("true");
				}
				return true;
			} catch (ClientErrorException e) {
				handleClientErrorException(e);
			} catch (Exception e) {
				Throwable cause = e.getCause();
				if (cause instanceof ClientErrorException) {
					handleClientErrorException((ClientErrorException) cause);
				} else {
					log.debug(e.getStackTrace());
				}
			}
			return false;
		}
		return false;
	}

	public static boolean createUserAtKeycloak(UserMaster userMaster) {
		try (Keycloak keycloak = connectServiceAccount()) {
			UserRepresentation user = setUserForKeycloak(userMaster);
			// Get realm
			RealmResource realmResource = keycloak.realm(SSO_REALM_NAME);

			UsersResource userRessource = realmResource.users();
			return createUserAtKeycloak(userMaster, realmResource, userRessource, user);

		} catch (Exception e) {
			log.debug(e.getStackTrace());
		}
		return false;

	}

	public static Keycloak connectServiceAccount() {
		return KeycloakBuilder.builder().serverUrl(SSO_SERVER_URL).realm(SSO_REALM_NAME)
				.grantType(OAuth2Constants.CLIENT_CREDENTIALS).clientId(SSO_CLIENT_ID)
				.clientSecret(SSO_CLIENT_SECRET_ID).username(SSO_USERNAME_SERVICE_ACCOUNT)
				.password(SSO_PASSWORD_SERVICE_ACCOUNT).build();
	}

	public static Keycloak connectServiceAccount2(UserMaster userMaster) {
		return KeycloakBuilder.builder().serverUrl(SSO_SERVER_URL).realm(SSO_REALM_NAME)
				.grantType(OAuth2Constants.CLIENT_CREDENTIALS).clientId(SSO_CLIENT_ID)
				.clientSecret(SSO_CLIENT_SECRET_ID).username(userMaster.getUsername())
				.password(userMaster.getConfirmPassword()).build();
	}

	private static Keycloak connectUserAccount2(UserMaster userMaster) {
		return KeycloakBuilder.builder().serverUrl(SSO_SERVER_URL).realm(SSO_REALM_NAME)
				.grantType(OAuth2Constants.PASSWORD).clientId(SSO_CLIENT_ID).clientSecret(SSO_CLIENT_SECRET_ID)
				.username(userMaster.getUsername()).password("ndmc").build();
	}

	public static void getAccessToken(UserMaster userMaster) {
		TokenManager tokenManager = null;
		AccessTokenResponse accessTokenResponse = null;
		try (Keycloak keycloak = connectUserAccount2(userMaster);) {
			tokenManager = keycloak.tokenManager();
			accessTokenResponse = tokenManager.getAccessToken();
		}

		try (Keycloak keycloak2 = KeycloakBuilder.builder().serverUrl(SSO_SERVER_URL).realm(SSO_REALM_NAME)
				.grantType(OAuth2Constants.PASSWORD).clientId(SSO_CLIENT_ID).clientSecret(SSO_CLIENT_SECRET_ID)
				.username("ndmc").password("ndmc").authorization(accessTokenResponse.getRefreshToken()).build();) {

			tokenManager = keycloak2.tokenManager();
			accessTokenResponse = tokenManager.getAccessToken();
		} catch (Exception e) {
			log.debug(e.getStackTrace());
		}
	}

	public static String resetPassword(UserMaster userMaster) {
		String errorDescriptionConstant = "error_description";
		if (serviceKeycloak == null) {
			serviceKeycloak = connectServiceAccount();
		}
		RealmResource realmResource = serviceKeycloak.realm(SSO_REALM_NAME);
		if (realmResource != null) {
			UsersResource usersRessource = realmResource.users();
			try {
				UserResource userResource = usersRessource.get(userMaster.getKcUserId());
				CredentialRepresentation passwordCred = new CredentialRepresentation();
				passwordCred.setTemporary(false);
				passwordCred.setType(CredentialRepresentation.PASSWORD);
				passwordCred.setValue(userMaster.getConfirmPassword());
				userResource.resetPassword(passwordCred);
				return AbstractPageController.STATUS_FOR_UPDATE;
			} catch (ClientErrorException e) {
				log.debug(e.getStackTrace());

				try (Response response = e.getResponse()) {
					log.debug("status : {}", response.getStatus());
					log.debug("reason : {}", response.getStatusInfo().getReasonPhrase());
					@SuppressWarnings("rawtypes")
					Map error = JsonSerialization.readValue((ByteArrayInputStream) response.getEntity(), Map.class);
					log.debug("error : {}", error.get("error"));
					log.debug("{} : {}", errorDescriptionConstant, error.get(errorDescriptionConstant));
					return (String) error.get(errorDescriptionConstant);
				} catch (IOException ex) {
					log.debug(ex.getStackTrace());
				}
			} catch (Exception e) {
				Throwable cause = e.getCause();
				if (cause instanceof ClientErrorException) {
					handleClientErrorException((ClientErrorException) cause);
				} else {
					log.debug(e.getStackTrace());
				}
			}
		}

		return AbstractPageController.STATUS_FOR_ERROR;
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
				log.debug(e.getStackTrace());
			}
		}
		return false;
	}

	public static UserRepresentation setUserForKeycloak(UserMaster userMaster) {
		UserRepresentation user = new UserRepresentation();
		user.setEnabled(true);
		user.setUsername(userMaster.getUsername());
		user.setFirstName(userMaster.getFirstName());
		user.setLastName(userMaster.getLastName());
		user.setEmail(userMaster.getEmailId());
		return user;
	}

	private KeycloakAdminClientApp() {
	}

	public static boolean createRoleInGivenRealm(String role) {
		try (Keycloak keycloak = connectServiceAccount()) {
			RealmResource realmResource = keycloak.realm(SSO_REALM_NAME);

			RolesResource rolesResource = realmResource.roles();

			List<RoleRepresentation> rolesRepresenetionList = rolesResource.list();
			if (!rolesRepresenetionList.isEmpty()) {
				boolean isRoleAlreadyExist = false;
				for (int i = 0; i < rolesRepresenetionList.size(); i++) {
					RoleRepresentation savedRoleRepresentation = rolesRepresenetionList.get(i);
					if (role.equals(savedRoleRepresentation.getName())) {
						isRoleAlreadyExist = true;
						break;
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
				log.debug(e.getStackTrace());
			}
		}
		return false;

	}

	@SuppressWarnings("rawtypes")
	private static void handleClientErrorException(ClientErrorException e) {
		log.debug(e.getStackTrace());
		try (Response response = e.getResponse();) {
			log.debug("status: {}", response.getStatus());
			log.debug("reason: {}", response.getStatusInfo().getReasonPhrase());
			Map error = JsonSerialization.readValue((ByteArrayInputStream) response.getEntity(), Map.class);
			log.debug("error: {}", error.get("error"));
			log.debug("error_description: {}", error.get("error_description"));

		} catch (IOException ex) {
			log.debug(e.getStackTrace());
		}
	}

	public static String updateUserRepresentation(UserMaster userMaster) {
		if (serviceKeycloak == null) {
			serviceKeycloak = connectServiceAccount();
		}
		RealmResource realmResource = serviceKeycloak.realm(SSO_REALM_NAME);
		if (realmResource != null) {
			UsersResource usersRessource = realmResource.users();
			try {
				UserResource userResource = usersRessource.get(userMaster.getKcUserId());
				UserRepresentation userRepresentation = userResource.toRepresentation();
				userRepresentation.setFirstName(userMaster.getFirstName());
				userRepresentation.setLastName(userMaster.getLastName());
				userRepresentation.setEmail(userMaster.getEmailId());
				userRepresentation.setEnabled(userMaster.getIsActive());
				userResource.update(userRepresentation);
				return AbstractPageController.STATUS_FOR_UPDATE;
			} catch (ClientErrorException e) {
				handleClientErrorException(e);
			} catch (Exception e) {
				Throwable cause = e.getCause();
				if (cause instanceof ClientErrorException) {
					handleClientErrorException((ClientErrorException) cause);
				} else {
					log.debug(e.getStackTrace());
				}
			}
		}

		return AbstractPageController.STATUS_FOR_ERROR;
	}
}