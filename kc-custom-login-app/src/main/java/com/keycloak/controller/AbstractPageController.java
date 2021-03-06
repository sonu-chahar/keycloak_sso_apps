package com.keycloak.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.keycloak.KeycloakSecurityContext;
import org.keycloak.representations.IDToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import com.keycloak.model.UserMaster;
import com.keycloak.service.UserMasterService;
import com.keycloak.util.Constants;

public abstract class AbstractPageController {
	public static final String SESSION_ATTRIBTE_FOR_USER_MASTER = "userMaster";
	public static final String SESSION_ATTRIBTE_FOR_GENERATED_OTP = "generatedOtp";

	public static final String REQUEST_ATTRIBUTE_STATUS = "status";
	public static final String REQUEST_ATTRIBUTE_VERIFY_MOBILE = "verifyMobileMsg";

	public static final String MODEL_ATTRIBUTE_MESSAGE = "message";
	public static final String MODEL_ATTRIBUTE_FOR_USER_MASTER = "userMasterDTO";
	public static final String MODEL_ATTRIBUTE_FOR_APPLICATION_MASTER_MAPPING = "applicationMasterDTO";
	public static final String MODEL_ATTRIBTE_FOR_LOGIN_STATS = "userLoginStatList";
	public static final String MODEL_ATTRIBTE_FOR_APPLICATION_LIST = "applicationList";
	public static final String MODEL_ATTRIBTE_FOR_EMPLOYEE_APPLICATION_LIST = "ndmcEmployeeApplicationList";
	public static final String MODEL_ATTRIBTE_FOR_NON_EMPLOYEE_APPLICATION_LIST = "nonNdmcEmployeeApplicationList";

	public static final String REDIRECT_URL_FOR_REGISTRATION = "redirect:/registration/showRegistrationPage?status=";
	public static final String REDIRECT_URL_FOR_HOMEPAGE = "redirect:/viewHomePage?status=";
	public static final String REDIRECT_URL_FOR_HOMEPAGE_WITH_CHART = "redirect:/homePage";
	public static final String REDIRECT_URL_FOR_PROFILE = "redirect:/myProfile/showProfile?status=";
	public static final String REDIRECT_URL_FOR_UPDATE_PASSWORD = "redirect:/myProfile/showChangePwdPage?status=";
	public static final String REDIRECT_URL_FOR_APPLICATION_MASTER_MAPPING = "redirect:/myProfile/addOrUpdateApplicationMapping?status=";
	public static final String REDIRECT_URL_FOR_APPLICATION_MASTER = "redirect:/myProfile/addOrUpdateApplicationMapping?status=";
	public static final String REDIRECT_URL_FOR_USER_REPORT = "redirect:/userReport/showUserReportPage?status=";

	public static final String USER_CLASSNAME_FOR_MESSAGE = "User";
	public static final String USER_STATS_CLASSNAME_FOR_MESSAGE = "User Stats";

	public static final String STATUS_FOR_SUCCESS = "success";
	public static final String STATUS_FOR_UPDATE = "updateSuccess";
	public static final String STATUS_FOR_DUPLICATE = "duplicate";
	public static final String STATUS_FOR_ERROR = "error";
	public static final String STATUS_FOR_DELETED = "deleted";
	public static final String STATUS_FOR_NOT_DELETED = "cannotdelete";
	public static final String STATUS_FOR_ALREADY_DELETED = "alreadydeleted";

	public static final String CONSTANT_FOR_IMAGE_PATH = "fileDir";
	public static final String CONSTANT_FOR_APPLICATION_ICON_IMAGE_PATH = "applicationIcons";
	public static final String CONSTANT_FOR_IMAGE_UPLOAD_STATUS = "imageStatus";
	public static final String CONSTANT_FOR_SLASH = "/";
	public static final String CONSTANT_FOR_DOT = ".";
	public static final String CONSTANT_FOR_BLANK_STRING = "";
	public static final String CONSTANT_FOR_TRUE_FLAG = "true";
	public static final String CONSTANT_FOR_SPAN_OPENNING_TAG = "<span>";
	public static final String CONSTANT_FOR_SPAN_CLOSING_TAG = "</span>";

