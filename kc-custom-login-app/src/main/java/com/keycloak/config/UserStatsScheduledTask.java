package com.keycloak.config;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.resource.ClientResource;
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

	@Value("${keycloak.resource}")
	private String clientName;

	@Value("${keycloak.credentials.secret}")
	private String clientId;

	@Value("${SSO_USERID_SERVICE_ACCOUNT}")
	private String serviceAccountUserId;

	@Autowired
	private UserMasterService userMasterService;

	protected final Logger log = LogManager.getLogger(this.getClass());

	public static final String SSO_REALM_NAME = Constants.pathString("SSO_REALM_NAME");

	@Scheduled(fixedRate = 900000)
	public void performTask() {

		try {
			Keycloak serviceKeycloak = KeycloakAdminClientApp.getServiceKeycloak();
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

			DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy hh:mm");
			String strDate = dateFormat.format(Calendar.getInstance().getTime());
			UserStats userStats = userMasterService.getStats();

			userStats.setAllUsers(allUsers.toString());
			userStats.setActiveUsers(activeUsers.toString());
			userStats.setInactiveUsers(((Integer) (allUsers - activeUsers)).toString());
			userStats.setDateSaved(strDate);
			ClientsResource clientsResource = realmResource.clients();
			List<ClientRepresentation> clientRepresentationList = clientsResource.findAll();
			Integer integratedApps = clientRepresentationList.size();

			if (integratedApps > 5) {
				userStats.setIntegratedApps((integratedApps - 5) + "");
			} else {
				userStats.setIntegratedApps(integratedApps + "");
			}

			Integer activeSessions = 0;

			List<ClientRepresentation> clientRepresentations = clientsResource.findByClientId(clientName);
			ClientRepresentation representation = clientRepresentations.get(0);
			ClientResource resource = clientsResource.get(representation.getId());
			activeSessions = resource.getApplicationSessionCount().get("count");

			userStats.setActiveSessions(--activeSessions + "");

			userMasterService.saveUserStats(userStats);

			log.debug("Regular task performed at {}", new Date());

		} catch (Exception e) {
			log.debug("error occurred while performing ScheduledTask!! ", e);
		}
	}
}
