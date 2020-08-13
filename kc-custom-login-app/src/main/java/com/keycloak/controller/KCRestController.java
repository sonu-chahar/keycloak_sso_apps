package com.keycloak.controller;

import java.io.IOException;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.keycloak.authorization.client.util.Http;
import org.keycloak.representations.AccessTokenResponse;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.keycloak.model.UserMaster;
import com.keycloak.model.UserMasterVO;
import com.keycloak.service.UserMasterService;
import com.keycloak.util.KeycloakAdminClientApp;

@RestController
public class KCRestController extends AbstractPageController {
	public static final String PARAMETER_USERNAME = "username";
	public static final String PARAMETER_KCUSERID = "kcUserId";
	@Autowired
	UserMasterService userMasterService;

	@Autowired
	ObjectMapper objectMapper;

	@GetMapping(value = "/fetchUserDetail/{username}/{kcUserId}")
	public UserMasterVO fetchUser(@PathVariable(PARAMETER_USERNAME) String username,
			@PathVariable(PARAMETER_KCUSERID) String kcUserId) {
		String columns[] = new String[] { PARAMETER_USERNAME, PARAMETER_KCUSERID };
		String values[] = new String[] { username, kcUserId };
		List<UserMaster> userMasterList = userMasterService.findValuesByColumns(columns, values);
		if (userMasterList.size() == 1) {
			UserMasterVO userMasterVO = new UserMasterVO();
			BeanUtils.copyProperties(userMasterList.get(0), userMasterVO);
			return userMasterVO;
		}
		return null;
	}

	@GetMapping(value = "/fetchUserDetails/{username}/{kcUserId}")
	public Object fetchUserJSonp(@PathVariable(PARAMETER_USERNAME) String username,
			@PathVariable(PARAMETER_KCUSERID) String kcUserId, HttpServletResponse response,
			HttpServletRequest request) {
		UserMaster userMaster = getUserMasterFromSession(request);
		if (userMaster != null && !username.equals(userMaster.getUsername())) {
			log.debug("{} :::: {}", userMaster.getUsername(), username);
			request.getSession(false).invalidate();
			try {
				request.getContextPath();
				log.debug("{} :: {}", request.getContextPath(), request.getServletPath());
				response.sendRedirect(request.getRequestURI());
			} catch (IOException e) {
				log.debug(e.getStackTrace());
			}
		}

		response.addHeader("Content-Type", "application/x-javascript");

		String columns[] = new String[] { PARAMETER_USERNAME, PARAMETER_KCUSERID };
		Serializable values[] = new Serializable[] { username, kcUserId };
		List<UserMaster> userMasterList = userMasterService.findValuesByColumns(columns, values);
		UserMasterVO userMasterVO = new UserMasterVO();
		if (userMasterList.isEmpty()) {
			BeanUtils.copyProperties(userMaster, userMasterVO);
		} else {
			BeanUtils.copyProperties(userMasterList.get(0), userMasterVO);
		}
		if (userMasterVO.getEmployeeCode() == null) {
			userMasterVO.setEmployeeCode("");
		}
		return convertToJsonP(userMasterVO);
	}

	@RequestMapping(value = "/fetchUserDetails", produces = { "application/x-javascript" })
	public Object fetchUserJSonp(@RequestBody UserMasterVO userMasterVO) {
		String columns[] = new String[] { PARAMETER_USERNAME, PARAMETER_KCUSERID };
		Serializable values[] = new Serializable[] { userMasterVO.getUsername(), userMasterVO.getKcUserId() };
		List<UserMaster> userMasterList = userMasterService.findValuesByColumns(columns, values);
		if (!userMasterList.isEmpty()) {
			UserMasterVO persistedUserMasterVO = new UserMasterVO();
			BeanUtils.copyProperties(userMasterList.get(0), persistedUserMasterVO);
			if (persistedUserMasterVO.getEmployeeCode() == null) {
				persistedUserMasterVO.setEmployeeCode("");
			}
			return convertToJsonP(persistedUserMasterVO);
		}
		return "userDetails()";
	}

	private String convertToJsonP(Object o) {
		String outputmessage = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			outputmessage = mapper.writeValueAsString(o);
		} catch (Exception e) {
			log.debug(e.getStackTrace());
		}
		if (outputmessage != null) {
			outputmessage = "userDetails(" + outputmessage + ")";
		}
		return outputmessage;
	}

	public AccessTokenResponse refreshToken(String refreshToken) {
		String url = KeycloakAdminClientApp.SSO_SERVER_URL + "/realms/" + KeycloakAdminClientApp.SSO_REALM_NAME
				+ "/protocol/openid-connect/token";
		Http http = new Http(kcConfig(), (params, headers) -> {
		});

		return http.<AccessTokenResponse>post(url).authentication().client().form().param("grant_type", "refresh_token")
				.param("refresh_token", refreshToken).param("client_id", KeycloakAdminClientApp.SSO_CLIENT_ID)
				.param("client_secret", KeycloakAdminClientApp.SSO_CLIENT_SECRET_ID).response()
				.json(AccessTokenResponse.class).execute();
	}

	@Bean
	public org.keycloak.authorization.client.Configuration kcConfig() {
		Map<String, Object> map = new HashMap<>();
		map.put(KeycloakAdminClientApp.SSO_CLIENT_ID, KeycloakAdminClientApp.SSO_CLIENT_SECRET_ID);
		return new org.keycloak.authorization.client.Configuration(KeycloakAdminClientApp.SSO_SERVER_URL,
				KeycloakAdminClientApp.SSO_REALM_NAME, KeycloakAdminClientApp.SSO_CLIENT_ID, map, null);
	}

}