	public static final String CONSTANT_FOR_LOCALHOST = "127.0.0.1";
	public static final String MESSAGE_FOR_DUPLICATE_MOBILE_NUBMER = "Mobile number is already used. Please enter different mobile number!!!";

	public static final String VIEW_NAME_HOME_PAGE = "homePage";
	public static final String VIEW_NAME_EMPLOYEE_HOME_PAGE = "employeeHomePage";
	public static final String VIEW_NAME_HOME_PAGE_WITH_CHART = "homePageWithChart2";
	public static final String VIEW_NAME_LOGIN_HISTORY_PAGE = "loginStats";
	public static final String VIEW_NAME_FOR_PROFILE = "myProfile";
	public static final String VIEW_NAME_FOR_PASSWORD_POLICY = "passwordPolicy";
	public static final String VIEW_NAME_FOR_WEBSITE_POLICY = "websitePolicy";
	public static final String VIEW_NAME_FOR_SITEMAP = "sitemap";

	public static final String VIEW_NAME_FOR_UPDATE_PASSWORD = "changePasswordPage";
	public static final String VIEW_NAME_FOR_ADD_APPLICATION = "addApplication2";

	public static final String SSO_SERVER_URL = Constants.pathString("SSO_SERVER_URL");
	public static final String SSO_REALM_NAME = Constants.pathString("SSO_REALM_NAME");
	public static final String SSO_CLIENT_ID = Constants.pathString("SSO_CLIENT_ID");
	public static final String SSO_CLIENT_SECRET_ID = Constants.pathString("SSO_CLIENT_SECRET_ID");
	public static final String SSO_USERNAME_SERVICE_ACCOUNT = Constants.pathString("SSO_USERNAME_SERVICE_ACCOUNT");
	public static final String SSO_PASSWORD_SERVICE_ACCOUNT = Constants.pathString("SSO_PASSWORD_SERVICE_ACCOUNT");

	public final Logger log = LogManager.getLogger(this.getClass());

	@Autowired
	private UserMasterService userMasterService;

	protected UserMaster getUserMasterFromSession(HttpServletRequest request) {
		return setUserMasterInSessionFromSecurityContextAndGetUserMasterFromSession(request);
	}

	public String getMessageAttributeForPage(HttpServletRequest request, String className) {
		String status = StringUtils.isNotBlank(request.getParameter(REQUEST_ATTRIBUTE_STATUS))
				? request.getParameter(REQUEST_ATTRIBUTE_STATUS)
				: CONSTANT_FOR_BLANK_STRING;
		String message = CONSTANT_FOR_BLANK_STRING;

		/* set success/error message if request is coming after add/edit */
		if (StringUtils.isNotBlank(status)) {
			if (StringUtils.equals(status, STATUS_FOR_SUCCESS))
				message = CONSTANT_FOR_SPAN_OPENNING_TAG + className + " Saved Successfully !"
						+ CONSTANT_FOR_SPAN_CLOSING_TAG;
			else if (StringUtils.equals(status, STATUS_FOR_UPDATE))
				message = CONSTANT_FOR_SPAN_OPENNING_TAG + className + " Updated Successfully !"
						+ CONSTANT_FOR_SPAN_CLOSING_TAG;
			else if (StringUtils.equals(status, STATUS_FOR_ERROR))
				message = CONSTANT_FOR_SPAN_OPENNING_TAG + "Some error occured!</span>";
			else if (StringUtils.equals(status, STATUS_FOR_DELETED))
				message = CONSTANT_FOR_SPAN_OPENNING_TAG + className + " Deleted Successfully !"
						+ CONSTANT_FOR_SPAN_CLOSING_TAG;
			else if (StringUtils.equals(status, STATUS_FOR_NOT_DELETED))
				message = CONSTANT_FOR_SPAN_OPENNING_TAG + "Can't delete this record it is being used"
						+ CONSTANT_FOR_SPAN_CLOSING_TAG;
			else if (StringUtils.equals(status, STATUS_FOR_ALREADY_DELETED))
				message = CONSTANT_FOR_SPAN_OPENNING_TAG + "<img src='" + request.getContextPath()
						+ "/images/iconWarning.gif'>DegreeCycle is Already Deleted !" + CONSTANT_FOR_SPAN_CLOSING_TAG;
			else if (StringUtils.equals(status, STATUS_FOR_DUPLICATE))
				message = CONSTANT_FOR_SPAN_OPENNING_TAG + "Duplicate Record found" + CONSTANT_FOR_SPAN_CLOSING_TAG;
			else
				message = status;
		}
		return message;
	}

