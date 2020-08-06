package com.keycloak.config;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.resource.ClientsResource;
import org.keycloak.admin.client.resource.RealmResource;
import org.keycloak.admin.client.resource.UsersResource;
import org.keycloak.representations.idm.ClientRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.keycloak.model.UserStats;
import com.keycloak.service.UserMasterService;
import com.keycloak.util.Constants;
import com.keycloak.util.KeycloakAdminClientApp;

@Component
public class UserStatsScheduledTask {

	@Value("${keycloak.auth-server-url}")
	private String keycloakServerUrl;

	@Value("${keycloak.realm}")
	private String realmName;

	private static Keycloak serviceKeycloak = KeycloakAdminClientApp.getServiceKeycloak();

	@Autowired
	private UserMasterService userMasterService;

	protected final Logger log = LogManager.getLogger(this.getClass());

	public static final String SSO_REALM_NAME = Constants.pathString("SSO_REALM_NAME");

	@Scheduled(fixedRate = 900000)
	public void performTask() {
		if (serviceKeycloak != null) {

			RealmResource realmResource = serviceKeycloak.realm(SSO_REALM_NAME);
			UsersResource userRessource = realmResource.users();
			List<UserRepresentation> userRepresentationList = userRessource.list();
			Integer activeUsers = 0;

			for (int index = 0; index < userRepresentationList.size(); index++) {
				UserRepresentation userRepresentation = userRepresentationList.get(index);
				if (userRepresentation.isEnabled() != null && userRepresentation.isEnabled().booleanValue()) {
					activeUsers++;
				}
			}

			Integer allUsers = userRepresentationList.size();
			UserStats userStats = userMasterService.getStats();

			userStats.setAllUsers(allUsers.toString());
			userStats.setActiveUsers(activeUsers.toString());

			Integer integratedApps = 0;
			ClientsResource clientResource = realmResource.clients();
			List<ClientRepresentation> clientRepresentationList = clientResource.findAll();
			for (int i = 0; i < clientRepresentationList.size(); i++) {
				integratedApps = integratedApps + clientRepresentationList.size();
			}
			if (clientRepresentationList.size() > 5) {
				userStats.setIntegratedApps((clientRepresentationList.size() - 5) + "");
			} else {
				userStats.setIntegratedApps(clientRepresentationList.size() + "");
			}

			Integer activeSessions = 0;
			List<Map<String, String>> list = realmResource.getClientSessionStats();
			for (int i = 0; i < list.size(); i++) {
				Map<String, String> map = list.get(i);
				activeSessions = activeSessions + Integer.parseInt(map.get("active"));
			}
			userStats.setActiveSessions(activeSessions + "");

			userMasterService.saveUserStats(userStats);

			log.debug("Regular task performed at {}", new Date());
		}
	}
}
