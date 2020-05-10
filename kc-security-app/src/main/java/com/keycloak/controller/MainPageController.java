package com.keycloak.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.keycloak.model.UserMaster;
import com.keycloak.service.UserMasterService;
import com.keycloak.util.GeoIP;
import com.keycloak.util.RawDBDemoGeoIPLocationUtil;
import com.maxmind.geoip2.exception.GeoIp2Exception;

@Controller
public class MainPageController extends AbstractPageController {

	private final HttpServletRequest request;

	@Autowired
	private UserMasterService userMasterService;

	@Autowired
	public MainPageController(HttpServletRequest request) {
		this.request = request;
	}

	@GetMapping(value = "/")
	public String getHome() {
		return "redirect:/landingPage";
	}

	@GetMapping(value = "/landingPage")
	public String getLandingPage() {
//		return "index";
		return "redirect:/viewHomePage";
	}

	@GetMapping(value = "/sso/logout")
	public String logout() throws ServletException {
		request.logout();
		return "redirect:/viewHomePage";
	}

	@GetMapping({ "/viewHomePage" })
	public ModelAndView welcome(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
//		KeycloakSecurityContext securityContext = (KeycloakSecurityContext) request
//				.getAttribute(KeycloakSecurityContext.class.getName());

		UserMaster userMaster = getUserMasterFromSession(request);

		// create user
		/*
		 * if (BooleanUtils.isNotTrue(userMaster.getIsSSOUserCreated())) {
		 * if(KeycloakAdminClientApp.createUserAtKeycloak(userMaster)) {
		 * userMaster.setTempPassword(null); } }
		 */

//		create Role.
//		if(KeycloakAdminClientApp.createRoleInGivenRealm("DUMMY_ROLE")) {
//			LOGGER.debug("Role has been created...");
//		} 

//		get token
		// KeycloakAdminClientApp.getAccessToken(userMaster);
		// KeycloakClientAuthApp.getToken(userMaster);
//		String accessToken=KeycloakHttpClientGetPostApp.demoPostRESTAPI(userMaster);
//		response.addHeader("Authorization", "Bearer "+accessToken);

		if (userMaster == null) {
			model.addAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMaster);
			return new ModelAndView(VIEW_NAME_HOME_PAGE, model);
		}

		if (userMaster.getUserIpAddress() != null) {
			if (checkGeoLocation(userMaster.getUserIpAddress(), getClientIp(request))) {
				model.addAttribute(REQUEST_ATTRIBUTE_VERIFY_MOBILE, "Please re-verify mobile number!!!");
				return new ModelAndView(REDIRECT_URL_FOR_PROFILE, model);
			}
		}

		if (userMaster.getImageName() == null) {
			return new ModelAndView(REDIRECT_URL_FOR_PROFILE, model);
		}
		model.addAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMaster);
		model.addAttribute("applicationList", userMasterService.getApplicationListByUserId(userMaster.getId()));
		model.addAttribute(MODEL_ATTRIBUTE_MESSAGE, getMessageAttributeForPage(request, USER_CLASSNAME_FOR_MESSAGE));
		return new ModelAndView(VIEW_NAME_HOME_PAGE, model);
	}

	private boolean checkGeoLocation(String registeredIp, String currentIp) {
		try {
			GeoIP registerdGeoIp = null;
			GeoIP currentGeopIP = null;

			if ("192.168.10.215".equals(registeredIp)) {
				registerdGeoIp = RawDBDemoGeoIPLocationUtil.getLocation("103.47.13.18");
			} else {
				registerdGeoIp = RawDBDemoGeoIPLocationUtil.getLocation(registeredIp);
			}
			if ("192.168.10.215".equals(currentIp)) {
//				currentGeopIP = RawDBDemoGeoIPLocationUtil.getLocation("139.167.64.226");
				currentGeopIP = RawDBDemoGeoIPLocationUtil.getLocation("185.80.220.94");

			} else {
				currentGeopIP = RawDBDemoGeoIPLocationUtil.getLocation(currentIp);
			}

			return registerdGeoIp != null && currentGeopIP != null && registerdGeoIp.getCountry() != null
					&& !registerdGeoIp.getCountry().equals(currentGeopIP.getCountry());

		} catch (IOException e) {
			e.printStackTrace();
		} catch (GeoIp2Exception e) {
			e.printStackTrace();
		}

		return false;
	}
}