	protected UserMaster setUserMasterInSessionFromSecurityContextAndGetUserMasterFromSession(
			HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		UserMaster userMaster = null;
		if (session != null) {
			UserMaster userMasterFromSession = ((UserMaster) session.getAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER));
			if (userMasterFromSession != null) {
				userMaster = userMasterFromSession;
			} else {
				userMaster = getUserMasterFromSecurityContext(request);
				//session = request.getSession();
				log.debug(session);
				session.setAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMaster);
			}
		} else {
			userMaster = getUserMasterFromSecurityContext(request);
			session = request.getSession();
			session.setAttribute(SESSION_ATTRIBTE_FOR_USER_MASTER, userMaster);
		}
		return userMaster;
	}

	private UserMaster getUserMasterFromSecurityContext(HttpServletRequest request) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username = null;
		UserMaster persistedUserMaster = null;
		String password = CONSTANT_FOR_BLANK_STRING;
		if (principal instanceof UserDetails) {
			username = ((UserDetails) principal).getUsername();
			password = ((UserDetails) principal).getPassword();
		} else {
			username = principal.toString();
		}
		KeycloakSecurityContext context = (KeycloakSecurityContext) request
				.getAttribute(KeycloakSecurityContext.class.getName());
		if (context != null) {
			IDToken token = context.getIdToken();
			Map<String, Object> otherClaims = token.getOtherClaims();

			if (username != null) {
				persistedUserMaster = userMasterService.findByUsername(username);

				if (persistedUserMaster != null) {
					if (persistedUserMaster.getKcUserId() == null) {
						userMasterService.remove(persistedUserMaster.getId());
					} else {
						persistedUserMaster.setKcUserId(token.getSubject());
						persistedUserMaster.setUsername(token.getPreferredUsername());
						persistedUserMaster.setEmailId(token.getEmail());
						persistedUserMaster.setFirstName(token.getGivenName());
						persistedUserMaster.setLastName(token.getFamilyName());
						
						if (getMobileNumberFromClaims(otherClaims) != null) {
							persistedUserMaster.setMobileNumber(getMobileNumberFromClaims(otherClaims));
						}
					}
				} else {
					persistedUserMaster = new UserMaster();
					persistedUserMaster.setKcUserId(token.getSubject());
					persistedUserMaster.setUsername(token.getPreferredUsername());
					persistedUserMaster.setEmailId(token.getEmail());
					persistedUserMaster.setFirstName(token.getGivenName());
					persistedUserMaster.setLastName(token.getFamilyName());

					if (getMobileNumberFromClaims(otherClaims) != null) {
						persistedUserMaster.setMobileNumber(getMobileNumberFromClaims(otherClaims));
					}

					persistedUserMaster = userMasterService.save(persistedUserMaster);
				}
			}
		}
		return persistedUserMaster;
	}

	public String getMobileNumberFromClaims(Map<String, Object> otherClaims) {
		if (otherClaims.containsKey("phoneNumber")) {
			String mobileNumber = String.valueOf(otherClaims.get("phoneNumber"));
			if (mobileNumber.length() >= 10) {
				return mobileNumber.substring(mobileNumber.length() - 10);
			}
		}
		return null;
	}

	public KeycloakSecurityContext getKeycloakSecurityContext(HttpServletRequest request) {
		return (KeycloakSecurityContext) request.getAttribute(KeycloakSecurityContext.class.getName());
	}

	public static String getClientIp(HttpServletRequest request) {

		String remoteAddr = CONSTANT_FOR_BLANK_STRING;

		if (request != null) {
			remoteAddr = request.getHeader("X-FORWARDED-FOR");
			if (remoteAddr == null || CONSTANT_FOR_BLANK_STRING.equals(remoteAddr)) {
				remoteAddr = request.getRemoteAddr();
			}
		}

		return remoteAddr;
	}
}