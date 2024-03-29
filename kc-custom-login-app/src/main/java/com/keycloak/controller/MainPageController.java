package com.keycloak.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.keycloak.admin.client.Keycloak;
import org.keycloak.admin.client.resource.ClientResource;
import org.keycloak.admin.client.resource.ClientsResource;
import org.keycloak.admin.client.resource.RealmResource;
import org.keycloak.admin.client.resource.UsersResource;
import org.keycloak.representations.idm.ClientRepresentation;
import org.keycloak.representations.idm.UserRepresentation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.keycloak.model.CustomUserSessionRepresentation;
import com.keycloak.model.UserMaster;
import com.keycloak.model.UserStats;
import com.keycloak.service.CustomUserSessionRepresentationService;
import com.keycloak.service.UserMasterService;
import com.keycloak.util.Constants;
import com.keycloak.util.GeoIP;
import com.keycloak.util.KeycloakAdminClientApp;
import com.keycloak.util.RawDBDemoGeoIPLocationUtil;
import com.maxmind.geoip2.exception.GeoIp2Exception;

@Controller
public class MainPageController extends AbstractPageController {

	private final HttpServletRequest request;

	@Autowired
	private UserMasterService userMasterService;

	@Autowired
	private CustomUserSessionRepresentationService customUserSessionRepresentationService;

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
	public MainPageController(HttpServletRequest request) {
		this.request = request;
	}

	@GetMapping({ "/" })
	public ModelAndView getHomePageWithChart() {
		return new ModelAndView(REDIRECT_URL_FOR_HOMEPAGE_WITH_CHART);
	}

	@GetMapping(value = "/homePage")
	public ModelAndView getHomePageWithChart(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		UserStats userStats = getUserStats();
		if (userStats == null) {
			String zeroStr = 0 + CONSTANT_FOR_BLANK_STRING;
			userStats = new UserStats(zeroStr, zeroStr, zeroStr, zeroStr);
		}
		model.addAttribute("userStats", userStats);
		model.addAttribute("realmName", realmName);
		model.addAttribute("clientName", clientName);

		model.addAttribute(MODEL_ATTRIBUTE_MESSAGE,
				getMessageAttributeForPage(request, USER_STATS_CLASSNAME_FOR_MESSAGE));
		model.addAttribute(MODEL_ATTRIBTE_FOR_APPLICATION_LIST, userMasterService.getApplicationList());
		return new ModelAndView(VIEW_NAME_HOME_PAGE_WITH_CHART, model);
	}

	@GetMapping(value = "/applicationIcons/{imageName}/{imageExtension}")
	@ResponseBody
	public void getApplciationIconImage(@PathVariable("imageName") String imageName,
			@PathVariable("imageExtension") String imageExtension, HttpServletResponse response) {
//		log.debug("request to get application Icon Image....");
		String fileDir = Constants.pathString(CONSTANT_FOR_APPLICATION_ICON_IMAGE_PATH);

		String filePath = fileDir + CONSTANT_FOR_SLASH + imageName + CONSTANT_FOR_DOT + imageExtension;

		List<String> imageExtensionList = new ArrayList<>();
		imageExtensionList.add("png");
		imageExtensionList.add("jpeg");
		imageExtensionList.add("jpg");
		imageExtensionList.add("gif");
		if (imageExtensionList.contains(imageExtension)) {
			response.setContentType("image/" + imageExtension);
			BufferedImage img = null;
			try (OutputStream out = response.getOutputStream();) {
				img = ImageIO.read(new File(filePath));
				ImageIO.write(img, imageExtension, out);
			} catch (IOException e) {
				log.error("File is not present OR access denied!");
			} finally {
				img = null;
			}
		}
	}

	@GetMapping(value = "/sso/logout")
	public ModelAndView logout(HttpServletRequest request) throws ServletException {
		if (request == null) {
			this.request.logout();
		} else {
			request.logout();
		}
		return new ModelAndView(REDIRECT_URL_FOR_HOMEPAGE_WITH_CHART);
	}

	@GetMapping(value = { "/landingPage", "/viewHomePage" })
	public ModelAndView welcome(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

		UserMaster userMaster = getUserMasterFromSession(request);

		if (userMaster == null) {
			model.addAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMaster);
			return new ModelAndView(VIEW_NAME_HOME_PAGE, model);
		}

		setUserSessionStats(userMaster, request);

		if (userMaster.getUserIpAddress() != null
				&& checkGeoLocation(userMaster.getUserIpAddress(), getClientIp(request))) {
			model.addAttribute(REQUEST_ATTRIBUTE_VERIFY_MOBILE, "Please re-verify mobile number!!!");
			return new ModelAndView(REDIRECT_URL_FOR_PROFILE, model);
		}

		if (userMaster.getPinCode() == null) {
			return new ModelAndView(REDIRECT_URL_FOR_PROFILE, model);
		}

