package com.chahar.keycloak.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.chahar.keycloak.model.UserMaster;

@Controller
public class MainPageController extends AbstractPageController {

	private final HttpServletRequest request;
	private static final String VIEW_NAME_HOME_PAGE = "homePage";

	@Autowired
	public MainPageController(HttpServletRequest request) {
		this.request = request;
	}

	@GetMapping(value = { "/", "/landingPage" })
	public String getHome() {
		return "index";
	}

	@GetMapping(value = "/logout")
	public String logout() throws ServletException {
		request.logout();
		return "redirect:/landingPage";
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
//		if (userMaster.getImageName() == null) {
//			return new ModelAndView(REDIRECT_URL_FOR_PROFILE, model);
//		}
//		model.addAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMaster);
		return new ModelAndView(VIEW_NAME_HOME_PAGE, model);
	}
}
