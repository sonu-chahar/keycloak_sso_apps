package com.keycloak.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.keycloak.model.CustomUserSessionRepresentation;
import com.keycloak.model.UserMaster;
import com.keycloak.service.CustomUserSessionRepresentationService;
import com.keycloak.service.UserMasterService;
import com.keycloak.util.GeoIP;
import com.keycloak.util.KeycloakAdminClientApp;
import com.keycloak.util.RawDBDemoGeoIPLocationUtil;
import com.maxmind.geoip2.exception.GeoIp2Exception;

@Controller
public class MainPageController extends AbstractPageController {

	private static final String USER_STATS_CLASSNAME_FOR_MESSAGE = "User Stats";
	private static final String MODEL_ATTRIBTE_FOR_LOGIN_STATS = "userLoginStatList";
	private static final String MODEL_ATTRIBTE_FOR_APPLICATION_LIST = "applicationList";
	private static final String CONSTANT_FOR_LOCALHOST = "127.0.0.1";

	private final HttpServletRequest request;

	@Autowired
	private UserMasterService userMasterService;

	@Autowired
	private CustomUserSessionRepresentationService customUserSessionRepresentationService;

	@Autowired
	public MainPageController(HttpServletRequest request) {
		this.request = request;
	}

	@GetMapping({ "/" })
	public ModelAndView getHomePageWithChart() {
		return new ModelAndView(REDIRECT_URL_FOR_HOMEPAGE_WITH_CHART);
	}

	@GetMapping({ "/homePageInternationalization" })
	public ModelAndView getHomePageWithInternationalization() {
		return new ModelAndView(VIEW_NAME_HOME_PAGE_WITH_INTERNATIONALIZATION);
	}

	@GetMapping(value = "/homePage*")
	public ModelAndView getHomePageWithChart(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		model.addAttribute("userStats", userMasterService.getStats());
		model.addAttribute(MODEL_ATTRIBUTE_MESSAGE,
				getMessageAttributeForPage(request, USER_STATS_CLASSNAME_FOR_MESSAGE));
		return new ModelAndView(VIEW_NAME_HOME_PAGE_WITH_CHART, model);
	}

	@GetMapping(value = "/sso/logout")
	public ModelAndView logout(HttpServletRequest request) throws ServletException {
		if (request == null) {
			this.request.logout();
		} else {
			request.logout();
		}
		return new ModelAndView(REDIRECT_URL_FOR_HOMEPAGE_WITH_CHART + "#googtrans(en|en)");
	}

	@GetMapping(value = { "/landingPage", "/viewHomePage" })
	public ModelAndView welcome(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

		UserMaster userMaster = getUserMasterFromSession(request);

		if (userMaster == null) {
			model.addAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMaster);
			return new ModelAndView(VIEW_NAME_HOME_PAGE, model);
		}

		setUserSessionStats(userMaster);

		if (userMaster.getUserIpAddress() != null
				&& checkGeoLocation(userMaster.getUserIpAddress(), getClientIp(request))) {
			model.addAttribute(REQUEST_ATTRIBUTE_VERIFY_MOBILE, "Please re-verify mobile number!!!");
			return new ModelAndView(REDIRECT_URL_FOR_PROFILE, model);
		}

		if (userMaster.getImageName() == null) {
			return new ModelAndView(REDIRECT_URL_FOR_PROFILE, model);
		}
		model.addAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMaster);
		model.addAttribute(MODEL_ATTRIBTE_FOR_APPLICATION_LIST,
				userMasterService.getApplicationListByUserId(userMaster.getId()));
		model.addAttribute(MODEL_ATTRIBUTE_MESSAGE, getMessageAttributeForPage(request, USER_CLASSNAME_FOR_MESSAGE));
		return new ModelAndView(VIEW_NAME_HOME_PAGE, model);
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
			LOGGER.debug(e.getStackTrace());
		}

		return false;
	}

	@GetMapping({ "**/passwordPolicy.html" })
	public String showPasswordPolicyPage() {
		return "passwordPolicy";
	}

	@GetMapping({ "**/websitePolicy.html" })
	public String showWebsitePolicyPage() {
		return "websitePolicy";
	}

	@GetMapping({ "**/loginHistory.html" })
	public ModelAndView showLoginHistoryPage(HttpServletRequest request, ModelMap model) {
		UserMaster userMaster = getUserMasterFromSession(request);
		model.addAttribute(MODEL_ATTRIBTE_FOR_LOGIN_STATS,
				customUserSessionRepresentationService.getLoginStats(userMaster.getKcUserId()));
		return new ModelAndView(VIEW_NAME_LOGIN_HISTORY_PAGE, model);
	}

	private boolean setUserSessionStats(UserMaster userMaster) {
		List<CustomUserSessionRepresentation> userLoginStatList = customUserSessionRepresentationService
				.getLoginStats(userMaster.getKcUserId());
		CustomUserSessionRepresentation customUserSessionRepresentation = KeycloakAdminClientApp
				.getCustomUserSessionRepresentation(userMaster);
		if (userLoginStatList.size() > 5) {
			customUserSessionRepresentationService.remove(userLoginStatList.get(0).getId());
		}
		try {
			if (userLoginStatList.isEmpty() || (!userLoginStatList.isEmpty() && !customUserSessionRepresentation
					.getStart().equals(userLoginStatList.get(userLoginStatList.size() - 1).getStart()))) {
				customUserSessionRepresentation.setInsDate(new Date());
				customUserSessionRepresentationService.save(customUserSessionRepresentation);
				return true;
			}
		} catch (Exception e) {
			LOGGER.debug(e.getStackTrace());
		}
		return false;
	}
}