		model.addAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMaster);
		model.addAttribute(MODEL_ATTRIBTE_FOR_APPLICATION_LIST,
				userMasterService.getApplicationListByUserId(userMaster.getId()));
		model.addAttribute(MODEL_ATTRIBUTE_MESSAGE, getMessageAttributeForPage(request, USER_CLASSNAME_FOR_MESSAGE));

		boolean isEmployee = false;
		model.addAttribute(MODEL_ATTRIBTE_FOR_NON_EMPLOYEE_APPLICATION_LIST,
				userMasterService.getApplicationListByUserId(userMaster.getId(), isEmployee));

		if ("ndmcEmployee".equals(userMaster.getUserType())) {
			isEmployee = true;
			model.addAttribute(MODEL_ATTRIBTE_FOR_EMPLOYEE_APPLICATION_LIST,
					userMasterService.getApplicationListByUserId(userMaster.getId(), isEmployee));
			return new ModelAndView(VIEW_NAME_EMPLOYEE_HOME_PAGE, model);
		} else {
			return new ModelAndView(VIEW_NAME_HOME_PAGE, model);
		}
	}

	private boolean checkGeoLocation(String registeredIp, String currentIp) {
		try {
			GeoIP registerdGeoIp = null;
			GeoIP currentGeopIP = null;

			if (CONSTANT_FOR_LOCALHOST.equals(registeredIp)) {
				registerdGeoIp = RawDBDemoGeoIPLocationUtil.getLocation("103.47.13.18");
			} else {
				registerdGeoIp = RawDBDemoGeoIPLocationUtil.getLocation(registeredIp);
			}
			if (CONSTANT_FOR_LOCALHOST.equals(currentIp)) {
				currentGeopIP = RawDBDemoGeoIPLocationUtil.getLocation("139.167.64.226");
			} else {
				currentGeopIP = RawDBDemoGeoIPLocationUtil.getLocation(currentIp);
			}

			return registerdGeoIp != null && currentGeopIP != null && registerdGeoIp.getCountry() != null
					&& !registerdGeoIp.getCountry().equals(currentGeopIP.getCountry());

		} catch (IOException | GeoIp2Exception e) {
			log.debug(e);
		}

		return false;
	}

	@GetMapping({ "**/passwordPolicy.html" })
	public String showPasswordPolicyPage() {
		return VIEW_NAME_FOR_PASSWORD_POLICY;
	}

	@GetMapping({ "**/websitePolicy.html" })
	public String showWebsitePolicyPage() {
		return VIEW_NAME_FOR_WEBSITE_POLICY;
	}

	@GetMapping({ "/sitemap.html" })
	public String showSitemapPage() {
		return VIEW_NAME_FOR_SITEMAP;
	}

	@GetMapping({ "**/loginHistory.html" })
	public ModelAndView showLoginHistoryPage(HttpServletRequest request, ModelMap model) {
		UserMaster userMaster = getUserMasterFromSession(request);
		model.addAttribute(MODEL_ATTRIBTE_FOR_LOGIN_STATS,
				customUserSessionRepresentationService.getLoginStats(userMaster.getKcUserId()));
		return new ModelAndView(VIEW_NAME_LOGIN_HISTORY_PAGE, model);
	}

	private boolean setUserSessionStats(UserMaster userMaster, HttpServletRequest request) {
		List<CustomUserSessionRepresentation> userLoginStatList = customUserSessionRepresentationService
				.getLoginStats(userMaster.getKcUserId());
		CustomUserSessionRepresentation customUserSessionRepresentation = KeycloakAdminClientApp
				.getCustomUserSessionRepresentation(userMaster);
		if (customUserSessionRepresentation != null) {
			if (userLoginStatList.size() > 5) {
				customUserSessionRepresentationService.remove(userLoginStatList.get(0).getId());
			}
			try {
				if (userLoginStatList.isEmpty() || (!userLoginStatList.isEmpty() && !customUserSessionRepresentation
						.getStart().equals(userLoginStatList.get(userLoginStatList.size() - 1).getStart()))) {
					customUserSessionRepresentation.setInsDate(new Date());
					customUserSessionRepresentation.setIpAddress(getClientIp(request));
					customUserSessionRepresentationService.save(customUserSessionRepresentation);
					return true;
				}
			} catch (Exception e) {
				log.debug(e);
			}
		}
		return false;
	}

	private UserStats getUserStats() {
		try {
			Keycloak serviceKeycloak = KeycloakAdminClientApp.getServiceKeycloak();
			RealmResource realmResource = serviceKeycloak.realm(SSO_REALM_NAME);
			UsersResource userRessource = realmResource.users();

			List<UserRepresentation> userRepresentationList = userRessource.list(0, Integer.MAX_VALUE);

			Integer allUsers = userRepresentationList.size();

			UserStats userStats = new UserStats();
			Integer activeSessions = 0;
			ClientsResource clientsResource = realmResource.clients();
			List<ClientRepresentation> clientRepresentationList = clientsResource.findAll();

			List<ClientRepresentation> clientRepresentations = clientsResource.findByClientId(SSO_CLIENT_ID);
			ClientRepresentation representation = clientRepresentations.get(0);
			ClientResource resource = clientsResource.get(representation.getId());
			activeSessions = resource.getApplicationSessionCount().get("count");

			userStats.setActiveSessions(--activeSessions + "");

			userStats.setAllUsers(allUsers.toString());
			userStats.setActiveUsers(userStats.getActiveSessions());

			userStats.setInactiveUsers(((Integer) (allUsers - activeSessions)).toString());

			Integer integratedApps = clientRepresentationList.size();
			if (integratedApps > 5) {
				userStats.setIntegratedApps((integratedApps - 5) + "");
			} else {
				userStats.setIntegratedApps(integratedApps + "");
			}

			return userStats;

		} catch (Exception e) {
			log.debug("error occurred while performing ScheduledTask!! ", e);
		}
		return null;
	}
}
